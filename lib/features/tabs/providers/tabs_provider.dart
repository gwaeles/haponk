import 'dart:async';

import 'package:haponk/features/tabs/entities/flex_tab.dart';
import 'package:haponk/features/tabs/repositories/tabs_repository.dart';

class TabsProvider {
  final TabsRepository repository;

  TabsProvider
  (this.repository);

  StreamController<List<FlexTab>> _controller;
  StreamSubscription _repoSubscription;
  List<FlexTab> _data;

  Stream<List<FlexTab>> get tabsStream {
    _controller = StreamController<List<FlexTab>>();
    _controller.onCancel = () => _onControllerCancelled(_controller);

    // Repo stream subscription
    _repoSubscription?.cancel();
    _repoSubscription = repository.watch().listen(_onData);

    return _controller.stream;
  }

  void _onControllerCancelled(StreamController<List<FlexTab>> controller) {
    print("[TABS] Provider _controller.onCancel");
    dispose();
  }

  void dispose() {
    print("[TABS] Provider dispose");
    _controller?.close();
    _controller = null;

    _repoSubscription?.cancel();
    _repoSubscription = null;
  }

  Future<void> _onData(List<FlexTab> data) async {
    _data = data;
    _controller?.sink?.add(_data);
  }
}
