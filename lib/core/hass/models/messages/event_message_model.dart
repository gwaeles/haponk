import 'package:hapoc/core/hass/models/constants.dart';
import 'package:hapoc/core/hass/models/events/event_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'message_model.dart';

part 'event_message_model.g.dart';

@JsonSerializable(createFactory: false)
class EventMessageModel extends MessageModel {
  final EventModel event;

  const EventMessageModel(
      {int id, this.event, MessageType type = MessageType.EVENT})
      : super(type, id: id);
}
