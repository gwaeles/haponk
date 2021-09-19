import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:haponk/core/hass/models/events/discovery_info_model.dart';
import 'package:haponk/core/network/api_status.dart';
import 'package:haponk/data/config/repositories/config_repository.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:haponk/core/db/database.dart';
import 'package:haponk/core/db/database_extension.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';
import 'package:dio/dio.dart';

import 'config_repository_test.mocks.dart';

@GenerateMocks([
  FlutterSecureStorage,
  Dio,
  Response,
])
void main() {
  // Target of Tests
  late ConfigRepository configRepository;

  // Mocks
  late Database db;
  late MockFlutterSecureStorage storage;
  late MockDio dio;
  late MockResponse responseMock;

  setUp(() async {
    // Mocks
    db = Database(VmDatabase.memory());
    storage = MockFlutterSecureStorage();
    dio = MockDio();
    responseMock = MockResponse();

    // Target
    configRepository = ConfigRepository(
      db: db,
      storage: storage,
      dio: dio,
    );
    db.delete(db.configs).go();
  });

  tearDown(() async {
    await db.close();
  });

  ConfigDBO aConfigDBO() => ConfigDBO(
        id: 1,
        uuid: "1",
        baseUrl: "https://localhost:8123",
        externalUrl: "https://myhost.net:38123",
        internalUrl: "https://localhost:8123",
        locationName: "City",
        installationType: "A",
        requiresApiPassword: true,
        version: "1",
        lastConnection: DateTime.now(),
      );

  group("Config repository: ", () {
    test("Add a listener to config stream", () async {
      //GIVEN: a config is set in db
      final value = aConfigDBO();
      final matchers = [
        value.toEntity().copyWith(accessToken: 'token'),
      ];
      StreamSubscription<Config>? subscription;

      when(storage.read(key: PREF_LONG_LIVED_ACCESS_TOKEN)).thenAnswer(
        (_) => Future.value("token"),
      );

      await db.insertConfig(value);

      final expectFunc = expectAsync0(() async {
        verify(storage.read(key: PREF_LONG_LIVED_ACCESS_TOKEN));

        await subscription?.cancel();
        // After subscription cancel, no more entity should be emitted
        await db.updateConfig(value);

        verifyNever(storage.read(key: PREF_LONG_LIVED_ACCESS_TOKEN));
      });

      //WHEN: add a listener on config stream
      var stream = configRepository.addListener();

      //THEN: The config entity is emitted
      subscription = stream.listen((event) {
        final matcher = matchers.removeAt(0).toComparable();
        expect(event.toComparable(), matcher);
        if (matchers.isEmpty) {
          expectFunc();
        }
      });
    });

    test("Try a connection with a right url", () async {
      //GIVEN
      final model = DiscoveryInfoModel(
          uuid: "uid",
          baseUrl: "baseUrl",
          externalUrl: "extUrl",
          internalUrl: "internUrl",
          locationName: "location",
          installationType: "good",
          requiresApiPassword: true,
          version: "1");
      final url = "http://localhost:8123";

      when(dio.fetch(any)).thenAnswer(
        (_) => Future.value(responseMock),
      );
      when(dio.options).thenReturn(
        BaseOptions(baseUrl: ''),
      );
      when(responseMock.statusCode).thenReturn(ApiStatus.OK);
      when(responseMock.data).thenReturn(model.toJson());

      //WHEN
      expect(
        db.select(db.configs).get(),
        completion(isEmpty),
      );
      final result = await configRepository.tryConnect(url);

      //THEN
      expect(true, result);
      final config = await db.select(db.configs).get();
      expect(config, isNotEmpty);
      expect(config.first.id, 1);
      expect(config.first.uuid, model.uuid);
      expect(config.first.internalUrl, model.internalUrl);
    });

    test("Try a connection with a wrong url", () async {
      //GIVEN
      final model = DiscoveryInfoModel(
          uuid: "uid",
          baseUrl: "baseUrl",
          externalUrl: "extUrl",
          internalUrl: "internUrl",
          locationName: "location",
          installationType: "good",
          requiresApiPassword: true,
          version: "1");
      final url = "http://localhost:8123";

      when(responseMock.statusCode).thenReturn(ApiStatus.RESOURCE_NOT_FOUND);
      when(responseMock.data).thenReturn(model.toJson());

      //WHEN
      expect(db.select(db.configs).get(), completion(isEmpty));
      final result = await configRepository.tryConnect(url);

      //THEN
      expect(false, result);
      final config = await db.select(db.configs).get();
      expect(config, isNotEmpty);
      expect(config.first.id, 1);
      expect(config.first.internalUrl, url);
    });
  });
}
