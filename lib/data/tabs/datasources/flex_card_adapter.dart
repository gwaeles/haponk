import 'dart:convert';

import 'package:haponk/core/hive/constants.dart';
import 'package:haponk/domain/tabs/entities/flex_card.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FlexCardAdapter extends TypeAdapter<FlexCardList> {
  @override
  final typeId = flexCardAdapterTypeId;

  @override
  FlexCardList read(BinaryReader reader) {
    return FlexCardList.fromJson(
      Map<String, dynamic>.from(
        jsonDecode(reader.read()),
      ),
    );
  }

  @override
  void write(BinaryWriter writer, FlexCardList obj) {
    writer.write(
      jsonEncode(obj.toJson()),
    );
  }
}
