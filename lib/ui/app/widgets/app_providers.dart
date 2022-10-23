import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:haponk/core/db/database.dart';
import 'package:haponk/core/hive/datasources/boxes_provider.dart';
import 'package:haponk/core/network/client.dart' as client;
import 'package:haponk/data/config/repositories/config_repository.dart';
import 'package:haponk/data/connection/notifiers/connection_notifier.dart';
import 'package:haponk/data/connection/repositories/connection_repository.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  final Widget? child;

  const AppProviders({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ///
        /// STORAGE
        ///
        Provider(
          create: (context) => FlutterSecureStorage(),
        ),
        Provider(
          create: (context) => Database(_openConnection()),
        ),

        ///
        /// NETWORK
        ///
        Provider(
          create: (context) => client.configureDio(),
        ),

        ///
        /// FEATURES
        ///
        Provider(
          create: (context) => ConfigRepository(
            configBox: openConfigBox,
            storage: context.read(),
            dio: context.read(),
          ),
        ),
        Provider(
          create: (context) => ConnectionRepository(
            deviceListBox: openDeviceListBox,
            deviceBox: openDeviceBox,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ConnectionNotifier(
            connectionRepository: context.read(),
          ),
        )
      ],
      child: child,
    );
  }

  LazyDatabase _openConnection() {
    // the LazyDatabase util lets us find the right location for the file async.
    return LazyDatabase(() async {
      // put the database file, called db.sqlite here, into the documents folder
      // for your app.
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    });
  }
}
