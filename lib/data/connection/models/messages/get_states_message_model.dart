import 'package:haponk/data/connection/models/constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'send_message_model.dart';

part 'get_states_message_model.g.dart';

@JsonSerializable(createFactory: false)
class GetStatesMessageModel extends SendMessageModel {
  const GetStatesMessageModel({
    required int id,
  }) : super(MessageType.GET_STATES, id: id);

  Map<String, dynamic> toJson() => _$GetStatesMessageModelToJson(this);
}
