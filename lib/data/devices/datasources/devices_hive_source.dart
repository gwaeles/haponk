import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/core/hive/constants.dart';
import 'package:haponk/data/config/datasources/comparable_device_adapter.dart';
import 'package:haponk/data/devices/datasources/device_adapter.dart';
import 'package:haponk/data/devices/models/comparable_device_list.dart';
import 'package:haponk/domain/devices/entities/device.dart';
import 'package:hive_flutter/hive_flutter.dart';

///
/// --- Device ---
///

final deviceListBoxProvider = FutureProvider<Box<ComparableDeviceList>>(
  (ref) async {
    if (Hive.isBoxOpen(deviceListBoxName)) {
      return Hive.box(deviceListBoxName);
    }

    Hive.registerAdapter(ComparableDeviceListAdapter());

    return await Hive.openBox(deviceListBoxName);
  },
);

final deviceBoxProvider = FutureProvider<Box<Device>>(
  (ref) async {
    if (Hive.isBoxOpen(deviceBoxName)) {
      return Hive.box(deviceBoxName);
    }

    if (!Hive.isAdapterRegistered(deviceAdapterTypeId)) {
      Hive.registerAdapter(DeviceAdapter());
    }

    return await Hive.openBox(deviceBoxName);
  },
);
