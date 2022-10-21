import 'package:haponk/core/hive/datasources/boxes_provider.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ComparableDeviceAdapter extends TypeAdapter<ComparableDevice> {
  @override
  final typeId = deviceComparableAdapterTypeId;

  @override
  ComparableDevice read(BinaryReader reader) {
    return ComparableDevice.fromJson(
      Map<String, dynamic>.from(reader.read()),
    );
  }

  @override
  void write(BinaryWriter writer, ComparableDevice obj) {
    writer.write(obj.toJson());
  }
}
