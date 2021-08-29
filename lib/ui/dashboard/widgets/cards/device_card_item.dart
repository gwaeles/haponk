import 'package:flutter/material.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/data/devices/entities/device.dart';

import 'device_card_item_automation.dart';
import 'device_card_item_cover.dart';
import 'device_card_item_light.dart';
import 'device_card_item_sensor.dart';

abstract class DeviceCardItem extends StatelessWidget {
  final Device device;

  const DeviceCardItem({
    Key? key,
    required this.device,
  }) : super(key: key);

  factory DeviceCardItem.fromDevice(Device device) {
    switch (device.deviceType) {
      case DeviceType.AUTOMATION:
        return DeviceCardItemAutomation(device: device);
      case DeviceType.LIGHT:
        return DeviceCardItemLight(device: device);
      case DeviceType.COVER:
        return DeviceCardItemCover(device: device);
      case DeviceType.WEATHER:
        return DeviceCardItemSensor(device: device);
      case DeviceType.BINARY_SENSOR:
        return DeviceCardItemSensor(device: device);
      case DeviceType.SENSOR:
        return DeviceCardItemSensor(device: device);
      case DeviceType.SWITCH:
        return DeviceCardItemSensor(device: device);
      case DeviceType.MEDIA_PLAYER:
        return DeviceCardItemSensor(device: device);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print(
            "[GARY] DeviceCardItem maxWidth:${constraints.maxWidth}, maxHeight:${constraints.maxHeight}");
        final _showSubtitle = constraints.maxHeight > 64;
        final _showTrailing = constraints.maxWidth > 250;

        final _leading = leading ?? buildLeading(context);
        final _trailing =
            _showTrailing ? (trailing ?? buildTrailing(context)) : null;

        final _showLabels = _leading != null && constraints.maxWidth > 150;

        return InkWell(
          //onTap: () => Navigator.of(context).pushReplacementNamed("/supervisor"),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon
                if (_leading != null) _leading,
                if (_leading != null && _showLabels) SizedBox(width: 16),

                // Labels
                if (_showLabels)
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          device.friendlyName ?? '',
                          style: AppTheme.of(context).listItemTitleTextStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (_showSubtitle) SizedBox(height: 2),
                        if (_showSubtitle)
                          Text(
                            "${device.state} ${device.unitOfMeasurement ?? ''}",
                            style:
                                AppTheme.of(context).listItemSubtitleTextStyle,
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
      },
    );
  }

  ///
  /// --- Widgets --- ///
  ///

  Widget? get leading => null;
  Widget? get trailing => null;

  Widget? buildLeading(BuildContext context) => null;
  Widget? buildTrailing(BuildContext context) => null;
}
