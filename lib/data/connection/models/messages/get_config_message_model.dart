import 'package:haponk/data/connection/models/constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'send_message_model.dart';

part 'get_config_message_model.g.dart';

@JsonSerializable(createFactory: false)
class GetConfigMessageModel extends SendMessageModel {
  const GetConfigMessageModel({
    required int id,
  }) : super(MessageType.GET_CONFIG, id: id);

  Map<String, dynamic> toJson() => _$GetConfigMessageModelToJson(this);
}
