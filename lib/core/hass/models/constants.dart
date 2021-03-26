import 'package:json_annotation/json_annotation.dart';

enum ConnectionType { IDLE, LOCAL, DISTANT }

enum MessageType {
  @JsonValue("auth_required") AUTH_REQUIRED,
  @JsonValue("auth") AUTH,
  @JsonValue("auth_ok") AUTH_OK,
  @JsonValue("auth_invalid") AUTH_INVALID,
  @JsonValue("result") RESULT,
  @JsonValue("subscribe_events") SUBSCRIBE_EVENTS,
  @JsonValue("unsubscribe_events") UNSUBSCRIBE_EVENTS,
  @JsonValue("event") EVENT,
  @JsonValue("call_service") CALL_SERVICES,
  @JsonValue("get_states") GET_STATES,
  @JsonValue("get_config") GET_CONFIG,
  @JsonValue("get_services") GET_SERVICES,
  @JsonValue("get_panels") GET_PANEL,
  @JsonValue("media_player_thumbnail") MEDIA_PLAYER_THUMBNAIL,
  @JsonValue("ping") PING,
  @JsonValue("pong") PONG,
}

enum EventType {
  @JsonValue("state_changed") STATE_CHANGED,
}

enum DeviceType {
  @JsonValue("automation") AUTOMATION,
  @JsonValue("light") LIGHT,
  @JsonValue("cover") COVER,
  @JsonValue("weather") WEATHER,
  @JsonValue("binary_sensor") BINARY_SENSOR,
  @JsonValue("sensor") SENSOR,
  @JsonValue("switch") SWITCH,
  @JsonValue("media_player") MEDIA_PLAYER,
}

enum SensorDeviceType {
  @JsonValue("opening") OPENING,
  @JsonValue("plug") PLUG,
  @JsonValue("motion") MOTION,
  @JsonValue("smoke") SMOKE,
  @JsonValue("battery") BETTERY,
  @JsonValue("illuminance") ILLUMINANCE,
  @JsonValue("temperature") TEMPERATURE,
  @JsonValue("humidity") HUMIDITY,
  @JsonValue("pressure") PRESSURE,
  @JsonValue("power") POWER,
  @JsonValue("timestamp") TIMESTAMP,
}