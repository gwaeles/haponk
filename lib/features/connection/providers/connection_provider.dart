import 'package:flutter/material.dart';
import 'package:hapoc/core/states/connexion_state.dart' as cx;

import 'package:hapoc/core/errors/failures.dart';
import 'package:hapoc/features/config/entities/config_entity.dart';
import 'package:hapoc/features/connection/entities/message.dart';
import 'package:hapoc/features/connection/repositories/connection_repository.dart';

class ConnectionProvider
    with ChangeNotifier
    implements cx.ListenerConnectionState {
  ConnectionRepository connectionEvent;
  cx.ConnectionState _state = cx.ConnectionState.INITIAL;
  bool _isConnected = false;
  Failure _error;

  ConnectionProvider(this.connectionEvent);

  ///
  /// --- State --- ///
  ///

  @override
  cx.ConnectionState get state => _state;

  @override
  void setState(cx.ConnectionState state) {
    _state = state;
    notifyListeners();
  }

  ///
  /// --- Messaging --- ///
  ///

  Stream<Message> get messageStream => connectionEvent.listen();

  @override
  void dispose() {
    connectionEvent.dispose();
    super.dispose();
  }

  ///
  /// --- Request --- ///
  ///

  bool get isConnected => _isConnected;
  Failure get error => _error;

  void connect(ConfigEntity config) {
    connectionEvent.connect(config);
  }

  void disconnect() {
    connectionEvent.disconnect();
  }

  void subscribe() {
    connectionEvent.subscribe();
  }

  void unsubscribe() {
    connectionEvent.unsubscribe();
  }

  void getConfig() {
    connectionEvent.getConfig();
  }

  void getServices() {
    connectionEvent.getServices();
  }

  void getStates() {
    connectionEvent.getStates();
  }
}
