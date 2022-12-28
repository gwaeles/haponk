import 'package:haponk/data/connection/models/constants.dart';

import 'message_model.dart';

abstract class SendMessageModel extends MessageModel {
  const SendMessageModel(
    MessageType type, {
    int? id,
  }) : super(type, id: id);

  Map<String, dynamic> toJson();
}
