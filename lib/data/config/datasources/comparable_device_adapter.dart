import 'dart:convert';

import 'package:haponk/core/hive/constants.dart';
import 'package:haponk/data/devices/models/comparable_device_list.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ComparableDeviceListAdapter extends TypeAdapter<ComparableDeviceList> {
  @override
  final typeId = deviceComparableAdapterTypeId;

  @override
  ComparableDeviceList read(BinaryReader reader) {
    return ComparableDeviceList.fromJson(
      Map<String, dynamic>.from(
        jsonDecode(reader.read()),
      ),
    );
  }

  @override
  void write(BinaryWriter writer, ComparableDeviceList obj) {
    writer.write(
      jsonEncode(obj.toJson()),
    );
  }
}
