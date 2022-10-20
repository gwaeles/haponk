import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/config/blocs/config_bloc.dart';
import 'package:haponk/ui/launcher/blocs/launcher_bloc.dart';
import 'package:provider/provider.dart';

class LauncherProviders extends StatelessWidget {
  final Widget child;

  const LauncherProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LauncherBloc>(
          // Start a timer at launch
          create: (context) => LauncherBloc()
            ..add(
              LauncherStart(),
            ),
        ),
        BlocProvider<ConfigBloc>(
          // Get last config at launch
          create: (context) => ConfigBloc(
            repository: context.read(),
          )..add(ConfigGetLast()),
        ),
      ],
      builder: (context, _) => child,
    );
  }
}
