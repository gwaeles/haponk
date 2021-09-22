import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';
import 'package:haponk/data/devices/states/device_state.dart';

class DeviceBloc extends Cubit<DeviceState> {
  final DevicesRepository repository;
  final int deviceId;

  DeviceBloc({
    required this.repository,
    required this.deviceId,
  }) : super(DeviceState.idle()) {
    _init();
  }

  StreamSubscription? _repoSubscription;

  ///
  /// --- SUBSCRIBTION --- ///
  ///

  void _init() {
    // Repo stream subscription
    _repoSubscription?.cancel();
    if (deviceId > 0) {
      _repoSubscription = repository.watchDevices().listen(_onData);
    }
  }

  @override
  Future<void> close() {
    _repoSubscription?.cancel();
    _repoSubscription = null;
    return super.close();
  }

  void _onData(List<Device> _data) {
    final result = _data.where((element) => element.id == deviceId).toList();

    if (result.isNotEmpty) {
      emit(
        DeviceState.loaded(
          device: result.first,
        ),
      );
    }
  }
}
