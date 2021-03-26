import 'package:hapoc/core/hass/models/constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'message_model.dart';

part 'auth_ok_message_model.g.dart';

@JsonSerializable(createFactory: false)
class AuthOkMessageModel extends MessageModel {

  const AuthOkMessageModel() : super(MessageType.AUTH_OK);
}
