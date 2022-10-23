import 'package:json_annotation/json_annotation.dart';
import 'package:easy_localization/easy_localization.dart';

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
  UNKNOWN,
}

extension DeviceTypeToString on DeviceType {
  String toShortString() {
    return this.toString().split('.').last;
  }

  String label() {
    switch (this) {
      case DeviceType.AUTOMATION:
        return 'device_type_label_automation'.tr();
      case DeviceType.LIGHT:
        return 'device_type_label_light'.tr();
      case DeviceType.COVER:
        return 'device_type_label_cover'.tr();
      case DeviceType.WEATHER:
        return 'device_type_label_weather'.tr();
      case DeviceType.BINARY_SENSOR:
        return 'device_type_label_binary_sensor'.tr();
      case DeviceType.SENSOR:
        return 'device_type_label_sensor'.tr();
      case DeviceType.SWITCH:
        return 'device_type_label_switch'.tr();
      case DeviceType.MEDIA_PLAYER:
        return 'device_type_label_media_player'.tr();
      case DeviceType.UNKNOWN:
        return 'device_type_label_binary_sensor'.tr();
    }
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
