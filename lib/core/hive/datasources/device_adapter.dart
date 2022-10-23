import 'package:haponk/core/hive/datasources/boxes_provider.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DeviceAdapter extends TypeAdapter<Device> {
  @override
  final typeId = deviceAdapterTypeId;

  @override
  Device read(BinaryReader reader) {
    return Device.fromJson(
      Map<String, dynamic>.from(reader.read()),
    );
  }

  @override
  void write(BinaryWriter writer, Device obj) {
    writer.write(obj.toJson());
  }
}