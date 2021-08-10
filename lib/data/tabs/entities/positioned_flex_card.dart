import 'dart:math';

import 'flex_card.dart';

class PositionedFlexCard {
  final double top;
  final double left;
  final double width;
  final double height;
  final FlexCard card;
  final int rowIndex;
  final int rowCount;
  final int itemIndex;
  final int itemCount;

  PositionedFlexCard({
    required this.top,
    required this.left,
    required this.width,
    required this.height,
    required this.card,
    required this.rowIndex,
    required this.rowCount,
    this.itemIndex = 0,
    this.itemCount = 1,
  });

  bool get isChild => card.isChild;

  bool isSameRowPosition({
    required int rowIndex,
  }) {
    return this.rowIndex == rowIndex ||
        (!isChild && this.rowIndex == rowIndex - 1);
  }

  bool isSameChildPosition({
    required int rowIndex,
    required int itemIndex,
  }) {
    return isChild &&
        isSameRowPosition(rowIndex: rowIndex) &&
        itemIndex != -1 &&
        (this.itemIndex == max(0, itemIndex) ||
            this.itemIndex == max(0, itemIndex - 1));
  }
}
