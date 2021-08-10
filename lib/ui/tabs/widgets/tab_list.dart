import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:haponk/data/tabs/entities/fake_flex_card.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:haponk/data/tabs/entities/flex_tab.dart';
import 'package:haponk/data/tabs/entities/positioned_flex_card.dart';
import 'package:haponk/data/tabs/providers/cards_provider.dart';
import 'package:haponk/ui/tabs/providers/drag_targets_notifier.dart';
import 'package:provider/provider.dart';

import 'editor_controller.dart';

class TabList extends StatelessWidget {
  final FlexTab flexTabItem;
  final CardsProvider cardsNotifier;
  final GlobalKey<NestedScrollViewState> nestedScrollViewGlobalKey;
  late final AutoScrollTimer _autoScrollTimer;

  TabList({
    Key? key,
    required this.flexTabItem,
    required this.cardsNotifier,
    required this.nestedScrollViewGlobalKey,
  }) : super(key: key) {
    _autoScrollTimer = AutoScrollTimer(
      nestedScrollViewGlobalKey: this.nestedScrollViewGlobalKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: [
        Provider<CardsProvider>.value(
          value: cardsNotifier,
        ),
        StreamProvider<List<FlexCard>>(
          initialData: [],
          create: (context) => context.read<CardsProvider>().cardsStream,
        ),
        ChangeNotifierProxyProvider<List<FlexCard>, DragTargetsNotifier>(
          create: (context) => DragTargetsNotifier(
            maxWidth: maxWidth,
          )..flexCards = context.read<List<FlexCard>>(),
          update: (context, value, previous) => previous!..flexCards = value,
        )
      ],
      child: Consumer<DragTargetsNotifier>(
        builder: (context, dragTargetsNotifier, child) {
          return Stack(
            children: [
              child!,
              // Auto scroll to top
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: IgnorePointer(
                  ignoring: !dragTargetsNotifier.dragging,
                  child: DragTarget<PositionedFlexCard>(
                    onWillAccept: (value) {
                      _autoScrollTimer.startUp();
                      return false;
                    },
                    onLeave: (value) => _autoScrollTimer.stop(),
                    builder: (context, candidateData, rejectedData) =>
                        Container(
                      color: Colors.transparent,
                      height: 40,
                    ),
                  ),
                ),
              ),
              // Auto scroll to down
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: IgnorePointer(
                  ignoring: !dragTargetsNotifier.dragging,
                  child: DragTarget<PositionedFlexCard>(
                    onWillAccept: (value) {
                      _autoScrollTimer.startDown();
                      return false;
                    },
                    onLeave: (value) => _autoScrollTimer.stop(),
                    builder: (context, candidateData, rejectedData) =>
                        Container(
                      color: Colors.transparent,
                      height: 40,
                    ),
                  ),
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
                      onAccept: (value) =>
                          context.read<CardsProvider>().deleteItem(value.card),
                      builder: (context, candidateData, rejectedData) => Center(
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
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
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
  }
}

class FlexCardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DragTargetsNotifier>(
      builder: (
        context,
        dragTargetsNotifier,
        child,
      ) {
        return Container(
          color: Colors.transparent,
          height: calculateMaxHeight(
            dragTargetsNotifier.positionedFlexCards,
          ),
          child: child,
        );
      },
      child: FlexCardGridChildren(),
    );
  }

  double calculateMaxHeight(
    List<PositionedFlexCard> cards,
  ) {
    double maxHeight = 0;

    // Cards management
    for (int i = 0; i < cards.length; i++) {
      final item = cards[i];

      maxHeight = max(maxHeight, item.top + item.height);
    }

    // Add 49px for the add button item
    return maxHeight + 49;
  }
}

class FlexCardGridChildren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<DragTargetsNotifier, EditorController>(
      builder: (
        context,
        dragTargetsNotifier,
        editorController,
        child,
      ) {
        return Stack(
          fit: StackFit.loose,
          children: buildChildren(
            dragTargetsNotifier,
            editorController,
            context.read<CardsProvider>(),
          ),
        );
      },
    );
  }

  List<Widget> buildChildren(
    DragTargetsNotifier dragTargetsNotifier,
    EditorController editorController,
    CardsProvider cardsProvider,
  ) {
    debugPrint('GARY buildChildren');
    final List<Widget> children = [];
    final cards = dragTargetsNotifier.positionedFlexCards;
    final dragTargets = dragTargetsNotifier.positionedDragTargets;
    PositionedFlexCard? _selectedItem;
    double maxWidth = 0;
    double maxHeight = 0;

    // Cards management
    for (int i = 0; i < cards.length; i++) {
      final item = cards[i];

      if (!dragTargetsNotifier.dragging &&
          editorController.selectedItemId > 0 &&
          editorController.selectedItemId == item.card.id) {
        _selectedItem = item;
      }

      maxWidth = max(maxWidth, item.left + item.width);
      maxHeight = max(maxHeight, item.top + item.height);

      children.add(
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          key: item.card.id > 0 ? ValueKey(item.card.id) : null,
          top: item.top,
          left: item.left,
          width: item.width,
          height: item.height,
          child: FlexCardWidget(
            item: item,
          ),
        ),
      );
    }

    // Permanent add button item
    children.add(
      AnimatedPositioned(
        duration: const Duration(milliseconds: 250),
        key: ValueKey("ADD_BUTTON_ITEM"),
        top: maxHeight + 1,
        left: 0,
        width: maxWidth,
        height: 48,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: InkWell(
            onTap: () => cardsProvider.createItem(),
            child: Center(
              child: Icon(Icons.add_circle_outline),
            ),
          ),
        ),
      ),
    );
    maxHeight = maxHeight + 49;

    // Drag targets management
    for (int i = 0; i < dragTargets.length; i++) {
      final dragTarget = dragTargets[i];

      children.add(
        Positioned(
          key: ObjectKey(dragTarget),
          top: dragTarget.top,
          left: dragTarget.left,
          width: dragTarget.width,
          height: dragTarget.height,
          child: Container(
            child: DragTarget<PositionedFlexCard>(
              onWillAccept: (value) {
                final accepted = value?.card.id != null &&
                    (!value!.isSameRowPosition(
                          rowIndex: dragTarget.rowIndex,
                        ) ||
                        (value.isChild &&
                            !value.isSameChildPosition(
                              rowIndex: dragTarget.rowIndex,
                              itemIndex: dragTarget.itemIndex,
                            )));
                if (accepted && value?.card != null) {
                  dragTargetsNotifier.activeDragTarget = FakeFlexCard(
                    card: value!.card,
                    rowIndex: dragTarget.rowIndex,
                    itemIndex: dragTarget.itemIndex,
                  );
                }
                return accepted;
              },
              onAccept: (value) {
                cardsProvider.moveItem(
                  item: value,
                  rowIndex: dragTarget.rowIndex,
                  itemIndex: dragTarget.itemIndex,
                );
                dragTargetsNotifier.activeDragTarget = null;
              },
              onLeave: (value) => dragTargetsNotifier.activeDragTarget = null,
              builder: (context, candidateData, rejectedData) => Container(),
            ),
          ),
        ),
      );
    }

    // Add buttons
    if (_selectedItem != null) {
      children.add(
        ActionButton(
          displayButton: true,
          top: _selectedItem.top + (_selectedItem.height - 48) / 2,
          left: max(-8, _selectedItem.left - 24),
          icon: Icons.add_circle_outline,
          onPressed: () => cardsProvider.addChildItemToTheLeft(
            _selectedItem!.card,
          ),
        ),
      );
      children.add(
        ActionButton(
          displayButton: true,
          top: _selectedItem.top + (_selectedItem.height - 48) / 2,
          left:
              min(maxWidth - 40, _selectedItem.left + _selectedItem.width - 24),
          icon: Icons.add_circle_outline,
          onPressed: () => cardsProvider.addChildItemToTheRight(
            _selectedItem!.card,
          ),
        ),
      );
      children.add(
        ActionButton(
          displayButton: true,
          top: max(-8, _selectedItem.top - 24),
          left: _selectedItem.left - 24 + _selectedItem.width / 2,
          icon: Icons.add_circle_outline,
          onPressed: () => cardsProvider.addChildItemAbove(
            _selectedItem!.card,
          ),
        ),
      );
      children.add(
        ActionButton(
          displayButton: true,
          top: min(
              maxHeight - 40, _selectedItem.top + _selectedItem.height - 24),
          left: _selectedItem.left - 24 + _selectedItem.width / 2,
          icon: Icons.add_circle_outline,
          onPressed: () => cardsProvider.addChildItemBelow(
            _selectedItem!.card,
          ),
        ),
      );
    }

    return children;
  }
}

class FlexCardWidget extends StatelessWidget {
  final PositionedFlexCard item;

  const FlexCardWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dragTargetsNotifier = context.read<DragTargetsNotifier>();
    final editorController = context.read<EditorController>();
    final isFake = item.card.id == 0;

    return Container(
      width: item.width,
      height: item.height,
      color: isFake ? Colors.green : Colors.pink,
      child: InkWell(
        onTap: () => editorController.selectedItemId = item.card.id,
        child: Stack(
          children: [
            if (!isFake)
              LongPressDraggable(
                data: item,
                feedback: Material(
                  color: Colors.transparent,
                  child: Container(
                    color: Colors.blue.withOpacity(0.3),
                    width: item.width,
                    height: item.height,
                    child: Center(
                      child: Text(
                        item.card.toString(),
                      ),
                    ),
                  ),
                ),
                onDragStarted: () => dragTargetsNotifier.dragging = true,
                onDragEnd: (details) => dragTargetsNotifier.dragging = false,
                onDraggableCanceled: (velocity, offset) =>
                    dragTargetsNotifier.dragging = false,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          item.card.toString(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final bool displayButton;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final IconData icon;
  final VoidCallback? onPressed;

  const ActionButton({
    Key? key,
    this.displayButton = false,
    this.left,
    this.top,
    this.right,
    this.bottom,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Center(
        child: AnimatedOpacity(
          opacity: displayButton ? 1 : 0,
          duration: const Duration(milliseconds: 250),
          child: IgnorePointer(
            ignoring: !displayButton,
            child: Container(
              decoration: const ShapeDecoration(
                color: Colors.black26,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(icon),
                splashRadius: 24,
                onPressed: onPressed,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AutoScrollTimer {
  Timer? _timer;
  // https://github.com/flutter/flutter/issues/62363
  final GlobalKey<NestedScrollViewState> nestedScrollViewGlobalKey;

  AutoScrollTimer({
    required this.nestedScrollViewGlobalKey,
  });

  startUp() {
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(milliseconds: 300),
      (timer) {
        final controller =
            nestedScrollViewGlobalKey.currentState?.innerController;
        controller?.animateTo(
          controller.position.pixels - 100,
          duration: Duration(milliseconds: 400),
          curve: Curves.linear,
        );
      },
    );
  }

  startDown() {
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(milliseconds: 300),
      (timer) {
        final controller =
            nestedScrollViewGlobalKey.currentState?.innerController;
        controller?.animateTo(
          controller.position.pixels + 100,
          duration: Duration(milliseconds: 400),
          curve: Curves.linear,
        );
      },
    );
  }

  stop() {
    _timer?.cancel();
  }
}
