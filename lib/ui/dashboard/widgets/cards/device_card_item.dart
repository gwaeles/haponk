import 'package:flutter/material.dart';
import 'package:haponk/data/connection/models/constants.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/domain/devices/entities/device.dart';
import 'package:haponk/domain/devices/entities/service_params.dart';
import 'package:haponk/domain/tabs/entities/flex_card.dart';

import 'device_card_item_automation.dart';
import 'device_card_item_cover.dart';
import 'device_card_item_light.dart';
import 'device_card_item_sensor.dart';

typedef ServiceCallback = void Function(ServiceParams params);

abstract class DeviceCardItem extends StatelessWidget {
  final Device device;
  final FlexCard card;
  final ServiceCallback callService;

  const DeviceCardItem({
    Key? key,
    required this.device,
    required this.card,
    required this.callService,
  }) : super(key: key);

  factory DeviceCardItem.fromDevice({
    required Device device,
    required FlexCard card,
    required ServiceCallback callService,
  }) {
    switch (device.deviceType) {
      case DeviceType.AUTOMATION:
        return DeviceCardItemAutomation(
          device: device,
          card: card,
          callService: callService,
        );
      case DeviceType.LIGHT:
        return DeviceCardItemLight(
          device: device,
          card: card,
          callService: callService,
        );
      case DeviceType.COVER:
        return DeviceCardItemCover(
          device: device,
          card: card,
          callService: callService,
        );
      case DeviceType.WEATHER:
        return DeviceCardItemSensor(
          device: device,
          card: card,
          callService: callService,
        );
      case DeviceType.BINARY_SENSOR:
        return DeviceCardItemSensor(
          device: device,
          card: card,
          callService: callService,
        );
      case DeviceType.SENSOR:
        return DeviceCardItemSensor(
          device: device,
          card: card,
          callService: callService,
        );
      case DeviceType.SWITCH:
        return DeviceCardItemSensor(
          device: device,
          card: card,
          callService: callService,
        );
      case DeviceType.MEDIA_PLAYER:
        return DeviceCardItemSensor(
          device: device,
          card: card,
          callService: callService,
        );
      case DeviceType.UNKNOWN:
        return DeviceCardItemSensor(
          device: device,
          card: card,
          callService: callService,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final _showSubtitle = card.displayTitle &&
            card.displaySubtitle &&
            constraints.maxHeight > 50;
        final _showTrailing =
            card.displayTrailing && constraints.maxWidth > 250;

        final _leading =
            card.displayLeading ? (leading ?? buildLeading(context)) : null;
        final _trailing =
            _showTrailing ? (trailing ?? buildTrailing(context)) : null;

        final _showLabels = (card.displayTitle || card.displaySubtitle) &&
            (_leading == null || constraints.maxWidth > 150);

        final _subtitle = "${device.state} ${device.unitOfMeasurement ?? ''}";
        final _title =
            card.displayTitle ? (device.friendlyName ?? '') : _subtitle;

        return InkWell(
          //onTap: () => Navigator.of(context).pushReplacementNamed("/supervisor"),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
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
                          _title,
                          style: AppTheme.of(context).listItemTitleTextStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (_showSubtitle) SizedBox(height: 2),
                        if (_showSubtitle)
                          Text(
                            _subtitle,
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
