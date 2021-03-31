import 'package:hapoc/core/hass/models/constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'context_model.dart';
import 'data_model.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  @JsonKey(name: "event_type")
  final EventType eventType;
  final DataModel data;
  final String origin;
  @JsonKey(name: "time_fired")
  final DateTime timeFired;
  final ContextModel context;

  const EventModel(
      {this.eventType, this.data, this.origin, this.timeFired, this.context});

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
