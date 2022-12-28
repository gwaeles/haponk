// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_services_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$GetServicesMessageModelToJson(
    GetServicesMessageModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['type'] = _$MessageTypeEnumMap[instance.type]!;
  return val;
}

const _$MessageTypeEnumMap = {
  MessageType.AUTH_REQUIRED: 'auth_required',
  MessageType.AUTH: 'auth',
  MessageType.AUTH_OK: 'auth_ok',
  MessageType.AUTH_INVALID: 'auth_invalid',
  MessageType.RESULT: 'result',
  MessageType.SUBSCRIBE_EVENTS: 'subscribe_events',
  MessageType.UNSUBSCRIBE_EVENTS: 'unsubscribe_events',
  MessageType.EVENT: 'event',
  MessageType.CALL_SERVICE: 'call_service',
  MessageType.GET_STATES: 'get_states',
  MessageType.GET_CONFIG: 'get_config',
  MessageType.GET_SERVICES: 'get_services',
  MessageType.GET_PANEL: 'get_panels',
  MessageType.MEDIA_PLAYER_THUMBNAIL: 'media_player_thumbnail',
  MessageType.PING: 'ping',
  MessageType.PONG: 'pong',
};
