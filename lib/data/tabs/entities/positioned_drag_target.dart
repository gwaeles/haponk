
class PositionedDragTarget {
  final double top;
  final double left;
  final double width;
  final double height;
  final int rowIndex;
  final int itemIndex;

  PositionedDragTarget({
    required this.top,
    required this.left,
    required this.width,
    required this.height,
    required this.rowIndex,
    this.itemIndex = -1,
  });
}
