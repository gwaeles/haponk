import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haponk/core/hass/models/constants.dart';

part 'device.freezed.dart';
part 'device.g.dart';

@freezed
class Device with _$Device {
  const factory Device({
    required String id,
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
  const Device._();

  ComparableDevice toComparable() => ComparableDevice(
        id: id,
        deviceType: deviceType,
        friendlyName: friendlyName,
      );

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}

@freezed
class ComparableDevice with _$ComparableDevice {
  const factory ComparableDevice({
    required String id,
    @Default(DeviceType.LIGHT) DeviceType deviceType,
    String? friendlyName,
  }) = _ComparableDevice;

  factory ComparableDevice.fromJson(Map<String, dynamic> json) => _$ComparableDeviceFromJson(json);
}