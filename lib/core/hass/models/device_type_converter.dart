import 'package:json_annotation/json_annotation.dart';

import 'constants.dart';

class CustomDeviceTypeConverter implements JsonConverter<DeviceType, String> {
  const CustomDeviceTypeConverter();

  @override
  DeviceType fromJson(String json) {
    if (json == null) {
      return null;
    }
    switch (json) {
      case 'automation':
        return DeviceType.AUTOMATION;
      case 'light':
        return DeviceType.LIGHT;
      case 'cover':
        return DeviceType.COVER;
      case 'weather':
        return DeviceType.WEATHER;
      case 'binary_sensor':
        return DeviceType.BINARY_SENSOR;
      case 'sensor':
        return DeviceType.SENSOR;
      case 'switch':
        return DeviceType.SWITCH;
      case 'media_player':
        return DeviceType.MEDIA_PLAYER;
    }

    return null;
  }

  @override
  String toJson(DeviceType deviceType) {
    if (deviceType == null) {
      return null;
    }
    switch (deviceType) {
      case DeviceType.AUTOMATION:
        return 'automation';
      case DeviceType.LIGHT:
        return 'light';
      case DeviceType.COVER:
        return 'cover';
      case DeviceType.WEATHER:
        return 'weather';
      case DeviceType.BINARY_SENSOR:
        return 'binary_sensor';
      case DeviceType.SENSOR:
        return 'sensor';
      case DeviceType.SWITCH:
        return 'switch';
      case DeviceType.MEDIA_PLAYER:
        return 'media_player';
    }

    return null;
  }
}
