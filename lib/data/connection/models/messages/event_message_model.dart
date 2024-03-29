import 'package:haponk/data/connection/models/constants.dart';
import 'package:haponk/data/connection/models/events/event_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'message_model.dart';

part 'event_message_model.g.dart';

@JsonSerializable(createFactory: false)
class EventMessageModel extends MessageModel {
  final EventModel event;

  const EventMessageModel({
    required int id,
    required this.event,
    MessageType type = MessageType.EVENT,
  }) : super(
          type,
          id: id,
        );

  Map<String, dynamic> toJson() => _$EventMessageModelToJson(this);
}
