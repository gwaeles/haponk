import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/data/connection/models/constants.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';
import 'package:haponk/domain/devices/entities/device.dart';
import 'package:haponk/ui/dashboard/widgets/cards/device_card_item.dart';

import 'device_list_item_automation.dart';
import 'device_list_item_cover.dart';
import 'device_list_item_light.dart';
import 'device_list_item_sensor.dart';

abstract class DeviceListItem extends ConsumerWidget {
  final ComparableDevice item;
  final ServiceCallback callService;

  const DeviceListItem({
    Key? key,
    required this.item,
    required this.callService,
  }) : super(key: key);

  factory DeviceListItem.fromDevice(
    ComparableDevice device,
    ServiceCallback callService,
  ) {
    switch (device.deviceType) {
      case DeviceType.AUTOMATION:
        return DeviceListItemAutomation(
          device: device,
          callService: callService,
        );
      case DeviceType.LIGHT:
        return DeviceListItemLight(
          device: device,
          callService: callService,
        );
      case DeviceType.COVER:
        return DeviceListItemCover(
          device: device,
          callService: callService,
        );
      case DeviceType.WEATHER:
        return DeviceListItemSensor(
          device: device,
          callService: callService,
        );
      case DeviceType.BINARY_SENSOR:
        return DeviceListItemSensor(
          device: device,
          callService: callService,
        );
      case DeviceType.SENSOR:
        return DeviceListItemSensor(
          device: device,
          callService: callService,
        );
      case DeviceType.SWITCH:
        return DeviceListItemSensor(
          device: device,
          callService: callService,
        );
      case DeviceType.MEDIA_PLAYER:
        return DeviceListItemSensor(
          device: device,
          callService: callService,
        );
      case DeviceType.UNKNOWN:
        return DeviceListItemSensor(
          device: device,
          callService: callService,
        );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Device? device = ref.watch(deviceProvider(item.id));
    return buildChild(context, device);
  }

  Widget buildChild(BuildContext context, Device? device) {
    final _leading = leading ?? buildLeading(context, device);
    final _trailing = trailing ?? buildTrailing(context, device);

    return InkWell(
      //onTap: () => Navigator.of(context).pushReplacementNamed("/supervisor"),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Icon
            if (_leading != null) _leading,
            if (_leading != null) SizedBox(width: 16),

            // Labels
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device?.friendlyName ?? (item.friendlyName ?? ''),
                    style: AppTheme.of(context).listItemTitleTextStyle,
                  ),
                  SizedBox(height: 2),
                  Text(
                    formatStateValue(device),
                    style: AppTheme.of(context).listItemSubtitleTextStyle,
                  ),
                ],
              ),
            ),

            // Action
            if (_trailing != null) _trailing,
            if (_trailing == null) SizedBox(width: 4),
          ],
        ),
      ),
    );
  }

  ///
  /// --- Widgets --- ///
  ///

  Widget? get leading => null;
  Widget? get trailing => null;

  String formatStateValue(Device? device) {
    return "${device?.state ?? ''} ${device?.unitOfMeasurement ?? ''}";
  }

  Widget? buildLeading(BuildContext context, Device? device) => null;
  Widget? buildTrailing(BuildContext context, Device? device) => null;
}
