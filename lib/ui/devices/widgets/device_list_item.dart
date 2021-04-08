import 'package:flutter/material.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/features/devices/entities/device.dart';

import 'device_list_item_automation.dart';
import 'device_list_item_cover.dart';
import 'device_list_item_light.dart';
import 'device_list_item_sensor.dart';

abstract class DeviceListItem extends StatelessWidget {
  final Device device;

  const DeviceListItem({Key key, this.device}) : super(key: key);

  factory DeviceListItem.fromDevice(Device device) {
    switch (device.deviceType) {
      case DeviceType.AUTOMATION:
        return DeviceListItemAutomation(device: device);
      case DeviceType.LIGHT:
        return DeviceListItemLight(device: device);
      case DeviceType.COVER:
        return DeviceListItemCover(device: device);
      case DeviceType.WEATHER:
        return DeviceListItemSensor(device: device);
      case DeviceType.BINARY_SENSOR:
        return DeviceListItemSensor(device: device);
      case DeviceType.SENSOR:
        return DeviceListItemSensor(device: device);
      case DeviceType.SWITCH:
        return DeviceListItemSensor(device: device);
      case DeviceType.MEDIA_PLAYER:
        return DeviceListItemSensor(device: device);
    }

    return DeviceListItemSensor(device: device);
  }

  @override
  Widget build(BuildContext context) {
    return buildChild(context);
  }

  Widget buildChild(BuildContext context) {
    final _leading = leading ?? buildLeading(context);
    final _trailing = trailing ?? buildTrailing(context);

    return InkWell(
      //onTap: () => Navigator.of(context).pushReplacementNamed("/devices"),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Icon
            if (_leading != null) leading,

            SizedBox(width: _leading != null ? 12 : 4),

            // Labels
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device.friendlyName,
                    style: _deviceNameTextStyle(),
                  ),
                  Text(
                    "${device.state} ${device.unitOfMeasurement ?? ''}",
                    style: _deviceStateTextStyle(),
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

  Widget get leading => null;
  Widget get trailing => null;

  Widget buildLeading(BuildContext context) => null;
  Widget buildTrailing(BuildContext context) => null;

  ///
  /// --- TextStyle --- ///
  ///

  TextStyle _deviceNameTextStyle() {
    return TextStyle(
      fontSize: 12,
      color: Colors.black54,
    );
  }

  TextStyle _deviceStateTextStyle() {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: Colors.black87,
    );
  }
}
