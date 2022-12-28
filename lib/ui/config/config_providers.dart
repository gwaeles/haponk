import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/domain/config/blocs/config_bloc.dart';
import 'package:haponk/domain/config/blocs/discover_bloc.dart';
import 'package:provider/provider.dart' as provider;

class ConfigProviders extends ConsumerWidget {
  final int configId;
  final Widget? child;

  const ConfigProviders({
    Key? key,
    required this.configId,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return provider.MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => ref.read(discoverBlocProvider),
        ),
        BlocProvider(
          create: (context) => ref.read(configBlocProvider)
            ..add(
              ConfigWatch(key: configId),
            ),
        ),
      ],
      child: child,
    );
  }
}
