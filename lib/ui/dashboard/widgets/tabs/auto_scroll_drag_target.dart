import 'package:flutter/material.dart';
import 'package:haponk/data/tabs/entities/positioned_flex_card.dart';
import 'package:haponk/ui/dashboard/providers/drag_targets_notifier.dart';
import 'package:haponk/ui/dashboard/providers/scroll_edge_notifier.dart';
import 'package:provider/provider.dart';

class AutoScrollDragTarget extends StatelessWidget {
  final DragTargetWillAccept<PositionedFlexCard> onWillAccept;
  final DragTargetLeave<PositionedFlexCard> onLeave;
  final bool isOnTop;

  const AutoScrollDragTarget({
    Key? key,
    required this.onWillAccept,
    required this.onLeave,
    required this.isOnTop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dragTargetsNotifier = context.watch<DragTargetsNotifier>();
    final scrollEdgeNotifier = context.watch<ScrollEdgeNotifier>();

    return IgnorePointer(
      ignoring: !dragTargetsNotifier.dragging ||
          (isOnTop && scrollEdgeNotifier.scrollOnTop) ||
          (!isOnTop && scrollEdgeNotifier.scrollAtTheEnd),
      child: DragTarget<PositionedFlexCard>(
        onWillAccept: onWillAccept,
        onLeave: onLeave,
        builder: (context, candidateData, rejectedData) => Container(
          color: Colors.transparent,
          height: 40,
        ),
      ),
    );
  }
}
