import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/features/devices/entities/device.dart';

import 'device_list_item.dart';
import 'list_item_action_icon.dart';

class DeviceListItemAutomation extends DeviceListItem {
  const DeviceListItemAutomation({Key key, Device device})
      : super(key: key, device: device);

  @override
  Widget get leading => SvgPicture.asset(
        'assets/images/scenario.svg',
        width: 48,
        height: 48,
      );

  @override
  Widget get trailing => Row(
        children: [
          ListItemActionIcon(
            icon: Icons.play_arrow,
            onTap: (provider) => provider.callService(
                domain: "automation",
                service: "trigger",
                entityId: device.entityId),
          ),
        ],
      );
}
