import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haponk/core/hive/datasources/boxes_provider.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/rxdart.dart';

class DevicesRepository {
  final DeviceListBoxCallback deviceListBox;
  final DeviceBoxCallback deviceBox;

  DevicesRepository({
    required this.deviceListBox,
    required this.deviceBox,
  });

  BehaviorSubject<List<ComparableDevice>>? _deviceListcontroller;
  final Map<String, BehaviorSubject<Device>> _deviceControllerMap = {};
  StreamSubscription? _hiveSubscription;
  final Map<String, StreamSubscription> _hiveSubscriptionMap = {};

  Stream<List<ComparableDevice>> watchDevices() {
    print("[GWA] DevicesRepository watch ComparableDevice List");

    if (_deviceListcontroller == null) {
      _deviceListcontroller = BehaviorSubject<List<ComparableDevice>>();
      _deviceListcontroller!.onCancel = () => _onDeviceListControllerCancelled();
    }

    if (_hiveSubscription == null) {
      deviceListBox().then(
        (box) {
          _hiveSubscription?.cancel();
          _hiveSubscription = box.watch(key: deviceListHiveKey).listen(
                _onDeviceListBoxEvent,
              );
          if (_deviceListcontroller?.hasValue != true && box.containsKey(deviceListHiveKey)) {
            // Push current value on stream
            _onDeviceListBoxEvent(
              BoxEvent(
                deviceListHiveKey,
                box.get(deviceListHiveKey),
                false,
              ),
            );
          }
        },
      );
    }

    return _deviceListcontroller!.stream;
  }

  Stream<Device> watchDevice(String deviceId) {
    print("[GWA] DevicesRepository watch Device deviceId:$deviceId");

    final controller = _deviceControllerMap[deviceId] ?? BehaviorSubject<Device>();
    if (!_deviceControllerMap.containsKey(deviceId)) {
      controller.onCancel = () => _onDeviceControllerCancelled(deviceId);
      _deviceControllerMap[deviceId] = controller;
    }

    if (!_hiveSubscriptionMap.containsKey(deviceId)) {
      deviceBox().then(
        (box) {
          final hiveSubscription = box.watch(key: deviceId).listen(_onDeviceBoxEvent);
          _hiveSubscriptionMap[deviceId] = hiveSubscription;
          if (controller.hasValue != true && box.containsKey(deviceId)) {
            // Push current value on stream
            _onDeviceBoxEvent(
              BoxEvent(
                deviceId,
                box.get(deviceId),
                false,
              ),
            );
          }
        },
      );
    }

    return controller.stream;
  }

  void dispose() {
    print("[GWA] DevicesRepository dispose");
    _deviceListcontroller?.close();
    _deviceListcontroller = null;
    _hiveSubscription?.cancel();
    _hiveSubscription = null;
  }

  void _onDeviceListControllerCancelled() {
    print(
        "[GWA] _deviceListcontroller.onCancel, hasListener: ${_deviceListcontroller?.hasListener} - ${_deviceListcontroller?.hasListener}");
    // Cancel Hive subscription on last listener cancel
    if (_deviceListcontroller?.hasListener != true) {
      dispose();
    }
  }

  void _onDeviceControllerCancelled(String deviceId) {
    print(
        "[GWA] _onDeviceControllerCancelled.onCancel, hasListener: ${_deviceListcontroller?.hasListener} - ${_deviceListcontroller?.hasListener}");
    final controller = _deviceControllerMap[deviceId];
    final subscription = _hiveSubscriptionMap[deviceId];
    // Cancel DB subscription on last listener cancel
    if (controller?.hasListener != true) {
      controller?.close();
      subscription?.cancel();
      _deviceControllerMap.remove(deviceId);
      _hiveSubscriptionMap.remove(deviceId);
    }
  }

  Future<void> _onDeviceListBoxEvent(BoxEvent event) async {
    debugPrint("[DEVICES] _onDeviceListBoxEvent, key: ${event.key} ");
    if (event.value is List<ComparableDevice>) {
      _deviceListcontroller?.sink.add(event.value);
    }
  }

  Future<void> _onDeviceBoxEvent(BoxEvent event) async {
    debugPrint("[DEVICE] _onDeviceListBoxEvent, key: ${event.key} ");
    if (event.value is Device) {
      final deviceId = (event.value as Device).id;
      _deviceControllerMap[deviceId]?.sink.add(event.value);
    }
  }
}
