import 'dart:async';

import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';

class DevicesNotifier {
  final DevicesRepository repository;

  DevicesNotifier(this.repository);

  StreamController<List<Device>?>? _controller;
  StreamSubscription? _repoSubscription;
  List<Device>? _data;
  String? _searchText;

  Stream<List<Device>?> get deviceStream {
    _controller = StreamController<List<Device>?>();
    _controller!.onCancel = () => _onControllerCancelled(_controller!);

    // Repo stream subscription
    _repoSubscription?.cancel();
    _repoSubscription = repository.addListener().listen(_onData);

    return _controller!.stream;
  }

  void _onControllerCancelled(StreamController<List<Device>?> controller) {
    print("[GWA] Provider _controller.onCancel");
    dispose();
  }

  void dispose() {
    print("[GWA] Provider dispose");
    _controller?.close();
    _controller = null;

    _repoSubscription?.cancel();
    _repoSubscription = null;
  }

  Future<void> _onData(List<Device> data) async {
    _data = data;
    _onFilterData();
  }

  void search(String value) {
    _searchText = value;
    final request = value;
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      if (request == _searchText) {
        _onFilterData();
      }
    });
  }

  Future<void> _onFilterData() async {
    List<Device>? result;

    if (_data != null) {
      result = _data!
          .where((element) =>
              _searchText == null ||
              _searchText!.isEmpty ||
              element.friendlyName?.contains(_searchText!) == true)
          .toList();
    }

    _controller?.sink.add(result);
  }
}
