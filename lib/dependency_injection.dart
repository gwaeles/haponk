import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:haponk/core/db/database.dart';
import 'package:haponk/core/hass/datasources/hass_api.dart';
import 'package:haponk/core/network/client.dart' as client;
import 'package:haponk/features/config/repositories/config_repository.dart';
import 'package:haponk/features/config/repositories/config_repository_impl.dart';
import 'package:haponk/features/connection/repositories/connection_repository.dart';
import 'package:haponk/features/connection/repositories/connection_repository_impl.dart';
import 'package:haponk/features/devices/repositories/devices_repository.dart';
import 'package:haponk/features/devices/repositories/devices_repository_impl.dart';
import 'package:haponk/features/discovery/data/datasources/discovery_service.dart';
import 'package:haponk/features/discovery/data/repositories/discovery_repository_impl.dart';
import 'package:haponk/features/discovery/domain/repositories/discovery_repository.dart';
import 'package:haponk/features/discovery/domain/usecases/listen_discover_use_case.dart';
import 'package:haponk/features/discovery/domain/usecases/start_discover_use_case.dart';
import 'package:haponk/features/discovery/domain/usecases/stop_discover_use_case.dart';
import 'package:haponk/features/tabs/repositories/cards_repository.dart';
import 'package:haponk/features/tabs/repositories/cards_repositoty_impl.dart';
import 'package:haponk/features/tabs/repositories/tabs_repository.dart';
import 'package:haponk/features/tabs/repositories/tabs_repositoty_impl.dart';
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
  getIt.registerLazySingleton(() => DiscoveryService());

  // --- API --- //
  getIt.registerFactoryParam<HassApi, String, String>((param1, _) => HassApi(
        getIt(),
        baseUrl: param1 ?? '',
      ));

  // --- REPOSITORIES --- //
  getIt.registerLazySingleton<ConfigRepository>(
      () => ConfigRepositoryImpl(getIt(), getIt()));
  getIt.registerLazySingleton<ConnectionRepository>(
      () => ConnectionRepositoryImpl(getIt()));
  getIt.registerLazySingleton<DiscoveryRepository>(
      () => DiscoveryRepositoryImpl(getIt()));
  getIt.registerLazySingleton<DevicesRepository>(
      () => DevicesRepositoryImpl(getIt()));
  getIt
      .registerLazySingleton<TabsRepository>(() => TabsRepositoryImpl(getIt()));
  getIt.registerFactoryParam<CardsRepository, int, int>(
      (tabId, _) => CardsRepositoryImpl(
            db: getIt(),
            tabId: tabId ?? 0,
          ));

  // --- USECASES --- //
  getIt.registerLazySingleton(() => ListenDiscoverUseCase(getIt()));
  getIt.registerLazySingleton(() => StartDiscoverUseCase(getIt()));
  getIt.registerLazySingleton(() => StopDiscoverUseCase(getIt()));
};
