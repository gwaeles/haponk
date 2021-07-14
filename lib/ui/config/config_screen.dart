import 'package:flutter/material.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/data/config/notifiers/config_notifier.dart';
import 'package:haponk/data/connection/notifiers/connection_notifier.dart';
import 'package:haponk/dependency_injection.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:provider/provider.dart';

import 'widgets/config_page.dart';

class ConfigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (_) => ConfigNotifier(getIt()),
        ),
        StreamProvider<Config?>(
          initialData: null,
          create: (context) => context.read<ConfigNotifier>().messageStream,
        ),
        StreamProvider<ConnectionType>(
          initialData: ConnectionType.IDLE,
          create: (context) =>
              context.read<ConnectionNotifier>().connectionStream,
        ),
      ],
      child: ConfigPage(),
    );
  }
}
