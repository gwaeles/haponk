import 'dart:convert';

import 'package:haponk/core/hive/datasources/boxes_provider.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ConfigAdapter extends TypeAdapter<Config> {
  @override
  final typeId = configAdapterTypeId;

  @override
  Config read(BinaryReader reader) {
    return Config.fromJson(
      Map<String, dynamic>.from(reader.read()),
    );
  }

  @override
  void write(BinaryWriter writer, Config obj) {
    writer.write(obj.toJson());
  }
}
