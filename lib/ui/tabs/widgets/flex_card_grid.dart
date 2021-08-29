import 'dart:math';

import 'package:flutter/material.dart';
import 'package:haponk/data/tabs/entities/fake_flex_card.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:haponk/data/tabs/entities/positioned_flex_card.dart';
import 'package:haponk/data/tabs/providers/cards_provider.dart';
import 'package:haponk/ui/tabs/providers/drag_targets_notifier.dart';
import 'package:haponk/ui/tabs/providers/editor_controller.dart';
import 'package:provider/provider.dart';

import 'action_button.dart';
import 'flex_card_widget.dart';
import 'select_device_alert_dialog.dart';

class FlexCardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dragTargetsNotifier = context.watch<DragTargetsNotifier>();

    return Container(
      color: Colors.transparent,
      height: dragTargetsNotifier.maxGridHeight,
      child: Consumer<EditorController>(
        builder: (
          context,
          editorController,
          child,
        ) {
          return Stack(
            fit: StackFit.loose,
            children: buildChildren(
              context,
              dragTargetsNotifier,
              editorController,
              context.read<CardsProvider>(),
            ),
          );
        },
      ),
    );
  }

  List<Widget> buildChildren(
    BuildContext context,
    DragTargetsNotifier dragTargetsNotifier,
    EditorController editorController,
    CardsProvider cardsProvider,
  ) {
    final List<Widget> children = [];
    final cards = dragTargetsNotifier.positionedFlexCards;
    final dragTargets = dragTargetsNotifier.positionedDragTargets;
    PositionedFlexCard? _selectedItem;
    double maxHeight = 0;
    double maxWidth = MediaQuery.of(context).size.width;

    // Cards management
    for (int i = 0; i < (cards?.length ?? 0); i++) {
      final item = cards![i];

      if (!dragTargetsNotifier.dragging &&
          editorController.selectedItemId > 0 &&
          editorController.selectedItemId == item.card.id) {
        _selectedItem = item;
      }

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
            isSelected: _selectedItem == item,
          ),
        ),
      );
    }

    if (cards?.length == 0) {
      // Permanent add button item notice
      children.add(
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 56,
          child: Center(
              child: Text("Tap on the button below to add your firt card")),
        ),
      );
      maxHeight = maxHeight + 56;
    }

    if (cards != null) {
      // Permanent add button item
      children.add(
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          key: ValueKey("ADD_BUTTON_ITEM_${cardsProvider.tabId}"),
          top: maxHeight + 1,
          left: 0,
          width: maxWidth,
          height: 48,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              child: InkWell(
                onTap: () => addItem(context),
                child: Center(
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ),
        ),
      );
      maxHeight = maxHeight + 49;
    }

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
          child: IgnorePointer(
            ignoring: !dragTargetsNotifier.dragging,
            child: Container(
              child: DragTarget<PositionedFlexCard>(
                onWillAccept: (value) {
                  final accepted = value?.card.id != null &&
                      (!value!.isSameRowPosition(
                            rowIndex: dragTarget.rowIndex,
                          ) ||
                          (value.rowIndex != dragTarget.rowIndex &&
                              dragTarget.itemIndex != -1) ||
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
                builder: (context, candidateData, rejectedData) => Container(
                  color: Colors.transparent,
                ),
              ),
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
          left: max(-8, _selectedItem.left - 23),
          icon: Icons.add,
          onPressed: () => addChildItemToTheLeft(
            context: context,
            item: _selectedItem!.card,
          ),
        ),
      );
      children.add(
        ActionButton(
          displayButton: true,
          top: _selectedItem.top + (_selectedItem.height - 48) / 2,
          left:
              min(maxWidth - 40, _selectedItem.left + _selectedItem.width - 25),
          icon: Icons.add,
          onPressed: () => addChildItemToTheRight(
            context: context,
            item: _selectedItem!.card,
          ),
        ),
      );
      children.add(
        ActionButton(
          displayButton: true,
          top: max(-8, _selectedItem.top - 23),
          left: _selectedItem.left - 24 + _selectedItem.width / 2,
          icon: Icons.add,
          onPressed: () => addChildItemAbove(
            context: context,
            item: _selectedItem!.card,
          ),
        ),
      );
      children.add(
        ActionButton(
          displayButton: true,
          top: min(
              maxHeight - 40, _selectedItem.top + _selectedItem.height - 25),
          left: _selectedItem.left - 24 + _selectedItem.width / 2,
          icon: Icons.add,
          onPressed: () => addChildItemBelow(
            context: context,
            item: _selectedItem!.card,
          ),
        ),
      );
    }

    return children;
  }

  Future<void> addItem(BuildContext context) async {
    final int? deviceId = await showDialog(
      context: context,
      builder: (context) => SelectDeviceAlertDialog(),
    );

    if (deviceId != null && deviceId > 0) {
      context.read<CardsProvider>().createItem(
            deviceId: deviceId,
          );
    }
  }

  Future<void> addChildItemToTheLeft({
    required BuildContext context,
    required FlexCard item,
  }) async {
    final int? deviceId = await showDialog(
      context: context,
      builder: (context) => SelectDeviceAlertDialog(),
    );

    if (deviceId != null && deviceId > 0) {
      context.read<CardsProvider>().addChildItemToTheLeft(
            deviceId: deviceId,
            item: item,
          );
    }
  }

  Future<void> addChildItemToTheRight({
    required BuildContext context,
    required FlexCard item,
  }) async {
    final int? deviceId = await showDialog(
      context: context,
      builder: (context) => SelectDeviceAlertDialog(),
    );

    if (deviceId != null && deviceId > 0) {
      context.read<CardsProvider>().addChildItemToTheRight(
            deviceId: deviceId,
            item: item,
          );
    }
  }

  Future<void> addChildItemAbove({
    required BuildContext context,
    required FlexCard item,
  }) async {
    final int? deviceId = await showDialog(
      context: context,
      builder: (context) => SelectDeviceAlertDialog(),
    );

    if (deviceId != null && deviceId > 0) {
      context.read<CardsProvider>().addChildItemAbove(
            deviceId: deviceId,
            item: item,
          );
    }
  }

  Future<void> addChildItemBelow({
    required BuildContext context,
    required FlexCard item,
  }) async {
    final int? deviceId = await showDialog(
      context: context,
      builder: (context) => SelectDeviceAlertDialog(),
    );

    if (deviceId != null && deviceId > 0) {
      context.read<CardsProvider>().addChildItemBelow(
            deviceId: deviceId,
            item: item,
          );
    }
  }
}
