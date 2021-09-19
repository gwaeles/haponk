import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:haponk/core/db/database.dart';

import 'package:haponk/core/hass/datasources/hass_api.dart';
import 'package:haponk/core/hass/models/events/discovery_info_model.dart';
import 'package:haponk/core/network/api_status.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:haponk/core/db/database_extension.dart';

const String PREF_LONG_LIVED_ACCESS_TOKEN = "PREF_LONG_LIVED_ACCESS_TOKEN";

class ConfigRepository {
  final Database db;
  final FlutterSecureStorage storage;
  final Dio dio;

  ConfigRepository({
    required this.db,
    required this.storage,
    required this.dio,
  });

  List<StreamController<Config>?> _controllers = [];
  StreamSubscription? _dbSubscription;
  Config? _currentConfig;

  ///
  /// --- CONFIG STREAM --- ///
  ///

  Stream<Config> addListener() {
    final _controller = StreamController<Config>();
    _controller.onCancel = () => _onControllerCancelled(_controller);
    _controllers.add(_controller);

    // DB subscription
    _dbSubscription?.cancel();
    _dbSubscription = db.watchConfig().listen(_onConfigData);

    return _controller.stream;
  }

  Config? get currentConfig => _currentConfig;

  void dispose() {
    for (var _controller in _controllers) {
      _controller?.close();
    }
    _controllers.clear();

    _dbSubscription?.cancel();
    _dbSubscription = null;
  }

  void _onControllerCancelled(StreamController<Config> controller) {
    _controllers.remove(controller);

    // Cancel DB subscription on last listener cancel
    if (_controllers.length == 0) {
      dispose();
    }
  }

  Future<void> _onConfigData(ConfigDBO? event) async {
    String? accessToken = await storage.read(
      key: PREF_LONG_LIVED_ACCESS_TOKEN,
    );

    if (accessToken == null) {
      // Initiale config
      try {
        final String json =
            await rootBundle.loadString("assets/config/config.json");
        final defaultConfig = jsonDecode(json) as Map<String, dynamic>;
        accessToken = defaultConfig.containsKey("longLivedToken")
            ? defaultConfig["longLivedToken"]
            : null;
        if (accessToken != null && accessToken.isNotEmpty) {
          await storage.write(
            key: PREF_LONG_LIVED_ACCESS_TOKEN,
            value: accessToken,
          );
        }
      } catch (e) {
        debugPrint("[CONFIG] No config file");
      }
    }

    final entity = event?.toEntity();

    if (entity != null) {
      _currentConfig = entity.copyWith(
        accessToken: accessToken,
      );
    } else if (_currentConfig != null) {
      _currentConfig = _currentConfig!.copyWith(
        accessToken: accessToken,
      );
    }

    if (_currentConfig != null) {
      for (var _controller in _controllers) {
        _controller?.sink.add(_currentConfig!);
      }
    }
  }

  ///
  /// --- TRY CONNECTION --- ///
  ///

  Future<bool> tryConnect(String? url) async {
    if (url == null) {
      return false;
    }

    Uri uri = Uri.parse(url);
    List<String> pathSegments = []
      ..addAll(uri.pathSegments)
      ..add("api");
    uri = uri.replace(pathSegments: pathSegments);

    HassApi _hassApi = HassApi(
      dio,
      baseUrl: uri.toString(),
    );

    try {
      ConfigDBO? config = await db.getConfig();

      if (config == null) {
        // Create config
        final newConfig = ConfigDBO(
          id: 1,
          internalUrl: url,
          requiresApiPassword: false,
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
          final updatedConfig = config!.copyWith(
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

  Future<void> setAccessToken(String value) async {
    if (value.isNotEmpty) {
      await storage.write(key: PREF_LONG_LIVED_ACCESS_TOKEN, value: value);
      _onConfigData(null);
    } else {
      await storage.delete(key: PREF_LONG_LIVED_ACCESS_TOKEN);
    }
  }
}
