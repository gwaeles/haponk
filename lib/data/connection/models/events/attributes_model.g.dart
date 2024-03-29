// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributesModel _$AttributesModelFromJson(Map<String, dynamic> json) =>
    AttributesModel(
      friendlyName: json['friendly_name'] as String?,
      supportedColorModes: (json['supported_color_modes'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ColorModeEnumMap, e))
          .toList(),
      colorMode: $enumDecodeNullable(_$ColorModeEnumMap, json['color_mode']),
      brightness: json['brightness'] as int?,
      supportedFeatures: json['supported_features'] as int?,
      currentPosition: json['current_position'] as int?,
      lastTriggered: json['last_triggered'] == null
          ? null
          : DateTime.parse(json['last_triggered'] as String),
      mode: json['mode'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      humidity: json['humidity'] as int?,
      pressure: (json['pressure'] as num?)?.toDouble(),
      windBearing: (json['wind_bearing'] as num?)?.toDouble(),
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      attribution: json['attribution'] as String?,
      forecast: (json['forecast'] as List<dynamic>?)
          ?.map((e) => ForecastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isOn: json['on'] as bool?,
      deviceClass: json['device_class'] as String?,
      unitOfMeasurement: json['unit_of_measurement'] as String?,
      current: json['current'] as int?,
      voltage: json['voltage'] as int?,
    );

Map<String, dynamic> _$AttributesModelToJson(AttributesModel instance) =>
    <String, dynamic>{
      'friendly_name': instance.friendlyName,
      'supported_features': instance.supportedFeatures,
      'supported_color_modes': instance.supportedColorModes
          ?.map((e) => _$ColorModeEnumMap[e]!)
          .toList(),
      'color_mode': _$ColorModeEnumMap[instance.colorMode],
      'brightness': instance.brightness,
      'current_position': instance.currentPosition,
      'last_triggered': instance.lastTriggered?.toIso8601String(),
      'mode': instance.mode,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'wind_bearing': instance.windBearing,
      'wind_speed': instance.windSpeed,
      'attribution': instance.attribution,
      'forecast': instance.forecast,
      'on': instance.isOn,
      'device_class': instance.deviceClass,
      'unit_of_measurement': instance.unitOfMeasurement,
      'current': instance.current,
      'voltage': instance.voltage,
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
