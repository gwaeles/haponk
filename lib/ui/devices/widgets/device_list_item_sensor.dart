import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hapoc/features/devices/entities/device.dart';

import 'device_list_item.dart';

class DeviceListItemSensor extends DeviceListItem {
  const DeviceListItemSensor({Key key, Device device})
      : super(key: key, device: device);

  @override
  Widget get leading => SvgPicture.asset(
        'assets/images/thermometer.svg',
        width: 48,
        height: 48,
      );
}
