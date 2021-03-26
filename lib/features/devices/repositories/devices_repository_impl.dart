import 'dart:async';

import 'package:hapoc/core/db/database.dart';
import 'package:hapoc/features/devices/entities/device.dart';

import 'devices_repository.dart';

class DevicesRepositoryImpl implements DevicesRepository {
  final Database db;

  DevicesRepositoryImpl(this.db);

  StreamController<List<Device>> _controller;
  StreamSubscription _dbSubscription;

  @override
  Stream<List<Device>> listen() {
    dispose();
    _controller = StreamController();
    db.watchStates().listen(_onData);
    return _controller.stream;
  }

  @override
  void dispose() {
    _controller?.close();
    _controller = null;
    _dbSubscription?.cancel();
    _dbSubscription = null;
  }

  Future<void> _onData(List<State> data) async {
    final result = data.map((state) => Device(
      entityId: state.entityId,
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
    )).toList();

    _controller?.sink?.add(result);
  }
}