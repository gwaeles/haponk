import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/features/devices/entities/device.dart';

import 'device_list_item.dart';

class DeviceListItemSensor extends DeviceListItem {
  const DeviceListItemSensor({Key key, Device device})
      : super(key: key, device: device);

  @override
  Widget get leading => SvgPicture.asset(
        imagePath(device),
        width: 48,
        height: 48,
      );

  String imagePath(Device device) {
    if (device.deviceType == DeviceType.SENSOR) {
      if (device.deviceClass == "temperature") {
        return 'assets/images/thermometer.svg';
      } else if (device.deviceClass == "humidity") {
        return 'assets/images/humidity.svg';
      } else if (device.deviceClass == "battery") {
        int level = int.tryParse(device.state);
        if (level == null) {
          return 'assets/images/battery.svg';
        } else if (level >= 50) {
          return 'assets/images/battery_full.svg';
        } else if (level >= 20) {
          return 'assets/images/battery_half.svg';
        } else {
          return 'assets/images/battery_low.svg';
        }
      } else {
        return 'assets/images/sensor.svg';
      }
    } else if (device.deviceType == DeviceType.BINARY_SENSOR) {
      if (device.deviceClass == "plug") {
        return 'assets/images/battery.svg';
      } else if (device.deviceClass == "opening") {
        return 'assets/images/sensor.svg';
      } else {
        return 'assets/images/processor.svg';
      }
    }

    return 'assets/images/processor.svg';
  }
}
