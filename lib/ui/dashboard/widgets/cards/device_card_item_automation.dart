import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:haponk/ui/devices/widgets/list_item_action_icon.dart';

import 'device_card_item.dart';

class DeviceCardItemAutomation extends DeviceCardItem {
  const DeviceCardItemAutomation({
    Key? key,
    required Device device,
    required FlexCard card,
  }) : super(
          key: key,
          device: device,
          card: card,
        );

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
              entityId: device.id,
            ),
          ),
        ],
      );
}
