import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';
import 'package:haponk/data/devices/states/device_types_state.dart';

class DeviceTypesBloc extends Cubit<DeviceTypesState> {
  final DevicesRepository repository;

  DeviceTypesBloc({
    required this.repository,
  }) : super(DeviceTypesState.idle()) {
    _init();
  }

  StreamSubscription? _repoSubscription;

  ///
  /// --- SUBSCRIBTION --- ///
  ///

  void _init() {
    // Repo stream subscription
    _repoSubscription?.cancel();
    _repoSubscription = repository.watchDevices().listen(_onData);
  }

  @override
  Future<void> close() {
    _repoSubscription?.cancel();
    _repoSubscription = null;
    return super.close();
  }

  void _onData(List<ComparableDevice> data) {
    emit(
      DeviceTypesState.loaded(
        types: data.map((e) => e.deviceType).toList(),
      ),
    );
  }
}
