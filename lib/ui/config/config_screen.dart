import 'package:flutter/material.dart';
import 'package:hapoc/core/hass/models/constants.dart';
import 'package:hapoc/dependency_injection.dart';
import 'package:hapoc/features/config/entities/config_entity.dart';
import 'package:hapoc/features/config/providers/config_provider.dart';
import 'package:hapoc/features/connection/providers/connection_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/config_page.dart';

class ConfigScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => ConfigProvider(getIt()),
      builder: _builder,
      child: Scaffold(
        body: ConfigPage(),
      ),
    );
  }

  Widget _builder(BuildContext context, Widget child) {
    final configProvider = context.read<ConfigProvider>();
    final connexionProvider = context.read<ConnectionProvider>();

    return MultiProvider(
      providers: [
        StreamProvider<ConfigEntity>(
            initialData: null,
            create: (context) => configProvider.messageStream),
        StreamProvider<ConnectionType>(
            initialData: ConnectionType.IDLE,
            create: (context) => connexionProvider.connectionStream),
      ],
      child: ConfigPage(),
    );
  }
}
