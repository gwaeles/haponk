import 'package:haponk/core/hass/models/constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'send_message_model.dart';

part 'auth_message_model.g.dart';

@JsonSerializable(createFactory: false)
class AuthMessageModel extends SendMessageModel {
  @JsonKey(name: "access_token")
  final String accessToken;

  const AuthMessageModel({this.accessToken}) : super(MessageType.AUTH);

  Map<String, dynamic> toJson() => _$AuthMessageModelToJson(this);
}
