import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hapoc/core/db/database.dart';

import 'package:hapoc/core/hass/datasources/hass_api.dart';
import 'package:hapoc/core/hass/models/events/discovery_info_model.dart';
import 'package:hapoc/core/network/api_status.dart';
import 'package:hapoc/dependency_injection.dart';
import 'package:hapoc/features/config/entities/config_entity.dart';
import 'package:hapoc/features/config/repositories/config_repository.dart';

const String PREF_LONG_LIVED_ACCESS_TOKEN = "PREF_LONG_LIVED_ACCESS_TOKEN";

class ConfigRepositoryImpl extends ConfigRepository {
  final Database db;
  final FlutterSecureStorage secureStorage;

  ConfigRepositoryImpl(this.db, this.secureStorage);

  StreamController<ConfigEntity> _controller;
  StreamSubscription _dbSubscription;
  ConfigEntity _currentConfig;

  ///
  /// --- CONFIG STREAM --- ///
  ///

  @override
  Stream<ConfigEntity> listen() {
    dispose();
    _controller = StreamController();
    db.watchConfig().listen(_onConfigData);
    return _controller.stream;
  }

  @override
  ConfigEntity get currentConfig => _currentConfig;

  @override
  void dispose() {
    _controller?.close();
    _controller = null;
    _dbSubscription?.cancel();
    _dbSubscription = null;
  }

  Future<void> _onConfigData(Config event) async {
    final accessToken =
        await secureStorage.read(key: PREF_LONG_LIVED_ACCESS_TOKEN);

    ConfigEntity entity = event == null ? null : ConfigEntity(
      uuid: event.uuid,
      baseUrl: event.baseUrl,
      externalUrl: event.externalUrl,
      internalUrl: event.internalUrl,
      locationName: event.locationName,
      installationType: event.installationType,
      requiresApiPassword: event.requiresApiPassword,
      version: event.version,
      lastConnection: event.lastConnection,
      accessToken: accessToken,
    );

    if (entity != null) {
      _currentConfig = entity;
    }
    else if (_currentConfig != null) {
      _currentConfig = _currentConfig.copyWith(
        accessToken: accessToken,
      );
    }
    _controller?.sink?.add(entity);
  }

  ///
  /// --- TRY CONNECTION --- ///
  ///

  @override
  Future<bool> tryConnect(String url) async {
    if (url == null) {
      return false;
    }

    Uri uri = Uri.tryParse(url);
    List<String> pathSegments = []
      ..addAll(uri.pathSegments)
      ..add("api");
    uri = uri.replace(pathSegments: pathSegments);

    HassApi _hassApi = getIt(param1: uri.toString());

    try {
      Config config = await db.getConfig();

      if (config == null) {
        // Create config
        final Config newConfig = Config(
          id: 1,
          internalUrl: url,
          requiresApiPassword: null,
        );

        await db.insertConfig(newConfig);
        config = await db.getConfig();
      }

      final response = await _hassApi.discoveryInfo();
      if (response.response.statusCode == ApiStatus.OK) {
        if (response.data != null) {
          final DiscoveryInfoModel discoveryInfo = DiscoveryInfoModel.fromJson(
              response.data as Map<String, dynamic>);

          // Update config
          final Config updatedConfig = config.copyWith(
            uuid: discoveryInfo.uuid,
            baseUrl: discoveryInfo.baseUrl,
            externalUrl: discoveryInfo.externalUrl,
            internalUrl: discoveryInfo.internalUrl,
            locationName: discoveryInfo.locationName,
            installationType: discoveryInfo.installationType,
            requiresApiPassword: discoveryInfo.requiresApiPassword,
            version: discoveryInfo.version,
          );

          await db.updateConfig(updatedConfig);

          return true;
        }
      }
    } catch (e) {
      return false;
    }

    return false;
  }

  @override
  Future<void> setAccessToken(String value) async {
    if (value != null && value.isNotEmpty) {
      await secureStorage.write(
          key: PREF_LONG_LIVED_ACCESS_TOKEN, value: value);
      _onConfigData(null);
    } else {
      await secureStorage.delete(key: PREF_LONG_LIVED_ACCESS_TOKEN);
    }
  }
}
