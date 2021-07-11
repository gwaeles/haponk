import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haponk/core/db/database.dart' as data;
import 'package:haponk/features/tabs/entities/flex_card.dart' as ent;
import 'package:moor_flutter/moor_flutter.dart';

import 'cards_repository.dart';

class CardsRepositoryImpl implements CardsRepository {
  final data.Database db;
  final int tabId;

  CardsRepositoryImpl({
    required this.db,
    required this.tabId,
  });

  final List<StreamController<List<ent.FlexCard>>> _controllers = [];
  StreamSubscription? _dbSubscription;

  @override
  Stream<List<ent.FlexCard>> watch() {
    debugPrint("[CARDS] watch");

    final _controller = StreamController<List<ent.FlexCard>>();
    _controller.onCancel = () => _onControllerCancelled(_controller);
    _controllers.add(_controller);

    // DB subscription
    _dbSubscription?.cancel();
    _dbSubscription = db.watchCards(tabId).listen(_onData);

    return _controller.stream;
  }

  @override
  Future<int> insert({
    required String type,
    int? stateId,
    int? parentId,
    required int position,
    required int horizontalFlex,
    required int verticalFlex,
    required int width,
    required int height,
  }) async {
    return await db.insertFlexCard(data.FlexCardsCompanion.insert(
      tabId: tabId,
      parentId:
          parentId == null || parentId <= 0 ? Value.absent() : Value(parentId),
      type: type,
      position: position,
      horizontalFlex: horizontalFlex,
      verticalFlex: verticalFlex,
      width: width,
      height: height,
    ));
  }

  @override
  Future<bool> update(ent.FlexCard item) async {
    return await db.updateFlexCard(data.FlexCard(
      id: item.id,
      parentId: item.parentId,
      tabId: item.tabId,
      type: item.type,
      position: item.position,
      horizontalFlex: item.horizontalFlex,
      verticalFlex: item.verticalFlex,
      width: item.width,
      height: item.height,
    ));
  }

  @override
  Future<int> delete({
    required int id,
  }) async {
    await db.removeParentFlexCard(id);
    return await db.deleteFlexCard(id);
  }

  @override
  void dispose() {
    debugPrint("[CARDS] dispose");
    for (var _controller in _controllers) {
      _controller.close();
    }
    _controllers.clear();

    _dbSubscription?.cancel();
    _dbSubscription = null;
  }

  void _onControllerCancelled(StreamController<List<ent.FlexCard>> controller) {
    _controllers.remove(controller);

    debugPrint(
        "[CARDS] _controller.onCancel, listeners remaining: ${_controllers.length}");
    // Cancel DB subscription on last listener cancel
    if (_controllers.length == 0) {
      dispose();
    }
  }

  Future<void> _onData(List<data.FlexCard> dataList) async {
    final Map<int, List<ent.FlexCard>> children = {};

    // Children
    dataList
        .where((element) => element.parentId != null && element.parentId! > 0)
        .map((object) => ent.FlexCard(
              id: object.id,
              tabId: object.tabId,
              parentId: object.parentId,
              type: object.type,
              position: object.position,
              horizontalFlex: object.horizontalFlex,
              verticalFlex: object.verticalFlex,
              width: object.width,
              height: object.height,
            ))
        .forEach((element) {
      if (element.parentId != null && !children.containsKey(element.parentId)) {
        children[element.parentId!] = [];
      }
      children[element.parentId]!.add(element);
    });

    // Parents
    final result = dataList
        .where((element) => element.parentId == null || element.parentId! <= 0)
        .map((object) => ent.FlexCard(
              id: object.id,
              tabId: object.tabId,
              type: object.type,
              position: object.position,
              horizontalFlex: object.horizontalFlex,
              verticalFlex: object.verticalFlex,
              width: object.width,
              height: object.height,
              children: children[object.id],
            ))
        .toList();

    for (var _controller in _controllers) {
      _controller.sink.add(result);
    }
  }
}
