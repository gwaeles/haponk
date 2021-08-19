import 'package:flutter/material.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:haponk/data/tabs/entities/flex_tab.dart';
import 'package:haponk/data/tabs/entities/positioned_flex_card.dart';
import 'package:haponk/data/tabs/providers/cards_provider.dart';
import 'package:haponk/ui/tabs/providers/auto_scroll_timer.dart';
import 'package:haponk/ui/tabs/providers/drag_targets_notifier.dart';
import 'package:haponk/ui/tabs/providers/scroll_edge_notifier.dart';
import 'package:provider/provider.dart';

import 'auto_scroll_drag_target.dart';
import 'flex_card_grid.dart';

class TabList extends StatelessWidget {
  final FlexTab flexTabItem;
  final CardsProvider cardsNotifier;
  //final GlobalKey<NestedScrollViewState> nestedScrollViewGlobalKey;

  TabList({
    Key? key,
    required this.flexTabItem,
    required this.cardsNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      debugPrint(
          '[TAB-LIST] layout maxWidth: ${constraints.maxWidth}, maxHeight: ${constraints.maxHeight}');
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
          Provider<CardsProvider>.value(
            value: cardsNotifier,
          ),
          StreamProvider<List<FlexCard>>(
            initialData: [],
            create: (context) => context.read<CardsProvider>().cardsStream,
          ),
          ChangeNotifierProxyProvider<List<FlexCard>, DragTargetsNotifier>(
            create: (context) => DragTargetsNotifier()
              ..layoutWidth = constraints.maxWidth
              ..flexCards = context.read<List<FlexCard>>(),
            update: (context, cards, previous) => previous!..flexCards = cards,
          )
        ],
        child: Consumer<DragTargetsNotifier>(
          builder: (context, dragTargetsNotifier, child) {
            // Bind the notifier to the screen size
            dragTargetsNotifier.layoutWidth = MediaQuery.of(context).size.width;

            return Stack(
              children: [
                child!,
                // Auto scroll to top
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AutoScrollDragTarget(
                    isOnTop: true,
                    onWillAccept: (value) {
                      context.read<AutoScrollTimer>().startUp();
                      return false;
                    },
                    onLeave: (value) => context.read<AutoScrollTimer>().stop(),
                  ),
                ),
                // Auto scroll to down
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AutoScrollDragTarget(
                    isOnTop: false,
                    onWillAccept: (value) {
                      context.read<AutoScrollTimer>().startDown();
                      return false;
                    },
                    onLeave: (value) => context.read<AutoScrollTimer>().stop(),
                  ),
                ),
                // Remove button
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  key: ValueKey("REMOVE_BUTTON"),
                  top: dragTargetsNotifier.dragging ? 16 : -56,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: DragTarget<PositionedFlexCard>(
                        onWillAccept: (value) => value?.card.id != null,
                        onAccept: (value) => context
                            .read<CardsProvider>()
                            .deleteItem(value.card),
                        builder: (context, candidateData, rejectedData) =>
                            Center(
                          child: Icon(
                            Icons.delete,
                            color: candidateData.length > 0
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          child: CustomScrollView(
            key: PageStorageKey<String>(flexTabItem.label ?? ''),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                sliver: Consumer<List<FlexCard>>(
                  builder: (
                    context,
                    items,
                    child,
                  ) =>
                      items.length == 0
                          ? SliverFillRemaining(
                              child: Center(
                                  child: InkWell(
                                onTap: () =>
                                    context.read<CardsProvider>().createItem(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Tap here to add your firt card"),
                                      SizedBox(height: 16),
                                      Icon(Icons.add_box_outlined),
                                    ],
                                  ),
                                ),
                              )),
                            )
                          : child!,
                  child: SliverToBoxAdapter(
                    child: FlexCardGrid(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
