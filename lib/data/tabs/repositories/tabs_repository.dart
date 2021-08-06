import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haponk/core/db/database.dart';
import 'package:haponk/data/tabs/entities/flex_tab.dart';

class TabsRepository {
  final Database db;

  TabsRepository(this.db);

  final List<StreamController<List<FlexTab>>> _controllers = [];
  StreamSubscription? _dbSubscription;

  Stream<List<FlexTab>> watch() {
    debugPrint("[TABS] watch");

    final _controller = StreamController<List<FlexTab>>();
    _controller.onCancel = () => _onControllerCancelled(_controller);
    _controllers.add(_controller);

    // DB subscription
    _dbSubscription?.cancel();
    _dbSubscription = db.watchTabs().listen(_onData);

    return _controller.stream;
  }

  Future<int> insert({
    required String label,
    required int order,
  }) async {
    return await db.insertFlexTab(FlexTabsCompanion.insert(
      label: label,
      order: order,
    ));
  }

  Future<int> delete({
    required int id,
  }) async {
    await db.removeFlexCardByTab(id);
    return await db.deleteFlexTab(id);
  }

  void dispose() {
    debugPrint("[TABS] dispose");
    for (var _controller in _controllers) {
      _controller.close();
    }
    _controllers.clear();

    _dbSubscription?.cancel();
    _dbSubscription = null;
  }

  void _onControllerCancelled(StreamController<List<FlexTab>> controller) {
    _controllers.remove(controller);

    debugPrint(
        "[TABS] _controller.onCancel, listeners remaining: ${_controllers.length}");
    // Cancel DB subscription on last listener cancel
    if (_controllers.length == 0) {
      dispose();
    }
  }

  Future<void> _onData(List<FlexTabDBO> data) async {
    final result = data
        .map((object) => FlexTab(
              id: object.id,
              label: object.label,
              order: object.order,
            ))
        .toList();

    for (var _controller in _controllers) {
      _controller.sink.add(result);
    }
  }
}
