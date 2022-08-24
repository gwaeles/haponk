import 'package:flutter/material.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:haponk/data/config/providers/config_notifier.dart';
import 'package:provider/provider.dart';

class ConfigProviders extends StatelessWidget {
  final Widget? child;

  const ConfigProviders({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConfigNotifier(
            repository: context.read(),
          ),
        ),
        StreamProvider<Config?>(
          initialData: null,
          create: (context) => context.read<ConfigNotifier>().messageStream,
        ),
      ],
      child: child,
    );
  }
}
