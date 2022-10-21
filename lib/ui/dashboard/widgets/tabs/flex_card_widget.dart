import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/devices/blocs/device_bloc.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/devices/states/device_state.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:haponk/data/tabs/entities/positioned_flex_card.dart';

import '../cards/device_card_item.dart';

class FlexCardWidget extends StatelessWidget {
  final PositionedFlexCard item;
  final isSelected;
  final isDraggable;
  final VoidCallback? onPressed;
  final VoidCallback? onDragStarted;
  final VoidCallback? onDragEnd;

  const FlexCardWidget({
    Key? key,
    required this.item,
    this.isSelected = false,
    this.isDraggable = false,
    this.onPressed,
    this.onDragStarted,
    this.onDragEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFake = item.card.id == 0;

    return BlocProvider(
      create: (context) => DeviceBloc(
        repository: context.read(),
        deviceId: '${item.card.stateId ?? 0}',
      )..init(),
      child: BlocBuilder<DeviceBloc, DeviceState>(
        builder: (context, state) {
          final Device? device = state is DeviceLoaded ? state.device : null;
          return Container(
            width: item.width,
            height: item.height,
            decoration: BoxDecoration(
              color: isFake ? Colors.green : (device == null ? Colors.pink : Colors.white10),
              border: isSelected
                  ? Border.all(
                      color: Colors.lightBlue.shade200,
                      width: 2,
                    )
                  : null,
            ),
            child: isDraggable
                ? InkWell(
                    onTap: onPressed,
                    child: LongPressDraggable(
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
                      onDragStarted: onDragStarted,
                      onDragEnd: (details) => onDragEnd?.call(),
                      onDraggableCanceled: (velocity, offset) => onDragEnd?.call(),
                      child: _ItemContent(
                        card: item.card,
                        device: isFake ? null : device,
                      ),
                    ),
                  )
                : _ItemContent(
                    card: item.card,
                    device: isFake ? null : device,
                  ),
          );
        },
      ),
    );
  }
}

class _ItemContent extends StatelessWidget {
  final Device? device;
  final FlexCard card;

  const _ItemContent({
    Key? key,
    this.device,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return device == null
        ? Center(
            child: Text(card.toString()),
          )
        : DeviceCardItem.fromDevice(
            device: device!,
            card: card,
          );
  }
}
