import 'package:haponk/data/connection/models/constants.dart';

import 'message_model.dart';

class AuthRequiredMessageModel extends MessageModel {
  const AuthRequiredMessageModel() : super(MessageType.AUTH_REQUIRED);
}
