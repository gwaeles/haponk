import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:haponk/core/hass/datasources/hass_api.dart';
import 'package:haponk/core/hass/models/events/discovery_info_model.dart';
import 'package:haponk/core/hive/datasources/boxes_provider.dart';
import 'package:haponk/core/network/api_status.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/rxdart.dart';

const String prefLongLivedAccessToken = "PREF_LONG_LIVED_ACCESS_TOKEN";
const String configsHiveKey = "configs";

class ConfigRepository {
  final ConfigBoxCallback configBox;
  final FlutterSecureStorage storage;
  final Dio dio;

  ConfigRepository({
    required this.configBox,
    required this.storage,
    required this.dio,
  });

  BehaviorSubject<Config>? _controller;
  StreamSubscription? _hiveSubscription;

  ///
  /// --- CONFIG STREAM --- ///
  ///

  Stream<Config> configStream({required int key}) {
    if (_controller == null) {
      _controller = BehaviorSubject(
        onCancel: () => _onCancel(),
      );
    }

    // Hive subscription
    if (_hiveSubscription == null) {
      configBox().then(
        (box) {
          _hiveSubscription?.cancel();
          _hiveSubscription = box.watch(key: key).listen(_onBoxEvent);
          if (_controller?.hasValue != true && box.containsKey(key)) {
            // Push current value on stream
            _onBoxEvent(
              BoxEvent(
                key,
                box.get(key),
                false,
              ),
            );
          }
        },
      );
    }
    return _controller!.stream;
  }

  Future<Config> getLastConfig() async {
    final Box<Config> box = await configBox();

    Config? result;
    for (int i = 0; i < box.length; i++) {
      final config = box.getAt(i);
      if (result == null ||
          (result.lastConnection == null && config?.lastConnection != null) ||
          (result.lastConnection != null &&
              config?.lastConnection != null &&
              config!.lastConnection!.compareTo(result.lastConnection!) > 0)) {
        result = config;
      }
    }

    if (result == null) {
      // Create empty config
      result = Config(
        id: 0,
      );
      await box.put(result.id, result);
    }

    return result;
  }

  void _onCancel() {
    if (_controller?.hasListener == false) {
      _controller?.close();
      _controller = null;
    }
  }

  void dispose() {
    _controller?.close();
    _controller = null;
    _hiveSubscription?.cancel();
    _hiveSubscription = null;
  }

  Future<void> _onBoxEvent(BoxEvent event) async {
    debugPrint("[CONFIG] _onConfigDataHive, key: ${event.key} ");
    if (event.value is Config) {
      _onConfigData(event.key, event.value);
    }
  }

  Future<void> _onConfigData(dynamic key, Config config) async {
    String? internalUrl = null;
    String? externalUrl = null;
    String? accessToken = await storage.read(
      key: prefLongLivedAccessToken,
    );

    if (accessToken == null) {
      // Initiale config
      try {
        final String json = await rootBundle.loadString("assets/config/config.json");
        final defaultConfig = jsonDecode(json) as Map<String, dynamic>;
        accessToken = defaultConfig.containsKey("longLivedToken") ? defaultConfig["longLivedToken"] : null;
        if (config.internalUrl == null) {
          internalUrl = defaultConfig.containsKey("internalUrl") ? defaultConfig["internalUrl"] : null;
          externalUrl = defaultConfig.containsKey("externalUrl") ? defaultConfig["externalUrl"] : null;
        }
        if (accessToken != null && accessToken.isNotEmpty) {
          await storage.write(
            key: prefLongLivedAccessToken,
            value: accessToken,
          );
        }
      } catch (e) {
        debugPrint("[CONFIG] No config file");
      }
    }

    final entity = config.copyWith(
      accessToken: accessToken,
      internalUrl: internalUrl ?? config.internalUrl,
      externalUrl: externalUrl ?? config.externalUrl,
    );

    _controller?.sink.add(entity);
  }

  ///
  /// --- Update --- ///
  ///

  Future<bool> update(Config config) async {
    // Update access token
    if (config.accessToken?.isNotEmpty == true) {
      await storage.write(key: prefLongLivedAccessToken, value: config.accessToken!);
    } else {
      await storage.delete(key: prefLongLivedAccessToken);
    }

    try {
      // update config
      final Box<Config> box = await configBox();
      final updatedConfigHive = config.copyWith(
        accessToken: null,
      );

      await box.put(
        updatedConfigHive.id,
        updatedConfigHive,
      );
    } catch (e) {
      return false;
    }

    return true;
  }

  ///
  /// --- TRY CONNECTION --- ///
  ///

  /// Return null if connexion fail
  /// Return config updated if succeed
  Future<Config?> tryConnect(Config config) async {
    if (config.internalUrl == null) {
      return null;
    }

    Uri uri = Uri.parse(config.internalUrl!);
    List<String> pathSegments = []
      ..addAll(uri.pathSegments)
      ..add("api");
    uri = uri.replace(pathSegments: pathSegments);

    HassApi _hassApi = HassApi(
      dio,
      baseUrl: uri.toString(),
    );

    try {
      final response = await _hassApi.config(
        authorization: 'Bearer ${config.accessToken}',
      );
      if (response.response.statusCode == ApiStatus.ok) {
        if (response.data != null) {
          final DiscoveryInfoModel discoveryInfo = DiscoveryInfoModel.fromJson(response.data as Map<String, dynamic>);

          // Update config
          final updatedConfigHive = config.copyWith(
            externalUrl: discoveryInfo.externalUrl,
            internalUrl: discoveryInfo.internalUrl,
            locationName: discoveryInfo.locationName,
            version: discoveryInfo.version,
            lastConnection: DateTime.now(),
          );

          return updatedConfigHive;
        }
      }
    } on DioError catch (e) {
      print(e.message);
      if (e.response?.statusCode == 401) {
        print("401");
        return config;
      }
      return null;
    } catch (e) {
      return null;
    }

    return null;
  }
}
