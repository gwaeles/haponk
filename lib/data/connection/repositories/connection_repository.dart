import 'dart:async';

import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/core/hass/models/device_type_converter.dart';
import 'package:haponk/core/hass/models/events/data_model.dart';
import 'package:haponk/core/hass/models/events/state_model.dart';
import 'package:haponk/core/hass/models/messages/call_service_message_model.dart';
import 'package:haponk/core/hass/models/messages/get_config_message_model.dart';
import 'package:haponk/core/hass/models/messages/get_services_message_model.dart';
import 'package:haponk/core/hass/models/messages/get_states_message_model.dart';
import 'package:haponk/core/hass/models/messages/send_message_model.dart';
import 'package:haponk/core/hass/models/messages/subscribe_message_model.dart';
import 'package:haponk/core/hass/models/messages/unsubscribe_message_model.dart';
import 'package:haponk/core/hive/datasources/boxes_provider.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:haponk/data/connection/datasources/web_socket_service.dart';

import 'package:haponk/data/connection/entities/message.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/rxdart.dart';

class ConnectionRepository {
  final DeviceListBoxCallback deviceListBox;
  final DeviceBoxCallback deviceBox;

  ConnectionRepository({
    required this.deviceListBox,
    required this.deviceBox,
  });

  StreamController<Message>? _controller;
  String? _accessToken;
  WebSocketService? localWebSocket;
  WebSocketService? distantWebSocket;
  Config? _currentConfig;

  ConnectionType _connectionType = ConnectionType.IDLE;
  BehaviorSubject<ConnectionType>? _controllerConnectionType;

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

  Stream<Message> messageStream() {
    if (_controller == null) {
      _controller = StreamController.broadcast(
        onCancel: () => _onCancel(),
      );
    }

    return _controller!.stream;
  }

  void _onCancel() {
    if (_controller?.hasListener == false) {
      _controller?.close();
      _controller = null;
    }
    if (_controllerConnectionType?.hasListener == false) {
      _controllerConnectionType?.close();
      _controllerConnectionType = null;
    }
  }

  ///
  /// --- CONNECTION --- ///
  ///

  Stream<ConnectionType> connectionTypeStream() {
    if (_controllerConnectionType == null) {
      _controllerConnectionType = BehaviorSubject(
        onCancel: () => _onCancel(),
      );
      _controllerConnectionType?.sink.add(_connectionType);
    }

    return _controllerConnectionType!.stream;
  }

  Future<bool> connect(Config config) async {
    if (_connectionType != ConnectionType.IDLE || config.accessToken == null || config.internalUrl == null) {
      return false;
    }

    _currentConfig = config;
    _controller?.sink.add(Message("Connecting"));
    _accessToken = config.accessToken;

    localWebSocket = WebSocketService(
      accessToken: _accessToken!,
      url: config.internalUrl!,
      connectionType: ConnectionType.LOCAL,
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
        connectionType: ConnectionType.DISTANT,
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
      _connectionType = connectionType;

      //db.updateConfigDate();

      _controllerConnectionType?.sink.add(_connectionType);

      subscribe();

      getStates();

      getServices();
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

  void _onStates(ConnectionType connectionType, List<StateModel> states) async {
    if (connectionType == _connectionType) {
      // Synchro de tous les states
      final Box<List<ComparableDevice>> devicesBox = await deviceListBox();
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

      devicesBox.put(
        deviceListHiveKey,
        list,
      );

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
    if (connectionType == _connectionType && state.entityId != null && deviceType != DeviceType.UNKNOWN) {
      // Synchro d'un state
      final Box<Device> box = await deviceBox();

      if (state.entityId?.startsWith('light.salle') == true) {
        print('ok');
      }

      final Device storedDevice = await box.get(state.entityId!) ?? Device(id: state.entityId!);

      final Device updatedDevice = storedDevice.copyWith(
        deviceType: deviceType,
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

      box.put(
        updatedDevice.id,
        updatedDevice,
      );
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

  void callService(String domain, String service, String entityId) {
    if (_connectionType == ConnectionType.IDLE && _currentConfig != null) {
      connect(_currentConfig!);
    }
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
