import 'package:hapoc/core/hass/models/constants.dart';
import 'package:hapoc/core/hass/models/events/data_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'send_message_model.dart';

part 'call_service_message_model.g.dart';

@JsonSerializable(createFactory: false)
class CallServiceMessageModel extends SendMessageModel {
  final String domain;
  final String service;
  @JsonKey(name: "service_data")
  final DataModel serviceData;

  const CallServiceMessageModel(
      {int id, this.domain, this.service, this.serviceData})
      : super(MessageType.CALL_SERVICE, id: id);

  Map<String, dynamic> toJson() => _$CallServiceMessageModelToJson(this);
}
