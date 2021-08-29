import 'dart:async';

import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';
import 'package:rxdart/rxdart.dart';

class DeviceProvider {
  final DevicesRepository repository;
  final int deviceId;

  DeviceProvider({
    required this.repository,
    required this.deviceId,
  });

  final _controller = BehaviorSubject<Device?>();
  StreamSubscription? _repoSubscription;

  ///
  /// --- SUBSCRIBTION --- ///
  ///

  Stream<Device?> get deviceStream {
    //_controller = StreamController<Device?>();
    _controller.onCancel = () => _onControllerCancelled();

    // Repo stream subscription
    _repoSubscription?.cancel();
    if (deviceId > 0) {
      _repoSubscription = repository.watchDevices().listen(_onData);
    }

    return _controller.stream;
  }

  void _onControllerCancelled() {
    print("[GWA] DeviceProvider _controller.onCancel");
    dispose();
  }

  void dispose() {
    print("[GWA] DeviceProvider dispose");
    _controller.close();
    //_controller = null;

    _repoSubscription?.cancel();
    _repoSubscription = null;
  }

  Future<void> _onData(List<Device>? _data) async {
    List<Device>? result;

    if (_data != null) {
      result = _data.where((element) => element.id == deviceId).toList();
    }

    final _device = result?.isNotEmpty == true ? result?.first : null;
    _controller.sink.add(_device);
  }
}
