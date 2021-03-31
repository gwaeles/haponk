import 'package:hapoc/core/hass/models/constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'send_message_model.dart';

part 'subscribe_message_model.g.dart';

@JsonSerializable(createFactory: false)
class SubscribeMessageModel extends SendMessageModel {
  @JsonKey(name: "event_type")
  final String eventType;

  const SubscribeMessageModel(
      {int id,
      this.eventType = "state_changed",
      MessageType type = MessageType.SUBSCRIBE_EVENTS})
      : super(type, id: id);

  Map<String, dynamic> toJson() => _$SubscribeMessageModelToJson(this);
}
