import 'package:flutter/material.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/dependency_injection.dart';
import 'package:haponk/features/config/entities/config_entity.dart';
import 'package:haponk/features/config/providers/config_provider.dart';
import 'package:haponk/features/connection/providers/connection_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/config_page.dart';

class ConfigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (_) => ConfigProvider(getIt()),
        ),
        StreamProvider<ConfigEntity>(
            initialData: null,
            create: (context) => context.read<ConfigProvider>().messageStream),
        StreamProvider<ConnectionType>(
            initialData: ConnectionType.IDLE,
            create: (context) =>
                context.read<ConnectionProvider>().connectionStream),
      ],
      child: ConfigPage(),
    );
  }
}
