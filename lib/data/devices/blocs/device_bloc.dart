import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';
import 'package:haponk/data/devices/states/device_state.dart';

class DeviceBloc extends Cubit<DeviceState> {
  final DevicesRepository repository;
  final String deviceId;

  DeviceBloc({
    required this.repository,
    required this.deviceId,
  }) : super(DeviceState.idle());

  StreamSubscription? _repoSubscription;

  ///
  /// --- SUBSCRIBTION --- ///
  ///

  void init() {
    // Repo stream subscription
    _repoSubscription?.cancel();
    _repoSubscription = repository.watchDevice(deviceId).listen(_onData);
  }

  @override
  Future<void> close() {
    _repoSubscription?.cancel();
    _repoSubscription = null;
    return super.close();
  }

  void _onData(Device? _data) {

    if (_data != null) {
      emit(
        DeviceState.loaded(
          device: _data,
        ),
      );
    }
  }
}
