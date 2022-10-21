import 'package:haponk/core/hive/datasources/comparable_device_adapter.dart';
import 'package:haponk/core/hive/datasources/config_adapter.dart';
import 'package:haponk/core/hive/datasources/device_adapter.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String configBoxName = 'configs';
const String deviceListBoxName = 'deviceList';
const String deviceListHiveKey = 'deviceList';
const String deviceBoxName = 'devices';
const int configAdapterTypeId = 0;
const int deviceAdapterTypeId = 1;
const int deviceComparableAdapterTypeId = 2;

typedef ConfigBoxCallback = Future<Box<Config>> Function();
typedef DeviceBoxCallback = Future<Box<Device>> Function();
typedef DeviceListBoxCallback = Future<Box<List<ComparableDevice>>> Function();

///
/// --- Config ---
///

Future<Box<Config>> openConfigBox() async {
  if (Hive.isBoxOpen(configBoxName)) {
    return Hive.box(configBoxName);
  }

  Hive.registerAdapter(ConfigAdapter());

  return await Hive.openBox(configBoxName);
}

///
/// --- Device ---
///

Future<Box<List<ComparableDevice>>> openDeviceListBox() async {
  if (Hive.isBoxOpen(deviceListBoxName)) {
    return Hive.box(deviceListBoxName);
  }

  Hive.registerAdapter(ComparableDeviceAdapter());

  return await Hive.openBox(deviceListBoxName);
}

Future<Box<Device>> openDeviceBox() async {
  if (Hive.isBoxOpen(configBoxName)) {
    return Hive.box(deviceBoxName);
  }

  if (!Hive.isAdapterRegistered(deviceAdapterTypeId)) {
    Hive.registerAdapter(DeviceAdapter());
  }

  return await Hive.openBox(deviceBoxName);
}
