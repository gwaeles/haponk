import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:haponk/core/db/database.dart';

import 'package:haponk/core/hass/datasources/hass_api.dart';
import 'package:haponk/core/hass/models/events/discovery_info_model.dart';
import 'package:haponk/core/network/api_status.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:haponk/core/db/database_extension.dart';
import 'package:rxdart/rxdart.dart';

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

  BehaviorSubject<Config>? _controller;
  StreamSubscription? _dbSubscription;

  ///
  /// --- CONFIG STREAM --- ///
  ///

  Stream<Config> configStream() {
    if (_controller == null) {
      _controller = BehaviorSubject(
        onCancel: () => _onCancel(),
      );
    }

    // DB subscription
    _dbSubscription?.cancel();
    _dbSubscription = db.watchConfig().listen(_onConfigData);

    return _controller!.stream;
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
    _dbSubscription?.cancel();
    _dbSubscription = null;
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

    final entity = event?.toEntity(
      accessToken: accessToken,
    );

    if (entity != null) {
      _controller?.sink.add(entity);
    }
  }

  ///
  /// --- TRY CONNECTION --- ///
  ///

  Future<Config?> tryConnect(
    String? url, [
    String? accessToken,
  ]) async {
    if (url == null) {
      return null;
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
        );

        await db.insertConfig(newConfig);
        config = await db.getConfig();
      }

      final response = await _hassApi.config(
        authorization: 'Bearer $accessToken',
      );
      if (response.response.statusCode == ApiStatus.OK) {
        if (response.data != null) {
          final DiscoveryInfoModel discoveryInfo = DiscoveryInfoModel.fromJson(
              response.data as Map<String, dynamic>);

          // Update config
          final updatedConfig = config!.copyWith(
            externalUrl: Value(discoveryInfo.externalUrl),
            internalUrl: Value(discoveryInfo.internalUrl),
            locationName: Value(discoveryInfo.locationName),
            version: Value(discoveryInfo.version),
          );

          await db.updateConfig(updatedConfig);

          return updatedConfig.toEntity(
            accessToken: accessToken,
          );
        }
      }
    } on DioError catch (e) {
      print(e.message);
      if (e.response?.statusCode == 401) {
        print("401");
      }
      return null;
    } catch (e) {
      return null;
    }

    return null;
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
