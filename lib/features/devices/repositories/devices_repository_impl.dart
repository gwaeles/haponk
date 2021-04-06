import 'dart:async';

import 'package:haponk/core/db/database.dart';
import 'package:haponk/features/devices/entities/device.dart';
import 'package:haponk/core/db/database_extension.dart';

import 'devices_repository.dart';

class DevicesRepositoryImpl implements DevicesRepository {
  final Database db;

  DevicesRepositoryImpl(this.db);

  final List<StreamController<List<Device>>> _controllers = [];
  StreamSubscription _dbSubscription;

  @override
  Stream<List<Device>> addListener() {
    print("[GWA] listen");

    final _controller = StreamController<List<Device>>();
    _controller.onCancel = () => _onControllerCancelled(_controller);
    _controller.onListen = () => print("[GWA] _controller.onListen");
    _controller.onPause = () => print("[GWA] _controller.onPause");
    _controller.onResume = () => print("[GWA] _controller.onResume");
    _controllers.add(_controller);

    // DB subscription
    _dbSubscription?.cancel();
    _dbSubscription = db.watchStates().listen(_onData);

    return _controller.stream;
  }

  @override
  void dispose() {
    print("[GWA] dispose");
    for (var _controller in _controllers) {
      _controller?.close();
    }
    _controllers.clear();

    _dbSubscription?.cancel();
    _dbSubscription = null;
  }

  void _onControllerCancelled(StreamController<List<Device>> controller) {
    _controllers.remove(controller);

    print(
        "[GWA] _controller.onCancel, listeners remaining: ${_controllers.length}");
    // Cancel DB subscription on last listener cancel
    if (_controllers.length == 0) {
      dispose();
    }
  }

  Future<void> _onData(List<State> data) async {
    final result = data
        .where((element) => element.deviceType() != null)
        .map((state) => Device(
              entityId: state.entityId,
              deviceType: state.deviceType(),
              state: state.state,
              lastChanged: state.lastChanged,
              lastUpdated: state.lastUpdated,
              friendlyName: state.friendlyName,
              supportedFeatures: state.supportedFeatures,
              currentPosition: state.currentPosition,
              lastTriggered: state.lastTriggered,
              mode: state.mode,
              temperature: state.temperature,
              humidity: state.humidity,
              pressure: state.pressure,
              windBearing: state.windBearing,
              windSpeed: state.windSpeed,
              attribution: state.attribution,
              isOn: state.isOn,
              deviceClass: state.deviceClass,
              unitOfMeasurement: state.unitOfMeasurement,
              current: state.current,
              voltage: state.voltage,
            ))
        .toList();

    for (var _controller in _controllers) {
      _controller?.sink?.add(result);
    }
  }
}
