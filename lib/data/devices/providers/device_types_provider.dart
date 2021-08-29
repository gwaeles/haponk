import 'dart:async';

import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';

class DeviceTypesProvider {
  final DevicesRepository repository;

  DeviceTypesProvider(this.repository);

  StreamController<List<DeviceType>?>? _controller;
  StreamSubscription? _repoSubscription;

  Stream<List<DeviceType>?> get deviceTypeStream {
    _controller = StreamController<List<DeviceType>?>();
    _controller!.onCancel = () => _onControllerCancelled(_controller!);

    // Repo stream subscription
    _repoSubscription?.cancel();
    _repoSubscription = repository.watchDeviceTypes().listen(_onData);

    return _controller!.stream;
  }

  void _onControllerCancelled(StreamController<List<DeviceType>?> controller) {
    print("[GWA] DeviceTypesProvider _controller.onCancel");
    dispose();
  }

  void dispose() {
    print("[GWA] DeviceTypesProvider dispose");
    _controller?.close();
    _controller = null;

    _repoSubscription?.cancel();
    _repoSubscription = null;
  }

  Future<void> _onData(List<DeviceType> data) async {
    _controller?.sink.add(data);
  }
}
