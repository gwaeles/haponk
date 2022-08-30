import 'dart:async';
import 'dart:math';

import 'package:haponk/data/tabs/entities/flex_tab.dart';
import 'package:haponk/data/tabs/repositories/tabs_repository.dart';

class TabsProvider {
  final TabsRepository repository;

  TabsProvider(this.repository);

  StreamController<List<FlexTab>>? _controller;
  StreamSubscription? _repoSubscription;
  List<FlexTab>? _data;

  Stream<List<FlexTab>> get tabsStream {
    _controller = StreamController<List<FlexTab>>();
    _controller!.onCancel = () => _onControllerCancelled(_controller!);

    // Repo stream subscription
    _repoSubscription?.cancel();
    _repoSubscription = repository.watch().listen(_onData);

    return _controller!.stream;
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
    _controller?.sink.add(_data!);
  }

  ///
  /// --- ACTIONS --- ///
  ///

  void createItem() {
    int position = 1;

    _data?.forEach((element) => position = max(position, element.order + 1));

    repository.insert(
      label: "Tab $position",
      order: position,
    );
  }

  void deleteItemByIndex(int index) {
    if (_data != null && index >= 0 && index < _data!.length) {
      int tabId = _data!.elementAt(index).id ?? 0;

      repository.delete(id: tabId);
    }
  }

  void updateItemByIndex({
    required String label,
    required int index,
  }) {
    if (_data != null && index >= 0 && index < _data!.length) {
      int tabId = _data!.elementAt(index).id ?? 0;

      repository.update(
        id: tabId,
        label: label,
      );
    }
  }
}
