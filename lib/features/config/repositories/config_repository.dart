
import 'package:hapoc/features/config/entities/config_entity.dart';

abstract class ConfigRepository {
  Stream<ConfigEntity> listen();
  ConfigEntity get currentConfig;
  void dispose();
  Future<bool> tryConnect(String url);
  Future<void> setAccessToken(String value);
}
