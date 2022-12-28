import 'package:json_annotation/json_annotation.dart';

part 'forecast_model.g.dart';

@JsonSerializable()
class ForecastModel {
  final String? condition;
  final double? precipitation;
  final double? temperature;
  final double? templow;
  @JsonKey(name: "wind_bearing")
  final double? windBearing;
  @JsonKey(name: "wind_speed")
  final double? windSpeed;
  final DateTime? datetime;

  const ForecastModel({
    this.condition,
    this.precipitation,
    this.temperature,
    this.templow,
    this.windBearing,
    this.windSpeed,
    this.datetime,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastModelToJson(this);
}
