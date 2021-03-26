import 'package:hapoc/features/config/entities/config_entity.dart';
import 'package:hapoc/features/connection/entities/message.dart';

abstract class ConnectionRepository {
  Stream<Message> listen();
  void dispose();
  Future<bool> connect(ConfigEntity config);
  void disconnect();
  void subscribe();
  void unsubscribe();
  void getConfig();
  void getServices();
  void getStates();
}
