import 'dart:math';

import 'package:flutter/material.dart';
import 'package:haponk/data/tabs/entities/fake_flex_card.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:haponk/data/tabs/entities/positioned_flex_card.dart';
import 'package:haponk/data/tabs/providers/cards_provider.dart';
import 'package:haponk/ui/dashboard/providers/drag_targets_notifier.dart';
import 'package:haponk/ui/dashboard/providers/editor_controller.dart';
import 'package:provider/provider.dart';

import '../editor/action_button.dart';
import 'flex_card_widget.dart';
import '../editor/select_device_alert_dialog.dart';

class _FlexCardGridResult {
  final double height;
  final List<Widget> children;

  _FlexCardGridResult(
    this.height,
    this.children,
  );
}

class FlexCardGridBuilder extends StatelessWidget {
  final VoidCallback? onEditTab;
  final VoidCallback? onDeleteTab;

  const FlexCardGridBuilder({
    Key? key,
    this.onEditTab,
    this.onDeleteTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dragTargetsNotifier = context.watch<DragTargetsNotifier>();
    final editorController = context.watch<EditorController>();

    // Bind the notifier to the screen size
    dragTargetsNotifier.layoutWidth = MediaQuery.of(context).size.width;

    final result = buildChildren(
      context,
      dragTargetsNotifier,
      editorController,
      context.read<CardsProvider>(),
    );

    return SizedBox(
      height: result.height,
      child: Stack(
        fit: StackFit.loose,
        children: result.children,
      ),
    );
  }

  _FlexCardGridResult buildChildren(
    BuildContext context,
    DragTargetsNotifier dragTargetsNotifier,
    EditorController editorController,
    CardsProvider cardsProvider,
  ) {
    final List<Widget> children = [];
    final cards = dragTargetsNotifier.positionedFlexCards ?? [];
    final dragTargets = dragTargetsNotifier.positionedDragTargets;
    PositionedFlexCard? _selectedItem;
    double maxHeight = 0;
    double maxWidth = MediaQuery.of(context).size.width;

    // Cards management
    for (int i = 0; i < cards.length; i++) {
      final item = cards[i];

      if (!dragTargetsNotifier.dragging &&
          editorController.isOn &&
          editorController.selectedItemId > 0 &&
          editorController.selectedItemId == item.card.id) {
        _selectedItem = item;
      }

      maxHeight = max(maxHeight, item.top + item.height);

      children.add(
        editorController.isOn
            ? AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                key: item.card.id > 0 ? ValueKey(item.card.id) : null,
                top: item.top,
                left: item.left,
                width: item.width,
                height: item.height,
                child: FlexCardWidget(
                  item: item,
                  isSelected: _selectedItem == item,
                  isDraggable: editorController.isOn,
                  onPressed: () =>
                      editorController.selectedItemId = item.card.id,
                  onDragStarted: () => dragTargetsNotifier.dragging = true,
                  onDragEnd: () => dragTargetsNotifier.dragging = false,
                ),
              )
            : Positioned(
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

    if (cards.isEmpty) {
      // Permanent add button item notice
      children.add(
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 56,
          child: Center(
            child: Text("Tap on the button below to add your firt card"),
          ),
        ),
      );
      maxHeight = maxHeight + 56;
    }

    if (editorController.isOn || cards.isEmpty) {
      // Permanent add button item
      children.add(
        _ActionMenuButton(
          uniqueId: 'ADD_BUTTON_ITEM_${cardsProvider.tabId}',
          top: maxHeight + 1,
          width: maxWidth,
          onPressed: () => addItem(context),
          icon: Icon(
            Icons.add,
            color: Theme.of(context).focusColor,
          ),
        ),
      );
      maxHeight = maxHeight + 49;
      // Permanent rename button item
      children.add(
        _ActionMenuButton(
          uniqueId: 'RENAME_BUTTON_ITEM_${cardsProvider.tabId}',
          top: maxHeight + 1,
          width: maxWidth,
          onPressed: onEditTab,
          icon: Icon(
            Icons.edit,
            color: Theme.of(context).focusColor,
          ),
        ),
      );
      maxHeight = maxHeight + 49;
      // Permanent delete button item
      children.add(
        _ActionMenuButton(
          uniqueId: 'DELETE_BUTTON_ITEM_${cardsProvider.tabId}',
          top: maxHeight + 1,
          width: maxWidth,
          color: Colors.red,
          onPressed: onDeleteTab,
          icon: Icon(
            Icons.delete,
          ),
        ),
      );
      maxHeight = maxHeight + 49;
    }

    // Drag targets management
    if (editorController.isOn) {
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
                    if (accepted) {
                      dragTargetsNotifier.activeDragTarget = FakeFlexCard(
                        card: value.card,
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
                  onLeave: (value) =>
                      dragTargetsNotifier.activeDragTarget = null,
                  builder: (context, candidateData, rejectedData) => Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        );
      }
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

    return _FlexCardGridResult(maxHeight, children);
  }

  Future<void> addItem(BuildContext context) async {
    final cardsProvider = context.read<CardsProvider>();
    final editorController = context.read<EditorController>();

    final List<int>? deviceIds = await showDialog(
      context: context,
      builder: (context) => SelectDeviceAlertDialog(),
    );

    if (deviceIds?.isNotEmpty == true) {
      cardsProvider.createItems(
        deviceIds: deviceIds!,
      );
      // If the tab was empty, the user can add an item
      // So we ensure the edit mode is activated
      if (!editorController.isOn) {
        editorController.toggle();
      }
    }
  }

  Future<void> addChildItemToTheLeft({
    required BuildContext context,
    required FlexCard item,
  }) async {
    final List<int> deviceIds = await showDialog(
      context: context,
      builder: (context) => SelectDeviceAlertDialog(),
    );

    if (deviceIds.length == 1) {
      context.read<CardsProvider>().addChildItemToTheLeft(
            deviceId: deviceIds.first,
            item: item,
          );
    }
  }

  Future<void> addChildItemToTheRight({
    required BuildContext context,
    required FlexCard item,
  }) async {
    final List<int> deviceIds = await showDialog(
      context: context,
      builder: (context) => SelectDeviceAlertDialog(),
    );

    if (deviceIds.length == 1) {
      context.read<CardsProvider>().addChildItemToTheRight(
            deviceId: deviceIds.first,
            item: item,
          );
    }
  }

  Future<void> addChildItemAbove({
    required BuildContext context,
    required FlexCard item,
  }) async {
    final List<int> deviceIds = await showDialog(
      context: context,
      builder: (context) => SelectDeviceAlertDialog(),
    );

    if (deviceIds.length > 0) {
      context.read<CardsProvider>().addChildItemAbove(
            deviceIds: deviceIds,
            item: item,
          );
    }
  }

  Future<void> addChildItemBelow({
    required BuildContext context,
    required FlexCard item,
  }) async {
    final List<int> deviceIds = await showDialog(
      context: context,
      builder: (context) => SelectDeviceAlertDialog(),
    );

    if (deviceIds.length > 0) {
      context.read<CardsProvider>().addChildItemBelow(
            deviceIds: deviceIds,
            item: item,
          );
    }
  }
}

class _ActionMenuButton extends StatelessWidget {
  final String uniqueId;
  final double? top;
  final double? width;
  final VoidCallback? onPressed;
  final Widget? icon;
  final Color? color;

  const _ActionMenuButton({
    Key? key,
    required this.uniqueId,
    this.top,
    this.width,
    this.onPressed,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      key: ValueKey(uniqueId),
      top: top,
      left: 0,
      width: width,
      height: 48,
      child: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconTheme.of(context).copyWith(
            color: color,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: color ?? Theme.of(context).focusColor,
                width: 1,
              ),
            ),
            child: InkWell(
              onTap: onPressed,
              child: Center(
                child: icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
