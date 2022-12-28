import 'package:haponk/data/connection/models/constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'send_message_model.dart';

part 'unsubscribe_message_model.g.dart';

@JsonSerializable(createFactory: false)
class UnsubscribeMessageModel extends SendMessageModel {
  final int? subscription;

  const UnsubscribeMessageModel({
    required int id,
    this.subscription,
    MessageType type = MessageType.UNSUBSCRIBE_EVENTS,
  }) : super(type, id: id);

  Map<String, dynamic> toJson() => _$UnsubscribeMessageModelToJson(this);
}
