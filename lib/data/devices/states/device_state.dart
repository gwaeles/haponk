import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haponk/data/devices/entities/device.dart';

part 'device_state.freezed.dart';

@freezed
class DeviceState with _$DeviceState {
  factory DeviceState.idle() = DeviceIdle;

  factory DeviceState.loaded({
    required Device device,
  }) = DeviceLoaded;
}
