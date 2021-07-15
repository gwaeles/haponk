import 'package:flutter/material.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:haponk/data/tabs/entities/flex_tab.dart';
import 'package:haponk/data/tabs/entities/positioned_flex_card.dart';
import 'package:haponk/data/tabs/providers/cards_provider.dart';
import 'package:provider/provider.dart';

import 'editor_controller.dart';

class TabList extends StatelessWidget {
  final FlexTab flexTabItem;
  final CardsProvider cardsNotifier;

  const TabList({
    Key? key,
    required this.flexTabItem,
    required this.cardsNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<CardsProvider>.value(
            value: cardsNotifier,
          ),
          StreamProvider<List<FlexCard>>(
            initialData: [],
            create: (context) => context.read<CardsProvider>().cardsStream,
          ),
        ],
        child: Consumer2<CardsProvider, List<FlexCard>>(builder: (
          context,
          cardsProvider,
          items,
          child,
        ) {
          return CustomScrollView(
            key: PageStorageKey<String>(flexTabItem.label ?? ''),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                sliver: items.length == 0
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
                                ]),
                          ),
                        )),
                      )
                    : SliverToBoxAdapter(
                        child: FlexCardGrid(
                          cards: cardsProvider.buildPositionedCard(
                            data: items,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
              ),
            ],
          );
        }));
  }
}

class FlexCardGrid extends StatelessWidget {
  final List<PositionedFlexCard> cards;

  const FlexCardGrid({
    Key? key,
    required this.cards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    for (int i = 0; i < cards.length; i++) {
      final item = cards[i];

      children.add(
        Positioned(
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

    return Container(
      color: Colors.purple,
      height: 2500,
      child: Stack(
        fit: StackFit.loose,
        children: children,
      ),
    );
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
    final editorController = context.watch<EditorController>();
    final displayButton = editorController.selectedItemId == item.card.id;
    final customButton = editorController.editorMode == EditorMode.CUSTOM;
    final moveButton = editorController.editorMode == EditorMode.MOVE;
    final removeButton = editorController.editorMode == EditorMode.REMOVE;

    return Container(
      width: item.width,
      height: item.height,
      color: Colors.pink,
      child: InkWell(
        onTap: () => editorController
            .setSelectedItemId(displayButton ? 0 : item.card.id),
        child: Stack(
          children: [
            Draggable(
              data: item.card,
              feedback: Material(
                child: Container(
                  width: item.width,
                  height: item.height,
                  color: Colors.blue.withOpacity(0.3),
                  child: Center(
                    child: Text(
                      item.card.toString(),
                    ),
                  ),
                ),
              ),
              childWhenDragging: Stack(
                children: [
                  ActionButton(
                    displayButton: moveButton,
                    icon: Icons.open_with_rounded,
                    onPressed: () {},
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      item.card.toString(),
                    ),
                  ),
                  ActionButton(
                    displayButton: moveButton,
                    icon: Icons.open_with_rounded,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            DragTarget<FlexCard>(
              onWillAccept: (value) => value?.id != item.card.id,
              builder: (context, candidateData, rejectedData) =>
                  candidateData.length > 0
                      ? Container(
                          color: Colors.green,
                        )
                      : Container(),
            ),
            ActionButton(
              displayButton: displayButton,
              left: -8,
              top: 0,
              bottom: 0,
              icon: Icons.add_circle_outline,
              onPressed: () => context
                  .read<CardsProvider>()
                  .addChildItemToTheLeft(item.card),
            ),
            ActionButton(
              displayButton: displayButton,
              right: -8,
              top: 0,
              bottom: 0,
              icon: Icons.add_circle_outline,
              onPressed: () => context
                  .read<CardsProvider>()
                  .addChildItemToTheRight(item.card),
            ),
            ActionButton(
              displayButton: displayButton,
              top: -24,
              left: 0,
              right: 0,
              icon: Icons.add_circle_outline,
              onPressed: () =>
                  context.read<CardsProvider>().addChildItemAbove(item.card),
            ),
            ActionButton(
              displayButton: displayButton,
              bottom: -24,
              left: 0,
              right: 0,
              icon: Icons.add_circle_outline,
              onPressed: () =>
                  context.read<CardsProvider>().addChildItemBelow(item.card),
            ),
            ActionButton(
              displayButton: customButton,
              icon: Icons.palette,
              onPressed: () {},
            ),
            ActionButton(
              displayButton: removeButton,
              icon: Icons.delete,
              onPressed: () => context.read<CardsProvider>().deleteItem(
                    item.card,
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
