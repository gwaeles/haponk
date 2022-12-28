import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haponk/domain/devices/entities/device.dart';

part 'device_state.freezed.dart';

@freezed
class DeviceState with _$DeviceState {
  factory DeviceState.idle([
    Device? device,
  ]) = DeviceIdle;

  factory DeviceState.loaded({
    Device? device,
  }) = DeviceLoaded;
}
