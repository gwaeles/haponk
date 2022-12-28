import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/data/connection/models/constants.dart';
import 'package:haponk/data/connection/models/device_type_converter.dart';
import 'package:haponk/data/connection/models/events/data_model.dart';
import 'package:haponk/data/connection/models/events/state_model.dart';
import 'package:haponk/data/connection/models/messages/call_service_message_model.dart';
import 'package:haponk/data/connection/models/messages/get_config_message_model.dart';
import 'package:haponk/data/connection/models/messages/get_services_message_model.dart';
import 'package:haponk/data/connection/models/messages/get_states_message_model.dart';
import 'package:haponk/data/connection/models/messages/send_message_model.dart';
import 'package:haponk/data/connection/models/messages/subscribe_message_model.dart';
import 'package:haponk/data/connection/models/messages/unsubscribe_message_model.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';
import 'package:haponk/domain/config/entities/config.dart';
import 'package:haponk/data/connection/datasources/web_socket_service.dart';
import 'package:haponk/domain/connection/entities/constants.dart';

import 'package:haponk/domain/connection/entities/message.dart';
import 'package:haponk/domain/devices/entities/device.dart';

final connectionRepositoryProvider = Provider(ConnectionRepository.new);
final connectionMessagesProvider = StateProvider.autoDispose<Message?>(
  (ref) => null,
);
final connectionTypeProvider = StateProvider.autoDispose<ConnectionType>(
  (ref) => ConnectionType.idle,
);

class ConnectionRepository {
  // final DevicesRepository devicesRepository;

  final Ref ref;

  ConnectionRepository(this.ref);

  // StreamController<Message>? _controller;
  String? _accessToken;
  WebSocketService? localWebSocket;
  WebSocketService? distantWebSocket;
  Config? _currentConfig;

  ConnectionType _connectionType = ConnectionType.idle;
  // BehaviorSubject<ConnectionType>? _controllerConnectionType;

  WebSocketService? get currentWebSocket {
    if (_connectionType == ConnectionType.local) {
      return localWebSocket;
    }
    if (_connectionType == ConnectionType.distant) {
      return distantWebSocket;
    }
    return null;
  }

  ConnectionType get currentConnectionType => _connectionType;

  ///
  /// --- CONNECTION --- ///
  ///

  Future<bool> connect(Config config) async {
    if (_connectionType != ConnectionType.idle ||
        config.accessToken == null ||
        config.internalUrl == null) {
      return false;
    }

    _currentConfig = config;
    ref
        .read(
          connectionMessagesProvider.notifier,
        )
        .state = Message("Connecting");
    _accessToken = config.accessToken;

    localWebSocket = WebSocketService(
      accessToken: _accessToken!,
      url: config.internalUrl!,
      connectionType: ConnectionType.local,
      onAuthOk: _onAuthOk,
      onStates: _onStates,
      onState: _onState,
      onInfo: _onInfo,
      onError: _onError,
      onDone: _onDone,
    )..connect();

    if (config.externalUrl != null) {
      distantWebSocket = WebSocketService(
        accessToken: _accessToken!,
        url: config.externalUrl!,
        connectionType: ConnectionType.distant,
        onAuthOk: _onAuthOk,
        onStates: _onStates,
        onState: _onState,
        onInfo: _onInfo,
        onError: _onError,
        onDone: _onDone,
      )..connect();
    }

    return true;
  }

  void disconnect() {
    ref
        .read(
          connectionMessagesProvider.notifier,
        )
        .state = Message("Disconnected");

    unsubscribe();

    localWebSocket?.disconnect();
    localWebSocket = null;
    distantWebSocket?.disconnect();
    distantWebSocket = null;

    _connectionType = ConnectionType.idle;

    ref
        .read(
          connectionTypeProvider.notifier,
        )
        .state = _connectionType;
  }

  ///
  /// --- WEBSOCKET CALLBACKS --- ///
  ///

  void _onAuthOk(ConnectionType connectionType) {
    print("$connectionType: _onAuthOk");
    if (_connectionType == ConnectionType.idle) {
      _connectionType = connectionType;

      //db.updateConfigDate();

      ref
          .read(
            connectionTypeProvider.notifier,
          )
          .state = _connectionType;

      subscribe();

      getStates();

      getServices();
    } else {
      // Already connected
      if (connectionType == ConnectionType.distant) {
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
      ref
          .read(
            connectionMessagesProvider.notifier,
          )
          .state = Message(message);
    }
  }

  void _onStates(ConnectionType connectionType, List<StateModel> states) {
    if (connectionType == _connectionType) {
      // Synchro de tous les states
      final list = states
          .where(
            (state) => state.entityId != null,
          )
          .map(
            (state) => ComparableDevice(
              id: state.entityId!,
              deviceType: state.deviceType(),
              friendlyName: state.attributes?.friendlyName,
            ),
          )
          .where(
            (device) => device.deviceType != DeviceType.UNKNOWN,
          )
          .toList();

      ref
          .read(
            devicesRepositoryProvider,
          )
          .updateList(list);

      states.forEach(
        (state) => _onState(
          connectionType,
          state,
        ),
      );
    }
  }

  void _onState(ConnectionType connectionType, StateModel state) async {
    final DeviceType deviceType = state.deviceType();
    if (connectionType == _connectionType &&
        state.entityId != null &&
        deviceType != DeviceType.UNKNOWN) {
      // Synchro d'un state
      final DevicesRepository devicesRepository =
          ref.read(devicesRepositoryProvider);
      final Device storedDevice =
          await devicesRepository.getDevice(state.entityId!) ??
              Device(id: state.entityId!);

      final Device updatedDevice = storedDevice.copyWith(
        deviceType: deviceType,
        state: state.state,
        lastChanged: state.lastChanged,
        lastUpdated: state.lastUpdated,
        friendlyName: state.attributes?.friendlyName,
        colorMode: state.attributes?.colorMode ??
            (state.attributes?.supportedColorModes?.isNotEmpty == true
                ? state.attributes?.supportedColorModes?.first
                : null),
        brightness: state.attributes?.brightness,
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

      devicesRepository.updateDevice(updatedDevice);
    }
  }

  void _onError(ConnectionType connectionType, Object error) {
    print("$connectionType: _onError");
    if (connectionType == _connectionType) {
      ref
          .read(
            connectionMessagesProvider.notifier,
          )
          .state = Message("on Error");
    }
  }

  void _onDone(ConnectionType connectionType) {
    print("$connectionType: _onDone");
    if (connectionType == _connectionType) {
      ref
          .read(
            connectionMessagesProvider.notifier,
          )
          .state = Message("on Done");
      disconnect();
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

  void callService(
    String domain,
    String service,
    String entityId, [
    int? brightness,
  ]) {
    if (_connectionType == ConnectionType.idle && _currentConfig != null) {
      connect(_currentConfig!);
    }
    _send(
      CallServiceMessageModel(
        id: _getNextCommandId(),
        domain: domain,
        service: service,
        serviceData: DataModel(
          entityId: entityId,
          brightness: brightness,
        ),
      ),
    );
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
