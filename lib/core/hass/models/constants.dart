import 'package:json_annotation/json_annotation.dart';

enum ConnectionType { IDLE, LOCAL, DISTANT }

enum MessageType {
  @JsonValue("auth_required")
  AUTH_REQUIRED,
  @JsonValue("auth")
  AUTH,
  @JsonValue("auth_ok")
  AUTH_OK,
  @JsonValue("auth_invalid")
  AUTH_INVALID,
  @JsonValue("result")
  RESULT,
  @JsonValue("subscribe_events")
  SUBSCRIBE_EVENTS,
  @JsonValue("unsubscribe_events")
  UNSUBSCRIBE_EVENTS,
  @JsonValue("event")
  EVENT,
  @JsonValue("call_service")
  CALL_SERVICE,
  @JsonValue("get_states")
  GET_STATES,
  @JsonValue("get_config")
  GET_CONFIG,
  @JsonValue("get_services")
  GET_SERVICES,
  @JsonValue("get_panels")
  GET_PANEL,
  @JsonValue("media_player_thumbnail")
  MEDIA_PLAYER_THUMBNAIL,
  @JsonValue("ping")
  PING,
  @JsonValue("pong")
  PONG,
}

enum EventType {
  @JsonValue("state_changed")
  STATE_CHANGED,
}

enum DeviceType {
  AUTOMATION,
  LIGHT,
  COVER,
  WEATHER,
  BINARY_SENSOR,
  SENSOR,
  SWITCH,
  MEDIA_PLAYER,
}

extension DeviceTypeToString on DeviceType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

enum SensorDeviceType {
  OPENING,
  PLUG,
  MOTION,
  SMOKE,
  BETTERY,
  ILLUMINANCE,
  TEMPERATURE,
  HUMIDITY,
  PRESSURE,
  POWER,
  TIMESTAMP,
}
