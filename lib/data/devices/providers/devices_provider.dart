import 'dart:async';

import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';
import 'package:rxdart/rxdart.dart';

class DevicesProvider {
  final DevicesRepository repository;
  // If fetchAllDevicesAllowed is false you have to set a _selectedType or a
  // _searchText to fetch devices
  final bool fetchAllDevicesAllowed;

  DevicesProvider({
    required this.repository,
    this.fetchAllDevicesAllowed = true,
  });

  BehaviorSubject<List<Device>?>? _controller;
  StreamSubscription? _repoSubscription;
  List<Device>? _data;
  String? _searchText;
  DeviceType? _selectedType;

  DeviceType? get selectedType => _selectedType;
  set selectedType(DeviceType? value) {
    _selectedType = value;
    _onFilterData();
  }

  ///
  /// --- SUBSCRIBTION --- ///
  ///

  Stream<List<Device>?> get deviceStream {
    if (_controller == null) {
      print("[GWA] DevicesProvider new _controller");
      _controller = BehaviorSubject<List<Device>?>();
      _controller!.onListen = () => _onControllerListened();
      _controller!.onCancel = () => _onControllerCancelled();
    }

    // Repo stream subscription
    _repoSubscription?.cancel();
    _repoSubscription = repository.watchDevices().listen(_onData);

    return _controller!.stream;
  }

  void _onControllerListened() {
    print("[GWA] DevicesProvider _controller.onListen");
  }

  void _onControllerCancelled() {
    print(
        "[GWA] DevicesProvider _controller.onCancel hasListener: ${_controller?.hasListener}");
    if (_controller?.hasListener != true) {
      dispose();
    }
  }

  void dispose() {
    print("[GWA] DevicesProvider dispose");
    _controller?.close();
    _controller = null;

    _repoSubscription?.cancel();
    _repoSubscription = null;
  }

  Future<void> _onData(List<Device> data) async {
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
      if (request == _searchText) {
        _onFilterData();
      }
    });
  }

  Future<void> _onFilterData() async {
    List<Device>? result;

    if (_data != null) {
      result = _data!
          .where((element) =>
              (_selectedType == null && fetchAllDevicesAllowed) ||
              (_selectedType != null && element.deviceType == _selectedType))
          .where((element) =>
              (_searchText == null && fetchAllDevicesAllowed) ||
              (_searchText == null && _selectedType != null) ||
              (_searchText?.isNotEmpty == true &&
                  element.friendlyName?.contains(_searchText!) == true))
          .toList();
    }

    _controller?.sink.add(result);
  }
}
