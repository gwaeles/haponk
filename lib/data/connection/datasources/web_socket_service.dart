import 'dart:convert';

import 'package:haponk/data/connection/models/events/state_model.dart';
import 'package:haponk/data/connection/models/messages/auth_invalid_message_model.dart';
import 'package:haponk/data/connection/models/messages/auth_message_model.dart';
import 'package:haponk/data/connection/models/messages/auth_ok_message_model.dart';
import 'package:haponk/data/connection/models/messages/auth_required_message_model.dart';
import 'package:haponk/data/connection/models/messages/command_result_message_model.dart';
import 'package:haponk/data/connection/models/messages/event_message_model.dart';
import 'package:haponk/data/connection/models/messages/get_states_message_model.dart';
import 'package:haponk/data/connection/models/messages/message_model.dart';
import 'package:haponk/data/connection/models/messages/send_message_model.dart';
import 'package:haponk/data/connection/models/messages/subscribe_message_model.dart';
import 'package:haponk/data/connection/models/messages/unsubscribe_message_model.dart';
import 'package:haponk/domain/connection/entities/constants.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketService {
  final String accessToken;
  final String url;
  final ConnectionType connectionType;

  final Function(ConnectionType connectionType) onAuthOk;
  final Function(ConnectionType connectionType, List<StateModel> states) onStates;
  final Function(ConnectionType connectionType, StateModel state) onState;
  final Function(ConnectionType connectionType, String message) onInfo;
  final Function(ConnectionType connectionType, Object error) onError;
  final Function(ConnectionType connectionType) onDone;

  String? _webSocketUrl;
  IOWebSocketChannel? _channel;
  int _nextCommandId = 1;
  int? _subscribeId;
  int? _statesId;

  WebSocketService({
    required this.accessToken,
    required this.url,
    required this.onAuthOk,
    required this.onStates,
    required this.onState,
    required this.onError,
    required this.onDone,
    required this.onInfo,
    required this.connectionType,
  });

  int get nextCommandId {
    final result = _nextCommandId;
    _nextCommandId++;
    return result;
  }

  Future<bool> connect() async {
    try {
      _webSocketUrl = webSocketTransform(url);

      _channel = IOWebSocketChannel.connect(_webSocketUrl!);

      _channel!.stream.listen(_onData, onError: _onError, onDone: _onDone);
    } catch (e) {
      return false;
    }

    return true;
  }

  String webSocketTransform(String url) {
    Uri uri = Uri.parse(url);
    List<String> pathSegments = []
      ..addAll(uri.pathSegments)
      ..add("api")
      ..add("websocket");
    final scheme = uri.scheme == "https" ? "wss" : "ws";
    uri = uri.replace(scheme: scheme, pathSegments: pathSegments);
    return uri.toString();
  }

  void disconnect() {
    _channel?.sink.close(status.goingAway);
    _channel = null;
  }

  void send(SendMessageModel object) {
    if (object is SubscribeMessageModel) {
      _subscribeId = object.id;
    }
    if (object is GetStatesMessageModel) {
      _statesId = object.id;
    }
    if (object is UnsubscribeMessageModel) {
      object = UnsubscribeMessageModel(
        id: object.id!,
        subscription: _subscribeId!,
      );
    }

    _channel?.sink.add(jsonEncode(object.toJson()));
  }

  ///
  /// --- EVENTS ---///
  ///

  void _onData(dynamic message) {
    Map<String, dynamic> json = jsonDecode(message);
    MessageModel model = MessageModel.fromJson(json);

    if (model is AuthRequiredMessageModel) {
      final response = AuthMessageModel(accessToken: accessToken);
      send(response);
    } else if (model is AuthOkMessageModel) {
      onAuthOk.call(connectionType);
      onInfo.call(connectionType, "Authenticated");
    } else if (model is AuthInvalidMessageModel) {
      onInfo.call(connectionType, "Invalid Auth");
    } else if (model is CommandResultMessageModel) {
      onInfo.call(connectionType, "Result id:${model.id}, success:${model.success}");

      if (model.id == _statesId && model.result != null) {
        final result = model.result as List<dynamic>;
        final stateList = result
            .map(
              (item) => StateModel.fromJson(item as Map<String, dynamic>),
            )
            .toList();
        onStates.call(connectionType, stateList);
      }
    } else if (model is EventMessageModel) {
      final entityId = model.event.data?.entityId;
      final friendlyName = model.event.data?.newState?.attributes?.friendlyName;
      final newState = model.event.data?.newState?.state;
      final oldState = model.event.data?.oldState?.state;
      if (newState != oldState) {
        onInfo.call(connectionType, "$entityId $friendlyName $newState");
        onState.call(connectionType, model.event.data!.newState!);
      }
    }
  }

  void _onError(Object error) {
    _channel?.sink.close(status.goingAway);
    _channel = null;
    onError.call(connectionType, error);
  }

  void _onDone() {
    _channel?.sink.close(status.goingAway);
    _channel = null;
    onDone.call(connectionType);
  }
}
