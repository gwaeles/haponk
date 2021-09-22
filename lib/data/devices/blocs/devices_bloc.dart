import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';
import 'package:haponk/data/devices/states/devices_state.dart';

class DevicesBloc extends Cubit<DevicesState> {
  final DevicesRepository repository;
  // If fetchAllDevicesAllowed is false you have to set a _selectedType or a
  // _searchText to fetch devices
  final bool fetchAllDevicesAllowed;

  DevicesBloc({
    required this.repository,
    this.fetchAllDevicesAllowed = true,
  }) : super(DevicesState.idle()) {
    _init();
  }

  List<Device> _data = [];
  StreamSubscription? _repoSubscription;
  String? _searchText;
  DeviceType? _selectedType;

  DeviceType? get selectedType => _selectedType;
  set selectedType(DeviceType? value) {
    _selectedType = value;
    if (state is DevicesLoaded) {
      _onFilterData();
    }
  }

  ///
  /// --- SUBSCRIBTION --- ///
  ///

  void _init() {
    // Repo stream subscription
    debugPrint('[GARY] DevicesBloc init');
    _repoSubscription?.cancel();
    _repoSubscription = repository.watchDevices().listen(_onData);
  }

  @override
  Future<void> close() {
    debugPrint('[GARY] DevicesBloc close');
    _repoSubscription?.cancel();
    _repoSubscription = null;
    return super.close();
  }

  void _onData(List<Device> data) {
    debugPrint('[GARY] DevicesBloc _onData');
    _data = data;
    _onFilterData();
  }

  ///
  /// --- FILTERING --- ///
  ///

  void search(String value) {
    _searchText = value;
    final request = value;
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      if (request == _searchText && state is DevicesLoaded) {
        _onFilterData();
      }
    });
  }

  void _onFilterData() {
    final result = _data
        .where((element) =>
            (_selectedType == null ||
                _selectedType == null && fetchAllDevicesAllowed) ||
            (_selectedType != null && element.deviceType == _selectedType))
        .where((element) =>
            (_searchText?.isNotEmpty != true && fetchAllDevicesAllowed) ||
            (_searchText?.isNotEmpty != true && _selectedType != null) ||
            (_searchText?.isNotEmpty == true &&
                element.friendlyName?.contains(_searchText!) == true))
        .toList();

    emit(
      DevicesState.loaded(
        devices: result,
      ),
    );
  }
}
