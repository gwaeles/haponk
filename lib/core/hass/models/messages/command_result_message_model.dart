import 'package:haponk/core/hass/models/constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'message_model.dart';

part 'command_result_message_model.g.dart';

@JsonSerializable(createFactory: false)
class CommandResultMessageModel extends MessageModel {
  final bool success;
  final dynamic result;

  const CommandResultMessageModel({int id, this.success, this.result})
      : super(MessageType.RESULT, id: id);

  Map<String, dynamic> toJson() => _$CommandResultMessageModelToJson(this);
}
