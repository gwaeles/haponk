import 'package:hapoc/core/hass/models/constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'send_message_model.dart';

part 'get_config_message_model.g.dart';

@JsonSerializable(createFactory: false)
class GetConfigMessageModel extends SendMessageModel {
  
  const GetConfigMessageModel({int id}) : super(MessageType.GET_CONFIG, id: id);

  Map<String, dynamic> toJson() => _$GetConfigMessageModelToJson(this);
}
