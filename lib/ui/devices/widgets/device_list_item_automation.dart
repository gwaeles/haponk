import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/data/devices/entities/device.dart';

import 'device_list_item.dart';
import 'list_item_action_icon.dart';

class DeviceListItemAutomation extends DeviceListItem {
  const DeviceListItemAutomation({
    Key? key,
    required Device device,
  }) : super(key: key, device: device);

  @override
  Widget buildLeading(BuildContext context) {
    final path = AppTheme.of(context).isDark ? "dark/" : "";

    return SvgPicture.asset(
      'assets/images/${path}scenario.svg',
      width: 48,
      height: 48,
    );
  }

  @override
  Widget get trailing => Row(
        children: [
          ListItemActionIcon(
            icon: Icons.play_arrow,
            onTap: (provider) => provider.callService(
              domain: "automation",
              service: "trigger",
              entityId: device.entityId ?? '',
            ),
          ),
        ],
      );
}
