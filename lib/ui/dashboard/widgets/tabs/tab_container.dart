import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/domain/tabs/controllers/cards_controller.dart';
import 'package:haponk/domain/tabs/controllers/tabs_controller.dart';
import 'package:haponk/domain/tabs/entities/flex_tab.dart';
import 'package:haponk/domain/tabs/entities/positioned_flex_card.dart';
import 'package:haponk/domain/tabs/states/flex_cards_state.dart';
import 'package:haponk/ui/dashboard/providers/auto_scroll_timer.dart';
import 'package:haponk/ui/dashboard/providers/drag_targets_notifier.dart';
import 'package:haponk/ui/dashboard/providers/editor_controller.dart';
import 'package:haponk/ui/dashboard/widgets/editor/custom_card_alert_dialog.dart';
import 'package:haponk/ui/dashboard/widgets/tabs/tab_providers.dart';
import 'package:provider/provider.dart' as provider;

import 'auto_scroll_drag_target.dart';
import 'flex_card_grid_builder.dart';

class TabContainer extends ConsumerWidget {
  final FlexTab flexTabItem;

  TabContainer({
    Key? key,
    required this.flexTabItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TabProviders(
      tabId: flexTabItem.id ?? 0,
      child: provider.Consumer2<DragTargetsNotifier, EditorController>(
          builder: (context, dragTargetsNotifier, editorController, child) {
            return TabContainerStack(
              tabId: flexTabItem.id ?? 0,
              dragTargetsNotifier: dragTargetsNotifier,
              editorController: editorController,
              child: child!,
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
                sliver: SliverToBoxAdapter(
                  child: FlexCardGridBuilder(
                    tabId: flexTabItem.id ?? 0,
                    onEditTab: () {
                      final currentIndex =
                          (DefaultTabController.of(context) as TabController)
                              .index;
                      final TextEditingController textController =
                          TextEditingController(
                        text: flexTabItem.label,
                      );

                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Update label'),
                          content: TextField(
                            decoration: InputDecoration(),
                            controller: textController,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                if (textController.text.trim().isNotEmpty) {
                                  ref
                                      .read(flexTabsControllerProvider)
                                      .updateItemByIndex(
                                        label: textController.text.trim(),
                                        index: currentIndex,
                                      );
                                }
                                Navigator.of(context).pop();
                              },
                              child: Text('Yes'),
                            )
                          ],
                        ),
                      );
                    },
                    onDeleteTab: () {
                      final currentIndex =
                          (DefaultTabController.of(context) as TabController)
                              .index;

                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Confirmation'),
                          content: Text(
                              'Confirm deletion of tab : ${flexTabItem.label} ?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                ref
                                    .read(flexTabsControllerProvider)
                                    .deleteItemByIndex(currentIndex);
                                Navigator.of(context).pop();
                              },
                              child: Text('Yes'),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class TabContainerStack extends ConsumerWidget {
  final int tabId;
  final DragTargetsNotifier dragTargetsNotifier;
  final EditorController editorController;
  final Widget child;

  const TabContainerStack({
    required this.tabId,
    required this.dragTargetsNotifier,
    required this.editorController,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<FlexCardsState>(
      flexCardsStateProvider(tabId),
      (previous, next) {
        dragTargetsNotifier.flexCards = next.data;
      },
    );

    return Stack(
      children: [
        child,
        // Auto scroll to top
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AutoScrollDragTargetOnTop(),
        ),
        // Auto scroll to down
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: AutoScrollDragTargetOnBottom(),
        ),
        // Remove button
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          key: ValueKey("REMOVE_BUTTON"),
          top: dragTargetsNotifier.dragging ? 16 : -56,
          left: 0,
          right: 0,
          child: RemoveButtonWidget(),
        ),
        // Custom button
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          key: ValueKey("CUSTOM_BUTTON"),
          bottom: editorController.selectedItemId > 0 ? 16 : -56,
          left: 0,
          right: 0,
          child: CustomButtonWidget(
            onTap: () => onCustomItem(
              context: context,
              itemId: editorController.selectedItemId,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> onCustomItem({
    required BuildContext context,
    required int itemId,
  }) async {
    final DragTargetsNotifier dragTargetsNotifier = context.read();
    final cards = dragTargetsNotifier.positionedFlexCards;
    PositionedFlexCard? _selectedItem;

    for (int i = 0; i < (cards?.length ?? 0); i++) {
      if (itemId == cards![i].card.id) {
        _selectedItem = cards[i];
      }
    }

    if (_selectedItem?.card != null) {
      showDialog(
        context: context,
        builder: (context) => CustomCardAlertDialog(
          cardId: _selectedItem!.card.id,
          tabId: _selectedItem.card.tabId,
        ),
      );
    }
  }
}

class AutoScrollDragTargetOnTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoScrollDragTarget(
      isOnTop: true,
      onWillAccept: (value) {
        context.read<AutoScrollTimer>().startUp();
        return false;
      },
      onLeave: (value) => context.read<AutoScrollTimer>().stop(),
    );
  }
}

class AutoScrollDragTargetOnBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoScrollDragTarget(
      isOnTop: false,
      onWillAccept: (value) {
        context.read<AutoScrollTimer>().startDown();
        return false;
      },
      onLeave: (value) => context.read<AutoScrollTimer>().stop(),
    );
  }
}

class RemoveButtonWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SizedBox(
        width: 48,
        height: 48,
        child: DragTarget<PositionedFlexCard>(
          onWillAccept: (value) => value?.card.id != null,
          onAccept: (value) => ref
              .read(cardsControllerProvider(value.card.tabId))
              .deleteItem(value.card),
          builder: (context, candidateData, rejectedData) => Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: candidateData.length > 0 ? Colors.red : Colors.white54,
                width: 1,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.delete,
                color: candidateData.length > 0 ? Colors.red : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  final GestureTapCallback? onTap;

  const CustomButtonWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 48,
        height: 48,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.white54,
                width: 1,
              ),
            ),
            child: Center(
              child: Icon(
                //Icons.color_lens,
                Icons.tune,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
