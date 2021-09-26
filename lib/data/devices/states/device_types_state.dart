import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haponk/core/hass/models/constants.dart';

part 'device_types_state.freezed.dart';

@freezed
class DeviceTypesState with _$DeviceTypesState {
  factory DeviceTypesState.idle() = DeviceTypesIdle;

  factory DeviceTypesState.loaded({
    required List<DeviceType> types,
  }) = DeviceTypesLoaded;
}
