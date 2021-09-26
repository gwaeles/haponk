import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haponk/data/devices/entities/device.dart';

part 'devices_state.freezed.dart';

@freezed
class DevicesState with _$DevicesState {
  factory DevicesState.idle() = DevicesIdle;

  factory DevicesState.loaded({
    required List<Device> devices,
  }) = DevicesLoaded;
}
