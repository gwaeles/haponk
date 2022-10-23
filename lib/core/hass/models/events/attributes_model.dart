import 'package:haponk/core/hass/models/constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'forecast_model.dart';

part 'attributes_model.g.dart';

@JsonSerializable()
class AttributesModel {
  @JsonKey(name: "friendly_name")
  final String? friendlyName;
  @JsonKey(name: "supported_features")
  final int? supportedFeatures;

  // DIMMER
  @JsonKey(name: "supported_color_modes")
  final List<ColorMode>? supportedColorModes;
  @JsonKey(name: "color_mode")
  final ColorMode? colorMode;
  final int? brightness;

  // COVER
  @JsonKey(name: "current_position")
  final int? currentPosition;

  // AUTOMATION
  @JsonKey(name: "last_triggered")
  final DateTime? lastTriggered;
  final String? mode;

  // WEATHER / SENSOR
  final double? temperature;
  final int? humidity;
  final double? pressure;
  @JsonKey(name: "wind_bearing")
  final double? windBearing;
  @JsonKey(name: "wind_speed")
  final double? windSpeed;
  final String? attribution;
  final List<ForecastModel>? forecast;

  // SENSOR / BINARY SENSOR
  @JsonKey(name: "on")
  final bool? isOn;
  @JsonKey(name: "device_class")
  final String? deviceClass;
  @JsonKey(name: "unit_of_measurement")
  final String? unitOfMeasurement;
  final int? current;
  final int? voltage;

  const AttributesModel({
    this.friendlyName,
    this.supportedColorModes,
    this.colorMode,
    this.brightness,
    this.supportedFeatures,
    this.currentPosition,
    this.lastTriggered,
    this.mode,
    this.temperature,
    this.humidity,
    this.pressure,
    this.windBearing,
    this.windSpeed,
    this.attribution,
    this.forecast,
    this.isOn,
    this.deviceClass,
    this.unitOfMeasurement,
    this.current,
    this.voltage,
  });

  factory AttributesModel.fromJson(Map<String, dynamic> json) =>
      _$AttributesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesModelToJson(this);
}
