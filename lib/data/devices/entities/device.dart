import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haponk/core/hass/models/constants.dart';

part 'device.freezed.dart';

@freezed
class Device with _$Device {
  const factory Device({
    int? id,
    String? entityId,
    @Default(DeviceType.LIGHT) DeviceType deviceType,
    String? state,
    DateTime? lastChanged,
    DateTime? lastUpdated,
    String? friendlyName,
    int? supportedFeatures,
    int? currentPosition,
    DateTime? lastTriggered,
    String? mode,
    double? temperature,
    int? humidity,
    double? pressure,
    double? windBearing,
    double? windSpeed,
    String? attribution,
    bool? isOn,
    String? deviceClass,
    String? unitOfMeasurement,
    int? current,
    int? voltage,
  }) = _Device;
}
