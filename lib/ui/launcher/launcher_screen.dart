import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/config/blocs/config_bloc.dart';
import 'package:haponk/data/config/states/config_state.dart';
import 'package:haponk/ui/launcher/blocs/launcher_bloc.dart';
import 'package:provider/provider.dart';

class LauncherScreen extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    return MultiProvider(
      providers: [
        Provider<LauncherBloc>(
          create: (context) => LauncherBloc(),
        ),
        BlocProvider<ConfigBloc>(
          lazy: false,
          create: (context) => ConfigBloc(
            repository: context.read(),
          ),
        ),
      ],
      builder: (context, child) {
        return BlocListener<ConfigBloc, ConfigState>(
          listener: (context, state) {
            if (state.config != null) {
              context.read<LauncherBloc>().start();
            }
          },
          child: BlocListener<LauncherBloc, bool>(
            listener: (context, state) {
              if (state == true) {
                final config = context.read<ConfigBloc>().state.config;
                if (config?.lastConnection != null) {
                  Navigator.of(context).pushReplacementNamed("/supervisor");
                } else if (config != null) {
                  Navigator.of(context).pushReplacementNamed("/config");
                }
              }
            },
            child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                // Fixing the status bar icon color
                statusBarIconBrightness:
                    Theme.of(context).brightness == Brightness.light
                        ? Brightness.dark
                        : Brightness.light,
                statusBarColor: Colors.transparent,
              ),
              child: Scaffold(
                body: Center(
                  child: Image.asset(
                    "assets/images/ha_splash_logo.png",
                    height: 152,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
