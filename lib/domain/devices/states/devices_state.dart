import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haponk/data/connection/models/constants.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';
import 'package:haponk/domain/devices/entities/device.dart';

part 'devices_state.freezed.dart';

final devicesStateProvider = StateProvider.autoDispose<DevicesState>(
  (ref) {
    final List<ComparableDevice>? devices = ref.watch(deviceListProvider);
    final DeviceType? deviceType = ref.watch(deviceTypeProvider);

    if (devices == null) {
      return DevicesState.idle();
    }

    return DevicesState.loaded(
      deviceType: deviceType,
      devices: devices
          .where(
            (device) => deviceType == null || device.deviceType == deviceType,
          )
          .toList(),
    );
  },
);

final deviceTypeProvider = StateProvider.autoDispose<DeviceType?>(
  (ref) => null,
);

@freezed
class DevicesState with _$DevicesState {
  factory DevicesState.idle() = DevicesIdle;

  factory DevicesState.loaded({
    required DeviceType? deviceType,
    required List<ComparableDevice> devices,
  }) = DevicesLoaded;
}
