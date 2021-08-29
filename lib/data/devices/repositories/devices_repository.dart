import 'dart:async';

import 'package:haponk/core/db/database.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/core/db/database_extension.dart';
import 'package:rxdart/rxdart.dart';

class DevicesRepository {
  final Database db;

  DevicesRepository(this.db);

  BehaviorSubject<List<DeviceType>>? _deviceTypecontroller;
  BehaviorSubject<List<Device>>? _deviceController;
  StreamSubscription? _dbSubscription;

  Stream<List<Device>> watchDevices() {
    print("[GWA] DevicesRepository watch Devices");

    if (_deviceController == null) {
      _deviceController = BehaviorSubject<List<Device>>();
      _deviceController!.onCancel = () => _onControllerCancelled();

      // DB subscription
      _dbSubscription?.cancel();
      _dbSubscription = db.watchStates().listen(_onData);
    }

    return _deviceController!.stream;
  }

  Stream<List<DeviceType>> watchDeviceTypes() {
    print("[GWA] DevicesRepository watch Device Types");

    if (_deviceTypecontroller == null) {
      _deviceTypecontroller = BehaviorSubject<List<DeviceType>>();
      _deviceTypecontroller!.onCancel = () => _onControllerCancelled();

      // DB subscription
      _dbSubscription?.cancel();
      _dbSubscription = db.watchStates().listen(_onData);
    }

    return _deviceTypecontroller!.stream;
  }

  void dispose() {
    print("[GWA] DevicesRepository dispose");
    _dbSubscription?.cancel();
    _dbSubscription = null;
  }

  void _onControllerCancelled() {
    print(
        "[GWA] _controller.onCancel, hasListener: ${_deviceTypecontroller?.hasListener} - ${_deviceController?.hasListener}");
    // Cancel DB subscription on last listener cancel
    if (_deviceTypecontroller?.hasListener != true &&
        _deviceController?.hasListener != true) {
      dispose();
    }
  }

  Future<void> _onData(List<StateDBO> data) async {
    final devices = data
        .where((element) => element.deviceType() != null)
        .map(
          (state) => Device(
            id: state.id,
            entityId: state.entityId,
            deviceType: state.deviceType()!,
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
          ),
        )
        .toList();
    final types = devices.map((element) => element.deviceType).toSet().toList();

    _deviceTypecontroller?.sink.add(types);
    _deviceController?.sink.add(devices);
  }
}
