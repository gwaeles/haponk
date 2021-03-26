import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hapoc/core/db/database.dart';
import 'package:hapoc/core/hass/datasources/hass_api.dart';
import 'package:hapoc/core/network/client.dart' as client;
import 'package:hapoc/features/config/repositories/config_repository.dart';
import 'package:hapoc/features/config/repositories/config_repository_impl.dart';
import 'package:hapoc/features/connection/repositories/connection_repository.dart';
import 'package:hapoc/features/connection/repositories/connection_repository_impl.dart';
import 'package:hapoc/features/discovery/data/datasources/discovery_service.dart';
import 'package:hapoc/features/discovery/data/repositories/discovery_repository_impl.dart';
import 'package:hapoc/features/discovery/domain/repositories/discovery_repository.dart';
import 'package:hapoc/features/discovery/domain/usecases/listen_discover_use_case.dart';
import 'package:hapoc/features/discovery/domain/usecases/start_discover_use_case.dart';
import 'package:hapoc/features/discovery/domain/usecases/stop_discover_use_case.dart';

GetIt getIt = GetIt.instance;

typedef ServiceDeclaration = void Function();

ServiceDeclaration declareServices = () {
  // --- SERVICES --- //
  getIt.registerSingleton(FlutterSecureStorage());
  getIt.registerSingleton(Database());
  getIt.registerLazySingleton(() => client.configureDio());
  getIt.registerLazySingleton(() => DiscoveryService());

  // --- API --- //
  getIt.registerFactoryParam((param1, _) => HassApi(getIt(), baseUrl: param1));

  // --- REPOSITORIES --- //
  getIt.registerLazySingleton<ConfigRepository>(
      () => ConfigRepositoryImpl(getIt(), getIt()));
  getIt.registerLazySingleton<ConnectionRepository>(
      () => ConnectionRepositoryImpl(getIt()));
  getIt.registerLazySingleton<DiscoveryRepository>(
      () => DiscoveryRepositoryImpl(getIt()));

  // --- USECASES --- //
  getIt.registerLazySingleton(() => ListenDiscoverUseCase(getIt()));
  getIt.registerLazySingleton(() => StartDiscoverUseCase(getIt()));
  getIt.registerLazySingleton(() => StopDiscoverUseCase(getIt()));
};
