import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:hapoc/features/config/repositories/config_repository_impl.dart';
import 'package:hapoc/features/config/entities/config_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hapoc/core/db/database.dart';
import 'package:hapoc/core/db/database_extension.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';

class DatabaseMock extends Mock implements Database {}

class FlutterSecureStorageMock extends Mock implements FlutterSecureStorage {}

void main() {
  // Target of Tests
  ConfigRepositoryImpl configRepositoryImpl;

  // Mocks
  Database db;
  FlutterSecureStorageMock storage;

  setUpAll(() {
    // Mocks
    db = Database(VmDatabase.memory());
    storage = FlutterSecureStorageMock();

    // Target
    configRepositoryImpl = ConfigRepositoryImpl(db, storage);
  });

  tearDownAll(() async {
    await db.close();
  });

  Config aConfig() => Config(
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
      //GIVEN: a listener on the config stream
      final Config value = aConfig();
      var stream = configRepositoryImpl.addListener();

      //THEN: the stream emit a config
      expectLater(stream, emitsInOrder([null, value.toEntity()]));

      //WHEN: a config is inserted in db
      await db.insertConfig(value);
    });

    test("Add a listener to config stream method 2", () async {
      //GIVEN: a config is set in db
      final Config value = aConfig();
      final matchers = [value.toEntity()];
      StreamSubscription<ConfigEntity> subscription;

      when(storage.read(key: PREF_LONG_LIVED_ACCESS_TOKEN))
          .thenAnswer((_) => Future.value("token"));

      await db.insertConfig(value);

      final expectFunc = expectAsync0(() async {
        verify(storage.read(key: PREF_LONG_LIVED_ACCESS_TOKEN));

        await subscription.cancel();
        // After subscription cancel, no more entity should be emitted
        await db.updateConfig(value);

        verifyNever(storage.read(key: PREF_LONG_LIVED_ACCESS_TOKEN));
      });

      //WHEN: add a listener on config stream
      var stream = configRepositoryImpl.addListener();

      //THEN: The config entity is emitted
      subscription = stream.listen((event) {
        expect(event, matchers.removeAt(0));
        if (matchers.isEmpty) {
          expectFunc();
        }
      });
    });

    test("Try a connection with a right url", () async {
      //GIVEN
      final url = "http://localhost:8123";

      //WHEN
      configRepositoryImpl.tryConnect(url);

      //THEN
      expect(true, 1 == 2);
    });

    test("Try a connection with a wrong url", () async {
      //GIVEN
      final url = "http://unknown.com:8123";

      //WHEN
      configRepositoryImpl.tryConnect(url);

      //THEN
      expect(true, 1 == 2);
    });
  });
}
