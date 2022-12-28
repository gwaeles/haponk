import 'dart:convert';

import 'package:haponk/core/hive/constants.dart';
import 'package:haponk/domain/tabs/entities/flex_tab.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FlexTabAdapter extends TypeAdapter<FlexTabList> {
  @override
  final typeId = flexTabAdapterTypeId;

  @override
  FlexTabList read(BinaryReader reader) {
    return FlexTabList.fromJson(
      Map<String, dynamic>.from(
        jsonDecode(reader.read()),
      ),
    );
  }

  @override
  void write(BinaryWriter writer, FlexTabList obj) {
    writer.write(
      jsonEncode(obj.toJson()),
    );
  }
}
