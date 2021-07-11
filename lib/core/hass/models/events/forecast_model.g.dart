// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastModel _$ForecastModelFromJson(Map<String, dynamic> json) {
  return ForecastModel(
    condition: json['condition'] as String?,
    precipitation: (json['precipitation'] as num?)?.toDouble(),
    temperature: (json['temperature'] as num?)?.toDouble(),
    templow: (json['templow'] as num?)?.toDouble(),
    windBearing: (json['wind_bearing'] as num?)?.toDouble(),
    windSpeed: (json['wind_speed'] as num?)?.toDouble(),
    datetime: json['datetime'] == null
        ? null
        : DateTime.parse(json['datetime'] as String),
  );
}

Map<String, dynamic> _$ForecastModelToJson(ForecastModel instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'precipitation': instance.precipitation,
      'temperature': instance.temperature,
      'templow': instance.templow,
      'wind_bearing': instance.windBearing,
      'wind_speed': instance.windSpeed,
      'datetime': instance.datetime?.toIso8601String(),
    };
