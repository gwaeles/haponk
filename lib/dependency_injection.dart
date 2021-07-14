import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:haponk/core/db/database.dart';
import 'package:haponk/core/hass/datasources/hass_api.dart';
import 'package:haponk/core/network/client.dart' as client;
import 'package:haponk/data/config/repositories/config_repository.dart';
import 'package:haponk/data/connection/repositories/connection_repository.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';
import 'package:haponk/data/tabs/repositories/cards_repository.dart';
import 'package:haponk/data/tabs/repositories/tabs_repository.dart';
import 'package:moor_flutter/moor_flutter.dart';

GetIt getIt = GetIt.instance;

typedef ServiceDeclaration = void Function();

ServiceDeclaration declareServices = () {
  // --- SERVICES --- //
  getIt.registerSingleton(FlutterSecureStorage());
  getIt.registerSingleton(Database((FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite',
    // Good for debugging - prints SQL in the console
    logStatements: true,
  ))));
  getIt.registerLazySingleton(() => client.configureDio());

  // --- API --- //
  getIt.registerFactoryParam<HassApi, String, String>((param1, _) => HassApi(
        getIt(),
        baseUrl: param1 ?? '',
      ));

  // --- REPOSITORIES --- //
  getIt.registerLazySingleton<ConfigRepository>(
      () => ConfigRepository(getIt(), getIt()));
  getIt.registerLazySingleton<ConnectionRepository>(
      () => ConnectionRepository(getIt()));
  getIt.registerLazySingleton<DevicesRepository>(
      () => DevicesRepository(getIt()));
  getIt.registerLazySingleton<TabsRepository>(() => TabsRepository(getIt()));
  getIt.registerFactoryParam<CardsRepository, int, int>(
      (tabId, _) => CardsRepository(
            db: getIt(),
            tabId: tabId ?? 0,
          ));
};
