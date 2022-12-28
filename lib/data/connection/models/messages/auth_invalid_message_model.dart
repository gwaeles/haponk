import 'package:haponk/data/connection/models/constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'message_model.dart';

part 'auth_invalid_message_model.g.dart';

@JsonSerializable(createFactory: false)
class AuthInvalidMessageModel extends MessageModel {
  final String? message;

  const AuthInvalidMessageModel({
    this.message,
    MessageType type = MessageType.AUTH_INVALID,
  }) : super(type);

  Map<String, dynamic> toJson() => _$AuthInvalidMessageModelToJson(this);
}
