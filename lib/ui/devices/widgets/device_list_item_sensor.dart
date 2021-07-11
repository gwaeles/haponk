import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/features/devices/entities/device.dart';

import 'device_list_item.dart';

class DeviceListItemSensor extends DeviceListItem {
  const DeviceListItemSensor({
    Key? key,
    required Device device,
  }) : super(key: key, device: device);

  @override
  Widget buildLeading(BuildContext context) {
    final path = AppTheme.of(context).isDark ? "dark/" : "";

    return SvgPicture.asset(
      imagePath(device, path),
      width: 48,
      height: 48,
    );
  }

  String imagePath(Device device, String path) {
    if (device.deviceType == DeviceType.SENSOR) {
      if (device.deviceClass == "temperature") {
        return 'assets/images/${path}thermometer.svg';
      } else if (device.deviceClass == "humidity") {
        return 'assets/images/${path}humidity.svg';
      } else if (device.deviceClass == "battery") {
        final level = int.tryParse(device.state ?? '');
        if (level == null) {
          return 'assets/images/${path}battery.svg';
        } else if (level >= 50) {
          return 'assets/images/${path}battery_full.svg';
        } else if (level >= 20) {
          return 'assets/images/${path}battery_half.svg';
        } else {
          return 'assets/images/${path}battery_low.svg';
        }
      } else {
        return 'assets/images/${path}sensor.svg';
      }
    } else if (device.deviceType == DeviceType.BINARY_SENSOR) {
      if (device.deviceClass == "plug") {
        return 'assets/images/${path}battery.svg';
      } else if (device.deviceClass == "opening") {
        return 'assets/images/${path}sensor.svg';
      } else {
        return 'assets/images/${path}processor.svg';
      }
    }

    return 'assets/images/${path}processor.svg';
  }
}
