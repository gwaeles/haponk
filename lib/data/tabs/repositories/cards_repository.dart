import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haponk/core/db/database.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:moor_flutter/moor_flutter.dart';

class CardsRepository {
  final Database db;
  final int tabId;

  CardsRepository({
    required this.db,
    required this.tabId,
  });

  final List<StreamController<List<FlexCard>>> _controllers = [];
  StreamSubscription? _dbSubscription;

  Stream<List<FlexCard>> watch() {
    final _controller = StreamController<List<FlexCard>>();
    _controller.onCancel = () => _onControllerCancelled(_controller);
    _controllers.add(_controller);

    // DB subscription
    _dbSubscription?.cancel();
    _dbSubscription = db.watchCards(tabId).listen(_onData);

    return _controller.stream;
  }

  Future<int> insert({
    required String type,
    int? stateId,
    int? parentId,
    required int position,
    int horizontalFlex = 1,
    int height = 56,
    bool displayLeading = true,
    bool displayTrailing = true,
    bool displayTitle = true,
    bool displaySubtitle = true,
  }) async {
    return await db.insertFlexCard(
      FlexCardsCompanion.insert(
        tabId: tabId,
        parentId: parentId == null || parentId <= 0
            ? Value.absent()
            : Value(parentId),
        stateId:
            stateId == null || stateId <= 0 ? Value.absent() : Value(stateId),
        type: type,
        position: position,
        horizontalFlex: horizontalFlex,
        height: height,
        displayLeading: displayLeading ? 1 : 0,
        displayTrailing: displayTrailing ? 1 : 0,
        displayTitle: displayTitle ? 1 : 0,
        displaySubtitle: displaySubtitle ? 1 : 0,
      ),
    );
  }

  Future<bool> update(FlexCard item) async {
    return await db.updateFlexCard(FlexCardDBO(
      id: item.id,
      parentId: item.parentId,
      tabId: item.tabId,
      stateId: item.stateId,
      type: item.type,
      position: item.position,
      horizontalFlex: item.horizontalFlex,
      height: item.height,
      displayLeading: item.displayLeading ? 1 : 0,
      displayTrailing: item.displayTrailing ? 1 : 0,
      displayTitle: item.displayTitle ? 1 : 0,
      displaySubtitle: item.displaySubtitle ? 1 : 0,
    ));
  }

  Future updateList({
    List<FlexCard> itemsToUpdate = const [],
    List<FlexCard> itemsToDelete = const [],
    List<FlexCard> itemsToCreate = const [],
    FlexCard? newRowTargetChild,
    FlexCard? newRowAddedChild,
    int newRowAddedChildIndex = 0,
  }) async {
    final cardIdsToDelete = itemsToDelete.map((e) => e.id).toList();

    await db.updateFlexCardList(
      itemsToUpdate,
      cardIdsToDelete,
      itemsToCreate,
      newRowTargetChild,
      newRowAddedChild,
      newRowAddedChildIndex,
    );
  }

  Future<int> delete({
    required int id,
  }) async {
    await db.removeParentFlexCard(id);
    return await db.deleteFlexCard(id);
  }

  Future deleteList({
    required List<int> cardIdsToDelete,
  }) async {
    await db.updateFlexCardList(
      [],
      cardIdsToDelete,
      [],
      null,
      null,
      0,
    );
  }

  void dispose() {
    debugPrint("[CARDS] dispose");
    for (var _controller in _controllers) {
      _controller.close();
    }
    _controllers.clear();

    _dbSubscription?.cancel();
    _dbSubscription = null;
  }

  void _onControllerCancelled(StreamController<List<FlexCard>> controller) {
    _controllers.remove(controller);

    debugPrint(
        "[CARDS] _controller.onCancel, listeners remaining: ${_controllers.length}");
    // Cancel DB subscription on last listener cancel
    if (_controllers.length == 0) {
      dispose();
    }
  }

  Future<void> _onData(List<FlexCardDBO> dataList) async {
    final Map<int, List<FlexCard>> children = {};

    // Children
    dataList
        .where((element) => element.parentId != null && element.parentId! > 0)
        .map((object) => FlexCard(
              id: object.id,
              tabId: object.tabId,
              parentId: object.parentId,
              stateId: object.stateId,
              type: object.type,
              position: object.position,
              horizontalFlex: object.horizontalFlex,
              height: object.height,
              displayLeading: object.displayLeading == 1,
              displayTrailing: object.displayTrailing == 1,
              displayTitle: object.displayTitle == 1,
              displaySubtitle: object.displaySubtitle == 1,
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
        .map((object) => FlexCard(
              id: object.id,
              tabId: object.tabId,
              type: object.type,
              position: object.position,
              stateId: object.stateId,
              children: children[object.id],
              horizontalFlex: object.horizontalFlex,
              height: object.height,
              displayLeading: object.displayLeading == 1,
              displayTrailing: object.displayTrailing == 1,
              displayTitle: object.displayTitle == 1,
              displaySubtitle: object.displaySubtitle == 1,
            ))
        .toList();

    for (var _controller in _controllers) {
      _controller.sink.add(result);
    }
  }
}
