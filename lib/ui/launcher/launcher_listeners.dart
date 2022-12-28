import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/router.gr.dart';
import 'package:haponk/ui/launcher/controllers/launcher_notifier.dart';
import 'package:haponk/ui/launcher/controllers/launcher_state.dart';

class LauncherListeners extends ConsumerWidget {
  final Widget child;

  const LauncherListeners({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<LauncherState>(
      launcherNotifier,
      (
        LauncherState? previous,
        LauncherState state,
      ) {
        if (state.delayElapsed == true && state.lastConfig != null) {
          if (state.lastConfig?.lastConnection != null) {
            context.router.replace(
              AppNavigationRoute(configId: state.lastConfig!.id),
            );
          } else {
            context.router.replace(
              ConfigRoute(configId: state.lastConfig!.id),
            );
          }
        }
      },
    );

    return child;
  }
}
