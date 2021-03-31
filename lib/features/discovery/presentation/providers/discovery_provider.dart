import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hapoc/features/discovery/domain/entities/service_entity.dart';
import 'package:hapoc/features/discovery/domain/usecases/listen_discover_use_case.dart';
import 'package:hapoc/features/discovery/domain/usecases/start_discover_use_case.dart';
import 'package:hapoc/features/discovery/domain/usecases/stop_discover_use_case.dart';

class DiscoveryProvider extends ChangeNotifier {
  final ListenDiscoverUseCase listenDiscoverUseCase;
  final StartDiscoverUseCase startDiscoverUseCase;
  final StopDiscoverUseCase stopDiscoverUseCase;
  // StreamSubscription<List<ServiceEntity>> _subscription;

  DiscoveryProvider(this.listenDiscoverUseCase, this.startDiscoverUseCase,
      this.stopDiscoverUseCase);

  // List<ServiceEntity> _resolvedServices;

  // List<ServiceEntity> get discoveredServices =>
  //     List.of(_resolvedServices);

  Stream<List<ServiceEntity>> get stream => listenDiscoverUseCase();

  void start() {
    // _subscription?.cancel();
    // _subscription = listenDiscoverUseCase().listen(_onEventOccurred);
    startDiscoverUseCase();
  }

  void stop() {
    // _subscription?.cancel();
    // _subscription = null;
    stopDiscoverUseCase();
  }

  // void _onEventOccurred(List<ServiceEntity> snapshot) {
  //   _resolvedServices = snapshot;
  //   notifyListeners();
  // }

  @override
  void dispose() {
    stop();
    super.dispose();
  }
}
