import 'dart:async';

import 'package:haponk/core/db/database.dart';
import 'package:haponk/core/db/database_extension.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/core/hass/models/events/data_model.dart';
import 'package:haponk/core/hass/models/events/state_model.dart';
import 'package:haponk/core/hass/models/messages/call_service_message_model.dart';
import 'package:haponk/core/hass/models/messages/get_config_message_model.dart';
import 'package:haponk/core/hass/models/messages/get_services_message_model.dart';
import 'package:haponk/core/hass/models/messages/get_states_message_model.dart';
import 'package:haponk/core/hass/models/messages/send_message_model.dart';
import 'package:haponk/core/hass/models/messages/subscribe_message_model.dart';
import 'package:haponk/core/hass/models/messages/unsubscribe_message_model.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:haponk/data/connection/datasources/web_socket_service.dart';

import 'package:haponk/data/connection/entities/message.dart';
import 'package:moor/moor.dart';

class ConnectionRepository {
  final Database db;

  ConnectionRepository(this.db);

  StreamController<Message>? _controller;
  String? _accessToken;
  String? _configUuid;
  WebSocketService? localWebSocket;
  WebSocketService? distantWebSocket;

  ConnectionType _connectionType = ConnectionType.IDLE;
  StreamController<ConnectionType>? _controllerConnectionType;

  WebSocketService? get currentWebSocket {
    if (_connectionType == ConnectionType.LOCAL) {
      return localWebSocket;
    }
    if (_connectionType == ConnectionType.DISTANT) {
      return distantWebSocket;
    }
    return null;
  }

  ConnectionType get currentConnectionType => _connectionType;

  Stream<Message> listen() {
    _controller?.close();
    _controller = null;
    _controller = StreamController();
    return _controller!.stream;
  }

  void dispose() {
    _controller?.close();
    _controller = null;
    _controllerConnectionType?.close();
    _controllerConnectionType = null;
  }

  ///
  /// --- CONNECTION --- ///
  ///

  Stream<ConnectionType> listenConnectionType() {
    _controllerConnectionType?.close();
    _controllerConnectionType = null;
    _controllerConnectionType = StreamController();
    return _controllerConnectionType!.stream;
  }

  Future<bool> connect(Config config) async {
    if (_connectionType != ConnectionType.IDLE ||
        config.accessToken == null ||
        config.internalUrl == null) {
      return false;
    }

    _controller?.sink.add(Message("Connecting"));
    _accessToken = config.accessToken;
    _configUuid = config.uuid;

    localWebSocket = WebSocketService(
      accessToken: _accessToken!,
      url: config.internalUrl!,
      connectionType: ConnectionType.LOCAL,
      onAuthOk: _onAuthOk,
      onState: _onState,
      onInfo: _onInfo,
      onError: _onError,
      onDone: _onDone,
    )..connect();

    if (config.externalUrl != null) {
      distantWebSocket = WebSocketService(
        accessToken: _accessToken!,
        url: config.externalUrl!,
        connectionType: ConnectionType.DISTANT,
        onAuthOk: _onAuthOk,
        onState: _onState,
        onInfo: _onInfo,
        onError: _onError,
        onDone: _onDone,
      )..connect();
    }

    return true;
  }

  void disconnect() {
    _controller?.sink.add(Message("Disconnected"));

    unsubscribe();

    localWebSocket?.disconnect();
    localWebSocket = null;
    distantWebSocket?.disconnect();
    distantWebSocket = null;

    _connectionType = ConnectionType.IDLE;

    _controllerConnectionType?.sink.add(_connectionType);
  }

  ///
  /// --- WEBSOCKET CALLBACKS --- ///
  ///

  void _onAuthOk(ConnectionType connectionType) {
    print("$connectionType: _onAuthOk");
    if (_connectionType == ConnectionType.IDLE) {
      if (_configUuid != null) {
        _connectionType = connectionType;

        db.updateConfigDate(_configUuid!);

        _controllerConnectionType?.sink.add(_connectionType);

        subscribe();

        getStates();

        getServices();
      }
    } else {
      // Already connected
      if (connectionType == ConnectionType.DISTANT) {
        distantWebSocket?.disconnect();
        distantWebSocket = null;
      } else {
        localWebSocket?.disconnect();
        localWebSocket = null;
      }
    }
  }

  void _onInfo(ConnectionType connectionType, String message) {
    if (connectionType == _connectionType) {
      _controller?.sink.add(Message(message));
    }
  }

  void _onState(ConnectionType connectionType, StateModel state) async {
    if (connectionType == _connectionType && state.entityId != null) {
      final stateDao = await db.getState(state.entityId!);

      if (stateDao == null) {
        // Create state
        final StatesCompanion newState = StatesCompanion(
          entityId: state.entityId!.toValue(),
          state: state.state?.toValue() ?? Value.absent(),
          lastChanged: state.lastChanged?.toValue() ?? Value.absent(),
          lastUpdated: state.lastUpdated?.toValue() ?? Value.absent(),
          friendlyName:
              state.attributes?.friendlyName?.toValue() ?? Value.absent(),
          supportedFeatures:
              state.attributes?.supportedFeatures?.toValue() ?? Value.absent(),
          currentPosition:
              state.attributes?.currentPosition?.toValue() ?? Value.absent(),
          lastTriggered:
              state.attributes?.lastTriggered?.toValue() ?? Value.absent(),
          mode: state.attributes?.mode?.toValue() ?? Value.absent(),
          temperature:
              state.attributes?.temperature?.toValue() ?? Value.absent(),
          humidity: state.attributes?.humidity?.toValue() ?? Value.absent(),
          pressure: state.attributes?.pressure?.toValue() ?? Value.absent(),
          windBearing:
              state.attributes?.windBearing?.toValue() ?? Value.absent(),
          windSpeed: state.attributes?.windSpeed?.toValue() ?? Value.absent(),
          attribution:
              state.attributes?.attribution?.toValue() ?? Value.absent(),
          isOn: state.attributes?.isOn?.toValue() ?? Value.absent(),
          deviceClass:
              state.attributes?.deviceClass?.toValue() ?? Value.absent(),
          unitOfMeasurement:
              state.attributes?.unitOfMeasurement?.toValue() ?? Value.absent(),
          current: state.attributes?.current?.toValue() ?? Value.absent(),
          voltage: state.attributes?.voltage?.toValue() ?? Value.absent(),
        );

        await db.insertState(newState);
      } else if (stateDao.state != state.state) {
        // Update state
        final StateDBO updatedState = stateDao.copyWith(
          state: state.state,
          lastChanged: state.lastChanged,
          lastUpdated: state.lastUpdated,
          friendlyName: state.attributes?.friendlyName,
          supportedFeatures: state.attributes?.supportedFeatures,
          currentPosition: state.attributes?.currentPosition,
          lastTriggered: state.attributes?.lastTriggered,
          mode: state.attributes?.mode,
          temperature: state.attributes?.temperature,
          humidity: state.attributes?.humidity,
          pressure: state.attributes?.pressure,
          windBearing: state.attributes?.windBearing,
          windSpeed: state.attributes?.windSpeed,
          attribution: state.attributes?.attribution,
          isOn: state.attributes?.isOn,
          deviceClass: state.attributes?.deviceClass,
          unitOfMeasurement: state.attributes?.unitOfMeasurement,
          current: state.attributes?.current,
          voltage: state.attributes?.voltage,
        );

        await db.updateState(updatedState);
      }
    }
  }

  void _onError(ConnectionType connectionType, Object error) {
    print("$connectionType: _onError");
    if (connectionType == _connectionType) {
      _controller?.sink.add(Message("on Error"));
    }
  }

  void _onDone(ConnectionType connectionType) {
    print("$connectionType: _onDone");
    if (connectionType == _connectionType) {
      _controller?.sink.add(Message("on Done"));
    }
  }

  ///
  /// --- EVENTS --- ///
  ///

  void subscribe() {
    _send(SubscribeMessageModel(id: _getNextCommandId()));
  }

  void unsubscribe() {
    _send(UnsubscribeMessageModel(id: _getNextCommandId()));
  }

  void getConfig() {
    _send(GetConfigMessageModel(id: _getNextCommandId()));
  }

  void getServices() {
    _send(GetServicesMessageModel(id: _getNextCommandId()));
  }

  void getStates() {
    _send(GetStatesMessageModel(id: _getNextCommandId()));
  }

  void callService(String domain, String service, String entityId) {
    _send(CallServiceMessageModel(
      id: _getNextCommandId(),
      domain: domain,
      service: service,
      serviceData: DataModel(entityId: entityId),
    ));
  }

  ///
  /// --- INTERNAL --- ///
  ///

  int _getNextCommandId() {
    return currentWebSocket?.nextCommandId ?? -1;
  }

  void _send(SendMessageModel object) {
    if ((object.id ?? 0) <= 0) return;

    currentWebSocket?.send(object);
  }
}
