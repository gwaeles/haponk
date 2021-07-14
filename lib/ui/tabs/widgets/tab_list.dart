import 'package:flutter/material.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:haponk/data/tabs/entities/flex_tab.dart';
import 'package:haponk/data/tabs/providers/cards_provider.dart';
import 'package:provider/provider.dart';

import 'editor_controller.dart';

class TabList extends StatelessWidget {
  final FlexTab flexTabItem;
  final CardsProvider cardsProvider;

  const TabList({
    Key? key,
    required this.flexTabItem,
    required this.cardsProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider.value(value: cardsProvider),
          StreamProvider(
            initialData: [],
            create: (context) => context.read<CardsProvider>().cardsStream,
          )
        ],
        child: Consumer(builder: (context, List<FlexCard> items, child) {
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
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              final item = items[index];
                              final child = item.children == null ||
                                      item.children!.isEmpty
                                  ? FlexCardWidget(
                                      item: item,
                                      rowCount: items.length,
                                      rowIndex: index,
                                      itemCount: 1,
                                      itemIndex: 0,
                                    )
                                  : FlexCardRow(
                                      item: item,
                                      rowCount: items.length,
                                      rowIndex: index,
                                    );

                              return Column(
                                children: <Widget>[
                                  if (index != 0)
                                    Divider(
                                      height: 1,
                                      color: Colors.transparent,
                                    ),
                                  child,
                                ],
                              );
                            },
                            childCount: items.length,
                          ),
                        ),
                ),
              ]);
        }));
  }
}

class FlexCardRow extends StatelessWidget {
  final FlexCard item;
  final int rowIndex;
  final int rowCount;

  const FlexCardRow({
    Key? key,
    required this.item,
    required this.rowIndex,
    required this.rowCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    for (int i = 0; i < (item.children?.length ?? 0); i++) {
      final element = item.children![i];
      if (i != 0) {
        children.add(SizedBox(width: 1));
      }
      children.add(Expanded(
          child: FlexCardWidget(
        item: element,
        rowCount: rowCount,
        rowIndex: rowIndex,
        itemCount: item.children?.length ?? 0,
        itemIndex: i,
      )));
    }

    return Row(children: children);
  }
}

class FlexCardWidget extends StatelessWidget {
  final FlexCard item;
  final int rowIndex;
  final int rowCount;
  final int itemIndex;
  final int itemCount;

  const FlexCardWidget({
    Key? key,
    required this.item,
    required this.rowIndex,
    required this.rowCount,
    required this.itemIndex,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editorController = context.watch<EditorController>();
    final displayButton = editorController.selectedItemId == item.id;
    final customButton = editorController.editorMode == EditorMode.CUSTOM;
    final moveButton = editorController.editorMode == EditorMode.MOVE;
    final removeButton = editorController.editorMode == EditorMode.REMOVE;

    return InkWell(
      onTap: () =>
          editorController.setSelectedItemId(displayButton ? 0 : item.id),
      child: Ink(
        height: 56,
        color: Colors.pink,
        child: Stack(
          children: [
            Center(child: Text(item.toString())),
            _iconButton(
                displayButton: displayButton,
                left: -8,
                top: 0,
                bottom: 0,
                icon: Icons.add_circle_outline,
                onPressed: () =>
                    context.read<CardsProvider>().addChildItemToTheLeft(item)),
            _iconButton(
                displayButton: displayButton,
                right: -8,
                top: 0,
                bottom: 0,
                icon: Icons.add_circle_outline,
                onPressed: () =>
                    context.read<CardsProvider>().addChildItemToTheRight(item)),
            _iconButton(
                displayButton: displayButton,
                top: -24,
                left: 0,
                right: 0,
                icon: Icons.add_circle_outline,
                onPressed: () =>
                    context.read<CardsProvider>().addChildItemAbove(item)),
            _iconButton(
                displayButton: displayButton,
                bottom: -24,
                left: 0,
                right: 0,
                icon: Icons.add_circle_outline,
                onPressed: () =>
                    context.read<CardsProvider>().addChildItemBelow(item)),
            _iconButton(
                displayButton: customButton,
                icon: Icons.palette,
                onPressed: () {}),
            _iconButton(
                displayButton: moveButton,
                icon: Icons.open_with_rounded,
                onPressed: () {}),
            _iconButton(
                displayButton: removeButton,
                icon: Icons.delete,
                onPressed: () =>
                    context.read<CardsProvider>().deleteItem(item)),
          ],
        ),
      ),
    );
  }

  Widget _iconButton({
    bool displayButton = false,
    double? left,
    double? top,
    double? right,
    double? bottom,
    required IconData icon,
    VoidCallback? onPressed,
  }) {
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
