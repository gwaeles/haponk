import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haponk/core/db/database.dart' as data;
import 'package:haponk/features/tabs/entities/flex_tab.dart' as ent;

import 'tabs_repository.dart';

class TabsRepositoryImpl implements TabsRepository {
  final data.Database db;

  TabsRepositoryImpl(this.db);

  final List<StreamController<List<ent.FlexTab>>> _controllers = [];
  StreamSubscription _dbSubscription;

  @override
  Stream<List<ent.FlexTab>> watch() {
    debugPrint("[TABS] watch");

    final _controller = StreamController<List<ent.FlexTab>>();
    _controller.onCancel = () => _onControllerCancelled(_controller);
    _controllers.add(_controller);

    // DB subscription
    _dbSubscription?.cancel();
    _dbSubscription = db.watchTabs().listen(_onData);

    return _controller.stream;
  }

  @override
  void dispose() {
    debugPrint("[TABS] dispose");
    for (var _controller in _controllers) {
      _controller?.close();
    }
    _controllers.clear();

    _dbSubscription?.cancel();
    _dbSubscription = null;
  }

  void _onControllerCancelled(StreamController<List<ent.FlexTab>> controller) {
    _controllers.remove(controller);

    debugPrint(
        "[TABS] _controller.onCancel, listeners remaining: ${_controllers.length}");
    // Cancel DB subscription on last listener cancel
    if (_controllers.length == 0) {
      dispose();
    }
  }

  Future<void> _onData(List<data.FlexTab> data) async {
    final result = data
        .map((object) => ent.FlexTab(
              id: object.id,
              label: object.label,
              order: object.order,
            ))
        .toList();

    for (var _controller in _controllers) {
      _controller?.sink?.add(result);
    }
  }
}
