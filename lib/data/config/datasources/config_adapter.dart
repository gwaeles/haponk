import 'dart:convert';

import 'package:haponk/core/hive/constants.dart';
import 'package:haponk/domain/config/entities/config.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ConfigAdapter extends TypeAdapter<Config> {
  @override
  final typeId = configAdapterTypeId;

  @override
  Config read(BinaryReader reader) {
    return Config.fromJson(
      Map<String, dynamic>.from(
        jsonDecode(reader.read()),
      ),
    );
  }

  @override
  void write(BinaryWriter writer, Config obj) {
    writer.write(
      jsonEncode(obj.toJson()),
    );
  }
}
