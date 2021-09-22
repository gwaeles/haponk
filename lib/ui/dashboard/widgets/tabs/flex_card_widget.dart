import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/devices/blocs/device_bloc.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/devices/states/device_state.dart';
import 'package:haponk/data/tabs/entities/positioned_flex_card.dart';
import 'package:haponk/ui/dashboard/providers/drag_targets_notifier.dart';
import 'package:haponk/ui/dashboard/providers/editor_controller.dart';
import 'package:provider/provider.dart';

import '../cards/device_card_item.dart';

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

    return BlocProvider(
      create: (context) => DeviceBloc(
        repository: context.read(),
        deviceId: item.card.stateId ?? 0,
      ),
      child: BlocBuilder<DeviceBloc, DeviceState>(
        builder: (context, state) {
          final Device? device = state is DeviceLoaded ? state.device : null;
          return Container(
            width: item.width,
            height: item.height,
            decoration: BoxDecoration(
              color: isFake
                  ? Colors.green
                  : (device == null ? Colors.pink : Colors.white10),
              border: isSelected
                  ? Border.all(
                      color: Colors.lightBlue.shade200,
                      width: 2,
                    )
                  : null,
            ),
            child: InkWell(
              onTap: () => editorController.selectedItemId = item.card.id,
              child: isFake
                  ? null
                  : LongPressDraggable(
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
                      onDragEnd: (details) =>
                          dragTargetsNotifier.dragging = false,
                      onDraggableCanceled: (velocity, offset) =>
                          dragTargetsNotifier.dragging = false,
                      child: device == null
                          ? Container(
                              color: Colors.transparent,
                              child: Center(
                                child: Text(item.card.toString()),
                              ),
                            )
                          : DeviceCardItem.fromDevice(
                              device: device,
                              card: item.card,
                            ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
