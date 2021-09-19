import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:haponk/core/db/database.dart';
import 'package:haponk/core/network/client.dart' as client;
import 'package:haponk/data/config/repositories/config_repository.dart';
import 'package:haponk/data/connection/providers/connection_notifier.dart';
import 'package:haponk/data/connection/repositories/connection_repository.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';

class MainProviders extends StatelessWidget {
  final Widget? child;

  const MainProviders({
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
          create: (context) => Database(
            (FlutterQueryExecutor.inDatabaseFolder(
              path: 'db.sqlite',
              // Good for debugging - prints SQL in the console
              logStatements: true,
            )),
          ),
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
            db: context.read(),
            storage: context.read(),
            dio: context.read(),
          ),
        ),
        Provider(
          create: (context) => ConnectionRepository(
            db: context.read(),
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
}
