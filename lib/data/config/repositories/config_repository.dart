import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:haponk/core/network/client.dart';
import 'package:haponk/data/config/datasources/hass_api.dart';

import 'package:haponk/data/connection/models/events/discovery_info_model.dart';
import 'package:haponk/core/network/api_status.dart';
import 'package:haponk/data/config/datasources/config_hive_source.dart';
import 'package:haponk/domain/config/entities/config.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String prefLongLivedAccessToken = "PREF_LONG_LIVED_ACCESS_TOKEN";
const String configsHiveKey = "configs";

final configRepositoryProvider = Provider(ConfigRepository.new);
final secureStorageProvider = Provider((ref) => FlutterSecureStorage());
final accessTokenProvider = StateProvider<String?>((ref) => null);
final configProvider = StateProvider.autoDispose.family<Config?, int>(
  (ref, int key) {
    final AsyncValue<Box<Config>> asyncBox = ref.watch(configBoxProvider);
    final String? accessToken = ref.watch(accessTokenProvider);
    StreamSubscription? _hiveSubscription;

    // On dispose
    ref.onDispose(
      () {
        // Closes the StreamController when the state of this provider is destroyed.
        _hiveSubscription?.cancel();
      },
    );

    return asyncBox.when(
      loading: () => null,
      error: (error, stack) => null,
      data: (Box<Config> box) {
        Config? currentValue = box.containsKey(key) ? box.get(key) : null;

        // Hive subscription
        _hiveSubscription?.cancel();
        _hiveSubscription = box.watch(key: key).listen(
              (BoxEvent event) =>
                  ref.controller.state = (event.value as Config?)?.copyWith(
                accessToken: accessToken,
              ),
            );

        return currentValue?.copyWith(
          accessToken: accessToken,
        );
      },
    );
  },
);

class ConfigRepository {
  // final ConfigBoxCallback configBox;
  // final FlutterSecureStorage storage;
  // final Dio dio;
  final Ref ref;

  ConfigRepository(this.ref);

  //BehaviorSubject<Config>? _controller;
  // StreamSubscription? _hiveSubscription;

  ///
  /// --- CONFIG STREAM --- ///
  ///

  // Stream<Config> configStream({required int key}) {
  //   if (_controller == null) {
  //     _controller = BehaviorSubject(
  //       onCancel: () => _onCancel(),
  //     );
  //   }

  //   // Hive subscription
  //   if (_hiveSubscription == null) {
  //     configBox().then(
  //       (box) {
  //         _hiveSubscription?.cancel();
  //         _hiveSubscription = box.watch(key: key).listen(_onBoxEvent);
  //         if (_controller?.hasValue != true && box.containsKey(key)) {
  //           // Push current value on stream
  //           _onBoxEvent(
  //             BoxEvent(
  //               key,
  //               box.get(key),
  //               false,
  //             ),
  //           );
  //         }
  //       },
  //     );
  //   }
  //   return _controller!.stream;
  // }

  Future<Config> getLastConfig() async {
    ///
    /// Fetch stored config in Hive
    /// 
    final Box<Config> box = await ref.read(configBoxProvider.future);

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
      ///
      /// If no config try to read a config file
      /// and create a default config
      ///
      result = await _getInitialeConfig();
      await box.put(
        result.id,
        result.copyWith(accessToken: null),
      );
    } else {
      ///
      /// Config datas are stored in Hive
      /// Access token is stored in secure store
      /// Here we merge all datas
      ///
      final storage = ref.read(secureStorageProvider);
      final String? accessToken = await storage.read(
        key: prefLongLivedAccessToken,
      );
      result = result.copyWith(
        accessToken: accessToken,
      );
    }

    ///
    /// Make access token value accessible by riverpod/providers
    ///
    final tokenController = ref.read(accessTokenProvider.notifier);
    tokenController.state = result.accessToken;

    return result;
  }

  Future<Config> _getInitialeConfig() async {
    // Initiale config
    Config config = Config(
      id: 0,
    );
    try {
      // Try to load a config file
      final String json =
          await rootBundle.loadString("assets/config/config.json");
      final defaultConfig = jsonDecode(json) as Map<String, dynamic>;
      final String? accessToken = defaultConfig.containsKey("longLivedToken")
          ? defaultConfig["longLivedToken"]
          : null;

      final String? internalUrl = defaultConfig.containsKey("internalUrl")
          ? defaultConfig["internalUrl"]
          : null;
      final String? externalUrl = defaultConfig.containsKey("externalUrl")
          ? defaultConfig["externalUrl"]
          : null;

      config = config.copyWith(
        accessToken: accessToken,
        internalUrl: internalUrl,
        externalUrl: externalUrl,
      );

      if (accessToken != null && accessToken.isNotEmpty) {
        final storage = ref.read(secureStorageProvider);
        await storage.write(
          key: prefLongLivedAccessToken,
          value: accessToken,
        );
      }
    } catch (e) {
      debugPrint("[CONFIG] No config file");
    }

    return config;
  }

  // void _onCancel() {
  //   if (_controller?.hasListener == false) {
  //     _controller?.close();
  //     _controller = null;
  //   }
  // }

  // void dispose() {
  //   _controller?.close();
  //   _controller = null;
  //   _hiveSubscription?.cancel();
  //   _hiveSubscription = null;
  // }

  // Future<void> _onBoxEvent(BoxEvent event) async {
  //   debugPrint("[CONFIG] _onConfigDataHive, key: ${event.key} ");
  //   if (event.value is Config) {
  //     _onConfigData(event.key, event.value);
  //   }
  // }

  // Future<void> _onConfigData(dynamic key, Config config) async {
  //   final storage = ref.read(secureStorageProvider);
  //   String? internalUrl = null;
  //   String? externalUrl = null;
  //   String? accessToken = await storage.read(
  //     key: prefLongLivedAccessToken,
  //   );

  //   if (accessToken == null) {
  //     // Initiale config
  //     try {
  //       final String json =
  //           await rootBundle.loadString("assets/config/config.json");
  //       final defaultConfig = jsonDecode(json) as Map<String, dynamic>;
  //       accessToken = defaultConfig.containsKey("longLivedToken")
  //           ? defaultConfig["longLivedToken"]
  //           : null;
  //       if (config.internalUrl == null) {
  //         internalUrl = defaultConfig.containsKey("internalUrl")
  //             ? defaultConfig["internalUrl"]
  //             : null;
  //         externalUrl = defaultConfig.containsKey("externalUrl")
  //             ? defaultConfig["externalUrl"]
  //             : null;
  //       }
  //       if (accessToken != null && accessToken.isNotEmpty) {
  //         await storage.write(
  //           key: prefLongLivedAccessToken,
  //           value: accessToken,
  //         );
  //       }
  //     } catch (e) {
  //       debugPrint("[CONFIG] No config file");
  //     }
  //   }

  //   final entity = config.copyWith(
  //     accessToken: accessToken,
  //     internalUrl: internalUrl ?? config.internalUrl,
  //     externalUrl: externalUrl ?? config.externalUrl,
  //   );

  //   // _controller?.sink.add(entity);
  // }

  ///
  /// --- Update --- ///
  ///

  Future<bool> update(Config config) async {
    final storage = ref.read(secureStorageProvider);

    // Update access token
    if (config.accessToken?.isNotEmpty == true) {
      await storage.write(
          key: prefLongLivedAccessToken, value: config.accessToken!);
    } else {
      await storage.delete(key: prefLongLivedAccessToken);
    }

    try {
      // update config
      final updatedConfigHive = config.copyWith(
        accessToken: null,
      );

      final Box<Config> box = await ref.read(configBoxProvider.future);
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

    final Dio dio = ref.read(dioProvider);
    final HassApi _hassApi = HassApi(
      dio,
      baseUrl: uri.toString(),
    );

    try {
      final response = await _hassApi.config(
        authorization: 'Bearer ${config.accessToken}',
      );
      if (response.response.statusCode == ApiStatus.ok) {
        if (response.data != null) {
          final DiscoveryInfoModel discoveryInfo = DiscoveryInfoModel.fromJson(
              response.data as Map<String, dynamic>);

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
