import 'package:flutter/material.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:haponk/data/tabs/providers/cards_provider.dart';
import 'package:haponk/data/tabs/repositories/cards_repository.dart';
import 'package:haponk/ui/dashboard/providers/auto_scroll_timer.dart';
import 'package:haponk/ui/dashboard/providers/drag_targets_notifier.dart';
import 'package:haponk/ui/dashboard/providers/scroll_edge_notifier.dart';
import 'package:provider/provider.dart';

class TabProviders extends StatelessWidget {
  final Widget? child;
  final int tabId;

  const TabProviders({
    Key? key,
    this.child,
    required this.tabId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<ScrollController>.value(
            value: PrimaryScrollController.of(context)!,
          ),
          ProxyProvider<ScrollController, AutoScrollTimer>(
            create: (context) => AutoScrollTimer(
              primaryScrollController: context.read<ScrollController>(),
            ),
            update: (context, value, previous) => previous!,
          ),
          ChangeNotifierProxyProvider<ScrollController, ScrollEdgeNotifier>(
            create: (context) => ScrollEdgeNotifier(),
            update: (context, controller, previous) {
              return previous!..updateScroll(controller);
            },
          ),
          Provider<CardsRepository>(
            create: (context) => CardsRepository(
              db: context.read(),
              tabId: tabId,
            ),
          ),
          Provider<CardsProvider>(
            create: (context) => CardsProvider(
              context.read(),
            ),
          ),
          StreamProvider<List<FlexCard>?>(
            initialData: null,
            create: (context) => context.read<CardsProvider>().cardsStream,
          ),
          ChangeNotifierProxyProvider<List<FlexCard>?, DragTargetsNotifier>(
            create: (context) => DragTargetsNotifier()
              ..layoutWidth = constraints.maxWidth
              ..flexCards = context.read<List<FlexCard>?>(),
            update: (context, cards, previous) => previous!..flexCards = cards,
          ),
        ],
        child: child,
      );
    });
  }
}
