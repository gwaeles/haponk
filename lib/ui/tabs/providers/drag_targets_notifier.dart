import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haponk/data/tabs/entities/fake_flex_card.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:haponk/data/tabs/entities/positioned_drag_target.dart';
import 'package:haponk/data/tabs/entities/positioned_flex_card.dart';

class DragTargetsNotifier extends ChangeNotifier {
  final double maxWidth;
  List<PositionedFlexCard> _positionedFlexCards = [];
  List<PositionedDragTarget> _positionedDragTargets = [];
  List<FlexCard>? _flexCards;
  FakeFlexCard? _activeDragTarget;
  bool _dragging = false;
  Timer? _timer;

  DragTargetsNotifier({
    required this.maxWidth,
  });

  List<PositionedFlexCard> get positionedFlexCards => _positionedFlexCards;
  List<PositionedDragTarget> get positionedDragTargets =>
      _positionedDragTargets;

  List<FlexCard>? get flexCards => _flexCards;
  set flexCards(List<FlexCard>? value) {
    _flexCards = value;
    _buildPositionedCards();
    _buildPositionedDragTargets();
    notifyListeners();
  }

  FakeFlexCard? get activeDragTarget => _activeDragTarget;
  set activeDragTarget(FakeFlexCard? value) {
    if (_activeDragTarget != value) {
      _activeDragTarget = value;
      _notifyListenersLater();
    }
  }

  bool get dragging => _dragging;
  set dragging(bool value) {
    _dragging = value;
    debugPrint('DragTargetsNotifier _dragging: $value');
    notifyListeners();
  }

  _notifyListenersLater() {
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(milliseconds: 100),
      (timer) {
        timer.cancel();
        _buildPositionedCards();
        notifyListeners();
      },
    );
  }

  _buildPositionedCards() {
    final List<PositionedFlexCard> result = [];
    double top = 0;

    final List<FlexCard> _processedData = []..addAll(
        _flexCards?.map(
              (e) => e.copyWith(
                children: e.children
                    ?.map(
                      (child) => child.copyWith(),
                    )
                    .toList(),
              ),
            ) ??
            [],
      );

    if (_activeDragTarget != null) {
      final fakeItem = _activeDragTarget!;
      if (fakeItem.itemIndex == -1) {
        // Add a fake row item
        _processedData.insert(
          fakeItem.rowIndex,
          FlexCard(
            id: 0,
            tabId: fakeItem.card.tabId,
            type: "deft",
            position: fakeItem.rowIndex,
            horizontalFlex: 1,
            verticalFlex: 0,
            width: 0,
            height: 0,
          ),
        );
      } else {
        // Add a fake item into a row
        final targetCard = _processedData.removeAt(fakeItem.rowIndex);
        if (targetCard.children?.isNotEmpty == true) {
          // Add a fake item into an existing row
          targetCard.children!.insert(
            fakeItem.itemIndex,
            FlexCard(
              id: 0,
              tabId: fakeItem.card.tabId,
              type: "deft",
              position: fakeItem.itemIndex,
              horizontalFlex: 1,
              verticalFlex: 0,
              width: 0,
              height: 0,
            ),
          );
          _processedData.insert(
            fakeItem.rowIndex,
            targetCard,
          );
        } else {
          // Add a fake item into a new row
          _processedData.insert(
            fakeItem.rowIndex,
            FlexCard(
              id: 0,
              tabId: fakeItem.card.tabId,
              type: "deft",
              position: fakeItem.rowIndex,
              horizontalFlex: 1,
              verticalFlex: 0,
              width: 0,
              height: 0,
              children: []
                ..add(targetCard)
                ..insert(
                  fakeItem.itemIndex,
                  FlexCard(
                    id: 0,
                    tabId: fakeItem.card.tabId,
                    type: "deft",
                    position: fakeItem.itemIndex,
                    horizontalFlex: 1,
                    verticalFlex: 0,
                    width: 0,
                    height: 0,
                  ),
                ),
            ),
          );
        }
      }
    }

    for (int i = 0; i < _processedData.length; i++) {
      final item = _processedData[i];

      if (item.children?.isNotEmpty == true) {
        // Row
        double left = 0;

        for (int j = 0; j < item.children!.length; j++) {
          final child = item.children![j];
          final count = item.children!.length;
          final itemWidth = (maxWidth - count + 1) / count;

          result.add(
            PositionedFlexCard(
              top: top,
              left: left,
              width: itemWidth,
              height: 56,
              card: child,
              rowCount: _processedData.length,
              rowIndex: i,
              itemCount: count,
              itemIndex: j,
            ),
          );

          left += itemWidth + 1;
        }
      } else {
        // Unique item
        result.add(
          PositionedFlexCard(
            top: top,
            left: 0,
            width: maxWidth,
            height: 56,
            card: item,
            rowCount: _processedData.length,
            rowIndex: i,
          ),
        );
      }

      top += 57;
    }

    _positionedFlexCards = result;
  }

  _buildPositionedDragTargets() {
    final List<PositionedDragTarget> result = [];
    double top = 0;

    for (int i = 0; i < (_flexCards?.length ?? 0); i++) {
      final item = _flexCards![i];

      if (item.children?.isNotEmpty == true) {
        // Row
        double left = 0;

        for (int j = 0; j < item.children!.length; j++) {
          final count = item.children!.length;
          final itemWidth = (maxWidth - count + 1) / count;

          // New row item above
          // Take into account the height of the divider
          result.add(
            PositionedDragTarget(
              top: top - 1,
              left: left + 16,
              width: itemWidth - 32,
              height: 17,
              rowIndex: i,
            ),
          );

          // New row item below
          result.add(
            PositionedDragTarget(
              top: top + 40,
              left: left + 16,
              width: itemWidth - 32,
              height: 16,
              rowIndex: i + 1,
            ),
          );

          // Add item on the left
          // Take into account the width of the divider
          result.add(
            PositionedDragTarget(
              top: top,
              left: left - 1,
              width: 17,
              height: 56,
              rowIndex: i,
              itemIndex: j,
            ),
          );

          // Add item on the right
          result.add(
            PositionedDragTarget(
              top: top,
              left: left + itemWidth - 16,
              width: 16,
              height: 56,
              rowIndex: i,
              itemIndex: j + 1,
            ),
          );

          left += itemWidth + 1;
        }
      } else {
        // New row item above
        // Take into account the height of the divider
        result.add(
          PositionedDragTarget(
            top: top - 1,
            left: 16,
            width: maxWidth - 32,
            height: 17,
            rowIndex: i,
          ),
        );

        // New row item below
        result.add(
          PositionedDragTarget(
            top: top + 40,
            left: 16,
            width: maxWidth - 32,
            height: 16,
            rowIndex: i + 1,
          ),
        );

        // Add item on the left
        result.add(
          PositionedDragTarget(
            top: top,
            left: 0,
            width: 16,
            height: 56,
            rowIndex: i,
            itemIndex: 0,
          ),
        );

        // Add item on the right
        result.add(
          PositionedDragTarget(
            top: top,
            left: maxWidth - 16,
            width: 16,
            height: 56,
            rowIndex: i,
            itemIndex: 1,
          ),
        );
      }

      top += 57;
    }

    _positionedDragTargets = result;
  }
}