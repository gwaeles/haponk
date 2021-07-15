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
}
