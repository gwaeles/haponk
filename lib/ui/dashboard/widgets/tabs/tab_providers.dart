import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/ui/dashboard/providers/auto_scroll_timer.dart';
import 'package:haponk/ui/dashboard/providers/drag_targets_notifier.dart';
import 'package:haponk/ui/dashboard/providers/scroll_edge_notifier.dart';
import 'package:provider/provider.dart' as provider;

class TabProviders extends ConsumerWidget {
  final Widget? child;
  final int tabId;

  const TabProviders({
    Key? key,
    this.child,
    required this.tabId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      return provider.MultiProvider(
        providers: [
          provider.ChangeNotifierProvider<ScrollController>.value(
            value: PrimaryScrollController.of(context)!,
          ),
          provider.ProxyProvider<ScrollController, AutoScrollTimer>(
            create: (context) => AutoScrollTimer(
              primaryScrollController: context.read<ScrollController>(),
            ),
            update: (context, value, previous) => previous!,
          ),
          provider.ChangeNotifierProxyProvider<ScrollController,
              ScrollEdgeNotifier>(
            create: (context) => ScrollEdgeNotifier(),
            update: (context, controller, previous) {
              return previous!..updateScroll(controller);
            },
          ),
          provider.ChangeNotifierProvider<DragTargetsNotifier>(
            create: (context) =>
                DragTargetsNotifier()..layoutWidth = constraints.maxWidth,
          ),
        ],
        child: child,
      );
    });
  }
}
