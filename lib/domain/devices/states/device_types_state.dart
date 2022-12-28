import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haponk/data/connection/models/constants.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';
import 'package:haponk/domain/devices/entities/device.dart';

part 'device_types_state.freezed.dart';

final deviceTypesStateProvider = StateProvider.autoDispose<DeviceTypesState>(
  (ref) {
    final List<ComparableDevice>? devices = ref.watch(deviceListProvider);

    if (devices == null) {
      return DeviceTypesState.idle();
    }

    return DeviceTypesState.loaded(
        types: devices
            .map(
              (device) => device.deviceType,
            )
            .toSet()
            .toList());
  },
);

@freezed
class DeviceTypesState with _$DeviceTypesState {
  factory DeviceTypesState.idle() = DeviceTypesIdle;

  factory DeviceTypesState.loaded({
    required List<DeviceType> types,
  }) = DeviceTypesLoaded;
}
