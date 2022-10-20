import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/config/blocs/config_bloc.dart';
import 'package:haponk/data/config/states/config_state.dart';
import 'package:haponk/ui/app/router/app_router.gr.dart';
import 'package:haponk/ui/launcher/blocs/launcher_bloc.dart';

class LauncherListeners extends StatelessWidget {
  final Widget? child;

  const LauncherListeners({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfigBloc, ConfigState>(
      listener: (context, state) {
        if (state.data != null) {
          context.read<LauncherBloc>()
            ..add(
              LauncherConfigLoaded(state.data!),
            );
        }
      },
      child: BlocListener<LauncherBloc, LauncherState>(
        listener: (context, state) {
          if (state.delayElapsed == true && state.lastConfig != null) {
            if (state.lastConfig?.lastConnection != null) {
              context.router.replace(AppNavigationRoute(configId: state.lastConfig!.id));
            } else {
              context.router.replace(ConfigRoute(configId: state.lastConfig!.id));
            }
          }
        },
        child: child,
      ),
    );
  }
}
