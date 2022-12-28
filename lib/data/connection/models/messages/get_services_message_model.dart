import 'package:haponk/data/connection/models/constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'send_message_model.dart';

part 'get_services_message_model.g.dart';

@JsonSerializable(createFactory: false)
class GetServicesMessageModel extends SendMessageModel {
  const GetServicesMessageModel({
    required int id,
  }) : super(MessageType.GET_SERVICES, id: id);

  Map<String, dynamic> toJson() => _$GetServicesMessageModelToJson(this);
}
