import 'dart:async';
import 'dart:math';

import 'package:haponk/features/tabs/entities/flex_card.dart';
import 'package:haponk/features/tabs/repositories/cards_repository.dart';

class CardsProvider {
  final CardsRepository repository;

  CardsProvider(this.repository);

  StreamController<List<FlexCard>> _controller;
  StreamSubscription _repoSubscription;
  List<FlexCard> _data;

  ///
  /// --- DATA STREAM --- ///
  ///

  Stream<List<FlexCard>> get cardsStream {
    _controller = StreamController<List<FlexCard>>();
    _controller.onCancel = () => _onControllerCancelled(_controller);

    // Repo stream subscription
    _repoSubscription?.cancel();
    _repoSubscription = repository.watch().listen(_onData);

    return _controller.stream;
  }

  void _onControllerCancelled(StreamController<List<FlexCard>> controller) {
    print("[CARDS] Provider _controller.onCancel");
    dispose();
  }

  void dispose() {
    print("[CARDS] Provider dispose");
    _controller?.close();
    _controller = null;

    _repoSubscription?.cancel();
    _repoSubscription = null;
  }

  Future<void> _onData(List<FlexCard> data) async {
    _data = data;
    _controller?.sink?.add(data);
  }

  ///
  /// --- ACTIONS --- ///
  ///

  void createItem() {
    int position = 1;

    _data?.forEach((element) => position = max(position, element.position + 1));

    repository.insert(
        type: "deft",
        position: position,
        horizontalFlex: 1,
        verticalFlex: 0,
        width: 0,
        height: 0);
  }

  Future<void> addChildItemAbove(FlexCard item) async {
    final dady = _data?.firstWhere((element) => element.id == item.parentId,
        orElse: () => null);

    int position = dady?.position ?? item.position;
    
    final List<FlexCard> updates = [];

    _data?.forEach((element) {
      if (position <= element.position) {
        updates.add(element.copyWith(
          position: element.position + 1,
        ));
      }
    });

    updates.forEach((element) => repository.update(element));

    repository.insert(
        type: "deft",
        position: position,
        horizontalFlex: 1,
        verticalFlex: 0,
        width: 0,
        height: 0);
  }

  Future<void> addChildItemBelow(FlexCard item) async {
    final dady = _data?.firstWhere((element) => element.id == item.parentId,
        orElse: () => null);

    int position = (dady?.position ?? item.position) + 1;
    
    final List<FlexCard> updates = [];

    _data?.forEach((element) {
      if (position <= element.position) {
        updates.add(element.copyWith(
          position: element.position + 1,
        ));
      }
    });

    updates.forEach((element) => repository.update(element));

    repository.insert(
        type: "deft",
        position: position,
        horizontalFlex: 1,
        verticalFlex: 0,
        width: 0,
        height: 0);
  }

  Future<void> addChildItemToTheLeft(FlexCard item) async {
    final dady = _data?.firstWhere((element) => element.id == item.parentId,
        orElse: () => null);

    if (dady == null) {
      // Create parent
      final parentId = await repository.insert(
          type: "row",
          position: item.position,
          horizontalFlex: 1,
          verticalFlex: 0,
          width: 0,
          height: 0);
      // Add existing child
      final firstChild = item.copyWith(
        parentId: parentId,
        position: 2,
      );
      await repository.update(firstChild);
      // Add new child
      repository.insert(
          parentId: parentId,
          type: "deft",
          position: 1,
          horizontalFlex: 1,
          verticalFlex: 0,
          width: 0,
          height: 0);
    } else {
      _createChildItem(dady, item.position);
    }
  }

  Future<void> addChildItemToTheRight(FlexCard item) async {
    final dady = _data?.firstWhere((element) => element.id == item.parentId,
        orElse: () => null);

    if (dady == null) {
      // Create parent
      final parentId = await repository.insert(
          type: "row",
          position: item.position,
          horizontalFlex: 1,
          verticalFlex: 0,
          width: 0,
          height: 0);
      // Add existing child
      final firstChild = item.copyWith(
        parentId: parentId,
        position: 1,
      );
      await repository.update(firstChild);
      // Add new child
      repository.insert(
          parentId: parentId,
          type: "deft",
          position: 2,
          horizontalFlex: 1,
          verticalFlex: 0,
          width: 0,
          height: 0);
    } else {
      _createChildItem(dady, item.position + 1);
    }
  }

  void _createChildItem(FlexCard _parentItem, int position) {
    final List<FlexCard> updates = [];

    _parentItem.children?.forEach((element) {
      if (position <= element.position) {
        updates.add(element.copyWith(
          position: element.position + 1,
        ));
      }
    });

    updates.forEach((element) => repository.update(element));

    repository.insert(
        parentId: _parentItem.id,
        type: "deft",
        position: position,
        horizontalFlex: 1,
        verticalFlex: 0,
        width: 0,
        height: 0);
  }

  void deleteItem(FlexCard item) {
    if (item.parentId == null || item.parentId <= 0) {
      repository.delete(id: item.id);
    } else {
      final dady = _data?.firstWhere((element) => element.id == item.parentId,
          orElse: () => null);
      if (dady == null) {
        repository.delete(id: item.id);
      } else {
        if (dady.children.length <= 2) {
          repository.delete(id: item.id);
          repository.delete(id: dady.id);
        } else {
          repository.delete(id: item.id);
        }
      }
    }
  }
}
