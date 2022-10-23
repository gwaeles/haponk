// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Device _$$_DeviceFromJson(Map<String, dynamic> json) => _$_Device(
      id: json['id'] as String,
      deviceType:
          $enumDecodeNullable(_$DeviceTypeEnumMap, json['deviceType']) ??
              DeviceType.LIGHT,
      state: json['state'] as String?,
      lastChanged: json['lastChanged'] == null
          ? null
          : DateTime.parse(json['lastChanged'] as String),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      friendlyName: json['friendlyName'] as String?,
      colorMode: $enumDecodeNullable(_$ColorModeEnumMap, json['colorMode']),
      brightness: json['brightness'] as int?,
      supportedFeatures: json['supportedFeatures'] as int?,
      currentPosition: json['currentPosition'] as int?,
      lastTriggered: json['lastTriggered'] == null
          ? null
          : DateTime.parse(json['lastTriggered'] as String),
      mode: json['mode'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      humidity: json['humidity'] as int?,
      pressure: (json['pressure'] as num?)?.toDouble(),
      windBearing: (json['windBearing'] as num?)?.toDouble(),
      windSpeed: (json['windSpeed'] as num?)?.toDouble(),
      attribution: json['attribution'] as String?,
      isOn: json['isOn'] as bool?,
      deviceClass: json['deviceClass'] as String?,
      unitOfMeasurement: json['unitOfMeasurement'] as String?,
      current: json['current'] as int?,
      voltage: json['voltage'] as int?,
    );

Map<String, dynamic> _$$_DeviceToJson(_$_Device instance) => <String, dynamic>{
      'id': instance.id,
      'deviceType': _$DeviceTypeEnumMap[instance.deviceType]!,
      'state': instance.state,
      'lastChanged': instance.lastChanged?.toIso8601String(),
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'friendlyName': instance.friendlyName,
      'colorMode': _$ColorModeEnumMap[instance.colorMode],
      'brightness': instance.brightness,
      'supportedFeatures': instance.supportedFeatures,
      'currentPosition': instance.currentPosition,
      'lastTriggered': instance.lastTriggered?.toIso8601String(),
      'mode': instance.mode,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'windBearing': instance.windBearing,
      'windSpeed': instance.windSpeed,
      'attribution': instance.attribution,
      'isOn': instance.isOn,
      'deviceClass': instance.deviceClass,
      'unitOfMeasurement': instance.unitOfMeasurement,
      'current': instance.current,
      'voltage': instance.voltage,
    };

const _$DeviceTypeEnumMap = {
  DeviceType.AUTOMATION: 'AUTOMATION',
  DeviceType.LIGHT: 'LIGHT',
  DeviceType.COVER: 'COVER',
  DeviceType.WEATHER: 'WEATHER',
  DeviceType.BINARY_SENSOR: 'BINARY_SENSOR',
  DeviceType.SENSOR: 'SENSOR',
  DeviceType.SWITCH: 'SWITCH',
  DeviceType.MEDIA_PLAYER: 'MEDIA_PLAYER',
  DeviceType.UNKNOWN: 'UNKNOWN',
};

const _$ColorModeEnumMap = {
  ColorMode.unknow: 'unknow',
  ColorMode.onoff: 'onoff',
  ColorMode.brightness: 'brightness',
  ColorMode.colorTemp: 'color_temp',
  ColorMode.hs: 'hs',
  ColorMode.rgb: 'rgb',
  ColorMode.rgbw: 'rgbw',
  ColorMode.rgbww: 'rgbww',
  ColorMode.white: 'white',
  ColorMode.xy: 'xy',
};

_$_ComparableDevice _$$_ComparableDeviceFromJson(Map<String, dynamic> json) =>
    _$_ComparableDevice(
      id: json['id'] as String,
      deviceType:
          $enumDecodeNullable(_$DeviceTypeEnumMap, json['deviceType']) ??
              DeviceType.LIGHT,
      friendlyName: json['friendlyName'] as String?,
    );

Map<String, dynamic> _$$_ComparableDeviceToJson(_$_ComparableDevice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceType': _$DeviceTypeEnumMap[instance.deviceType]!,
      'friendlyName': instance.friendlyName,
    };
