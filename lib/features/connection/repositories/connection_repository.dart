import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/features/config/entities/config_entity.dart';
import 'package:haponk/features/connection/entities/message.dart';

abstract class ConnectionRepository {
  Stream<Message> listen();
  void dispose();
  Future<bool> connect(ConfigEntity config);
  ConnectionType get currentConnectionType;
  Stream<ConnectionType> listenConnectionType();
  void disconnect();
  void subscribe();
  void unsubscribe();
  void getConfig();
  void getServices();
  void getStates();
  void callService(String domain, String service, String entityId);
}
