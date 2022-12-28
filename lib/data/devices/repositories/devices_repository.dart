import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/core/hive/constants.dart';
import 'package:haponk/data/devices/datasources/devices_hive_source.dart';
import 'package:haponk/data/devices/models/comparable_device_list.dart';
import 'package:haponk/domain/devices/entities/device.dart';
import 'package:hive_flutter/hive_flutter.dart';

final devicesRepositoryProvider = Provider(DevicesRepository.new);

final deviceListProvider = StateProvider.autoDispose<List<ComparableDevice>?>(
  (ref) {
    final AsyncValue<Box<ComparableDeviceList>> asyncBox =
        ref.watch(deviceListBoxProvider);
    StreamSubscription? _hiveSubscription;

    // On dispose
    ref.onDispose(
      () {
        // Closes the StreamController when the state of this provider is destroyed.
        _hiveSubscription?.cancel();
      },
    );

    return asyncBox.when(
      loading: () => null,
      error: (error, stack) => null,
      data: (Box<ComparableDeviceList> box) {
        List<ComparableDevice>? currentValue =
            box.containsKey(deviceListHiveKey)
                ? box.get(deviceListHiveKey)?.items
                : null;

        // Hive subscription
        _hiveSubscription?.cancel();
        _hiveSubscription = box.watch(key: deviceListHiveKey).listen(
              (BoxEvent event) => ref.controller.state = event.value,
            );

        return currentValue;
      },
    );
  },
);

final deviceProvider = StateProvider.autoDispose.family<Device?, String>(
  (ref, deviceId) {
    final AsyncValue<Box<Device>> asyncBox = ref.watch(deviceBoxProvider);
    StreamSubscription? _hiveSubscription;

    // On dispose
    ref.onDispose(
      () {
        // Closes the StreamController when the state of this provider is destroyed.
        _hiveSubscription?.cancel();
      },
    );

    return asyncBox.when(
      loading: () => null,
      error: (error, stack) => null,
      data: (Box<Device> box) {
        Device? currentValue =
            box.containsKey(deviceId) ? box.get(deviceId) : null;

        // Hive subscription
        _hiveSubscription?.cancel();
        _hiveSubscription = box.watch(key: deviceId).listen(
              (BoxEvent event) => ref.controller.state = event.value,
            );

        return currentValue;
      },
    );
  },
);

class DevicesRepository {
  // final DeviceListBoxCallback deviceListBox;
  // final DeviceBoxCallback deviceBox;
  final Ref ref;

  DevicesRepository(this.ref);

  // BehaviorSubject<List<ComparableDevice>>? _deviceListcontroller;
  // final Map<String, BehaviorSubject<Device>> _deviceControllerMap = {};
  // StreamSubscription? _hiveSubscription;
  // final Map<String, StreamSubscription> _hiveSubscriptionMap = {};

  ///
  /// --- Read ---
  ///

  Future<Device?> getDevice(String deviceId) async {
    final Box<Device> box = await ref.read(deviceBoxProvider.future);

    return box.get(deviceId);
  }

  // Stream<List<ComparableDevice>> watchDevices() {
  //   print("[GWA] DevicesRepository watch ComparableDevice List");

  //   if (_deviceListcontroller == null) {
  //     _deviceListcontroller = BehaviorSubject<List<ComparableDevice>>();
  //     _deviceListcontroller!.onCancel =
  //         () => _onDeviceListControllerCancelled();
  //   }

  //   if (_hiveSubscription == null) {
  //     deviceListBox().then(
  //       (box) {
  //         _hiveSubscription?.cancel();
  //         _hiveSubscription = box.watch(key: deviceListHiveKey).listen(
  //               _onDeviceListBoxEvent,
  //             );
  //         if (_deviceListcontroller?.hasValue != true &&
  //             box.containsKey(deviceListHiveKey)) {
  //           // Push current value on stream
  //           _onDeviceListBoxEvent(
  //             BoxEvent(
  //               deviceListHiveKey,
  //               box.get(deviceListHiveKey),
  //               false,
  //             ),
  //           );
  //         }
  //       },
  //     );
  //   }

  //   return _deviceListcontroller!.stream;
  // }

  // Stream<Device> watchDevice(String deviceId) {
  //   print("[GWA] DevicesRepository watch Device deviceId:$deviceId");

  //   final controller =
  //       _deviceControllerMap[deviceId] ?? BehaviorSubject<Device>();
  //   if (!_deviceControllerMap.containsKey(deviceId)) {
  //     controller.onCancel = () => _onDeviceControllerCancelled(deviceId);
  //     _deviceControllerMap[deviceId] = controller;
  //   }

  //   if (!_hiveSubscriptionMap.containsKey(deviceId)) {
  //     deviceBox().then(
  //       (box) {
  //         final hiveSubscription =
  //             box.watch(key: deviceId).listen(_onDeviceBoxEvent);
  //         _hiveSubscriptionMap[deviceId] = hiveSubscription;
  //         if (controller.hasValue != true && box.containsKey(deviceId)) {
  //           // Push current value on stream
  //           _onDeviceBoxEvent(
  //             BoxEvent(
  //               deviceId,
  //               box.get(deviceId),
  //               false,
  //             ),
  //           );
  //         }
  //       },
  //     );
  //   }

  //   return controller.stream;
  // }

  // void dispose() {
  //   print("[GWA] DevicesRepository dispose");
  //   _deviceListcontroller?.close();
  //   _deviceListcontroller = null;
  //   _hiveSubscription?.cancel();
  //   _hiveSubscription = null;
  // }

  ///
  /// --- Write ---
  ///

  Future<void> updateList(List<ComparableDevice> list) async {
    final Box<ComparableDeviceList> devicesBox =
        await ref.read(deviceListBoxProvider.future);

    await devicesBox.put(
      deviceListHiveKey,
      ComparableDeviceList(items: list),
    );
  }

  Future<void> updateDevice(Device device) async {
    final Box<Device> box = await ref.read(deviceBoxProvider.future);

    await box.put(
      device.id,
      device,
    );
  }

  ///
  /// --- Internal ---
  ///

  // void _onDeviceListControllerCancelled() {
  //   print(
  //       "[GWA] _deviceListcontroller.onCancel, hasListener: ${_deviceListcontroller?.hasListener} - ${_deviceListcontroller?.hasListener}");
  //   // Cancel Hive subscription on last listener cancel
  //   if (_deviceListcontroller?.hasListener != true) {
  //     dispose();
  //   }
  // }

  // void _onDeviceControllerCancelled(String deviceId) {
  //   final controller = _deviceControllerMap[deviceId];
  //   final subscription = _hiveSubscriptionMap[deviceId];
  //   print(
  //     "[GWA] _onDeviceControllerCancelled.onCancel, hasListener: ${controller?.hasListener}",
  //   );
  //   // Cancel DB subscription on last listener cancel
  //   if (controller?.hasListener != true) {
  //     controller?.close();
  //     subscription?.cancel();
  //     _deviceControllerMap.remove(deviceId);
  //     _hiveSubscriptionMap.remove(deviceId);
  //   }
  // }

  // Future<void> _onDeviceListBoxEvent(BoxEvent event) async {
  //   debugPrint("[DEVICES] _onDeviceListBoxEvent, key: ${event.key} ");
  //   if (event.value is List<ComparableDevice>) {
  //     _deviceListcontroller?.sink.add(event.value);
  //   }
  // }

  // Future<void> _onDeviceBoxEvent(BoxEvent event) async {
  //   debugPrint("[DEVICE] _onDeviceListBoxEvent, key: ${event.key} ");
  //   if (event.value is Device) {
  //     final deviceId = (event.value as Device).id;
  //     _deviceControllerMap[deviceId]?.sink.add(event.value);
  //   }
  // }
}
