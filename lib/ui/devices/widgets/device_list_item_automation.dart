import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/domain/devices/entities/device.dart';
import 'package:haponk/domain/devices/entities/service_params.dart';
import 'package:haponk/ui/dashboard/widgets/cards/device_card_item.dart';

import 'device_list_item.dart';
import 'list_item_action_icon.dart';

class DeviceListItemAutomation extends DeviceListItem {
  const DeviceListItemAutomation({
    Key? key,
    required ComparableDevice device,
    required ServiceCallback callService,
  }) : super(
          key: key,
          item: device,
          callService: callService,
        );

  @override
  Widget buildLeading(BuildContext context, Device? device) {
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
            onTap: () => callService(
              ServiceParams(
                domain: "automation",
                service: "trigger",
                entityId: item.id,
              ),
            ),
          ),
        ],
      );
}
