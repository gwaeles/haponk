import 'dart:convert';

import 'package:haponk/core/hive/constants.dart';
import 'package:haponk/domain/devices/entities/device.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DeviceAdapter extends TypeAdapter<Device> {
  @override
  final typeId = deviceAdapterTypeId;

  @override
  Device read(BinaryReader reader) {
    return Device.fromJson(
      Map<String, dynamic>.from(
        jsonDecode(reader.read()),
      ),
    );
  }

  @override
  void write(BinaryWriter writer, Device obj) {
    writer.write(
      jsonEncode(obj.toJson()),
    );
  }
}
