import 'package:flutter/material.dart';
import 'package:haponk/data/tabs/entities/positioned_flex_card.dart';
import 'package:haponk/ui/tabs/providers/drag_targets_notifier.dart';
import 'package:haponk/ui/tabs/providers/editor_controller.dart';
import 'package:provider/provider.dart';

class FlexCardWidget extends StatelessWidget {
  final PositionedFlexCard item;
  final isSelected;

  const FlexCardWidget({
    Key? key,
    required this.item,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dragTargetsNotifier = context.read<DragTargetsNotifier>();
    final editorController = context.read<EditorController>();
    final isFake = item.card.id == 0;

    return Container(
      width: item.width,
      height: item.height,
      decoration: BoxDecoration(
        color: isFake ? Colors.green : Colors.pink,
        border: isSelected
            ? Border.all(
                color: Colors.lightBlue.shade200,
                width: 2,
              )
            : null,
      ),
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
                    color: Colors.purple.withOpacity(0.5),
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
