import 'package:haponk/features/config/entities/config_entity.dart';

abstract class ConfigRepository {
  Stream<ConfigEntity> addListener();
  ConfigEntity get currentConfig;
  void dispose();
  Future<bool> tryConnect(String url);
  Future<void> setAccessToken(String value);
}
