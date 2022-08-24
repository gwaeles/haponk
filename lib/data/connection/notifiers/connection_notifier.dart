import 'dart:async';

import 'package:flutter/material.dart';

import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:haponk/data/connection/repositories/connection_repository.dart';

class ConnectionNotifier extends ValueNotifier<ConnectionType> {
  ConnectionNotifier({
    required this.connectionRepository,
  }) : super(ConnectionType.IDLE) {
    _init();
  }

  ConnectionRepository connectionRepository;
  StreamSubscription? _subscription;

  ///
  /// --- Messaging --- ///
  ///

  void _init() {
    _subscription = connectionRepository.connectionTypeStream().listen(_onData);
  }

  void _onData(ConnectionType event) {
    value = event;
  }

  //{Function? onError, void onDone()?, bool? cancelOnError}

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  ///
  /// --- Request --- ///
  ///

  bool get isConnected => value != ConnectionType.IDLE;
  bool get isNotConnected => value == ConnectionType.IDLE;

  void connect(Config config) {
    connectionRepository.connect(config);
  }

  void disconnect() {
    connectionRepository.disconnect();
  }

  void subscribe() {
    connectionRepository.subscribe();
  }

  void unsubscribe() {
    connectionRepository.unsubscribe();
  }

  void getConfig() {
    connectionRepository.getConfig();
  }

  void getServices() {
    connectionRepository.getServices();
  }

  void getStates() {
    connectionRepository.getStates();
  }

  void callService({
    required String domain,
    required String service,
    required String entityId,
  }) {
    connectionRepository.callService(domain, service, entityId);
  }
}
