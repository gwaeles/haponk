import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/features/connection/providers/connection_provider.dart';
import 'package:haponk/features/devices/entities/device.dart';
import 'package:provider/provider.dart';

import 'device_list_item.dart';
import 'list_item_action_icon.dart';

class DeviceListItemLight extends DeviceListItem {
  const DeviceListItemLight({Key key, Device device})
      : super(key: key, device: device);

  @override
  Widget buildLeading(BuildContext context) {
    final path = AppTheme.of(context).isDark ? "dark/" : "";

    return Consumer<ConnectionProvider>(
      builder: (context, provider, child) {
        return InkWell(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          child: child,
          onTap: () => provider.callService(
              domain: "light", service: "toggle", entityId: device.entityId),
        );
      },
      child: SvgPicture.asset(
        device.state == "on"
            ? 'assets/images/${path}light_on.svg'
            : 'assets/images/${path}light_off.svg',
        width: 48,
        height: 48,
      ),
    );
  }

  @override
  Widget get trailing => Row(
        children: [
          ListItemActionIcon(
            icon: Icons.lightbulb,
            onTap: (provider) => provider.callService(
                domain: "light", service: "turn_on", entityId: device.entityId),
          ),
          SizedBox(width: 4),
          ListItemActionIcon(
            icon: Icons.lightbulb_outline,
            onTap: (provider) => provider.callService(
                domain: "light",
                service: "turn_off",
                entityId: device.entityId),
          ),
        ],
      );
}
