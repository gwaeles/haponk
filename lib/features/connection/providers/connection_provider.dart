import 'package:flutter/material.dart';

import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/features/config/entities/config_entity.dart';
import 'package:haponk/features/connection/entities/message.dart';
import 'package:haponk/features/connection/repositories/connection_repository.dart';

class ConnectionProvider with ChangeNotifier {
  ConnectionRepository connectionRepository;

  ConnectionProvider(this.connectionRepository);

  ConnectionType get currentConnectionType =>
      connectionRepository.currentConnectionType;

  Stream<ConnectionType> get connectionStream =>
      connectionRepository.listenConnectionType();

  ///
  /// --- Messaging --- ///
  ///

  Stream<Message> get messageStream => connectionRepository.listen();

  @override
  void dispose() {
    connectionRepository.dispose();
    super.dispose();
  }

  ///
  /// --- Request --- ///
  ///

  bool get isConnected => currentConnectionType != ConnectionType.IDLE;
  bool get isNotConnected => currentConnectionType == ConnectionType.IDLE;

  void connect(ConfigEntity config) {
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
