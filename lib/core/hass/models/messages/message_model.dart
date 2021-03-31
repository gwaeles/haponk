import 'package:hapoc/core/hass/models/constants.dart';
import 'package:hapoc/core/hass/models/events/event_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'auth_invalid_message_model.dart';
import 'auth_ok_message_model.dart';
import 'auth_required_message_model.dart';
import 'command_result_message_model.dart';
import 'event_message_model.dart';

part 'message_model.g.dart';

@JsonSerializable(createFactory: false)
abstract class MessageModel {
  @JsonKey(includeIfNull: false)
  final int id;
  final MessageType type;

  const MessageModel(this.type, {this.id});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    final type = messageTypeFromString(json['type']);

    if (type == MessageType.AUTH_REQUIRED) {
      return AuthRequiredMessageModel();
    } else if (type == MessageType.AUTH_OK) {
      return AuthOkMessageModel();
    } else if (type == MessageType.AUTH_INVALID) {
      final message = json['message'] as String;
      return AuthInvalidMessageModel(message: message);
    } else if (type == MessageType.RESULT) {
      final id = json['id'] as int;
      final success = json['success'] as bool;
      final result = json['result'];
      return CommandResultMessageModel(
          id: id, success: success, result: result);
    } else if (type == MessageType.EVENT) {
      final id = json['id'] as int;
      final event = EventModel.fromJson(json['event']);
      return EventMessageModel(id: id, event: event);
    }

    throw TypeError;
  }
}

MessageType messageTypeFromString(String source) {
  if (source == null) return null;

  return _$MessageTypeEnumMap.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${_$MessageTypeEnumMap.values.join(', ')}'))
      .key;
}
