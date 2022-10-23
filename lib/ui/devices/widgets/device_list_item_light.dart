import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/data/connection/notifiers/connection_notifier.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:provider/provider.dart';

import 'device_list_item.dart';
import 'list_item_action_icon.dart';

class DeviceListItemLight extends DeviceListItem {
  const DeviceListItemLight({
    Key? key,
    required ComparableDevice device,
  }) : super(key: key, item: device);

  @override
  String formatStateValue(Device? device) {
    final bool isDimmer = device?.colorMode == ColorMode.brightness;

    if (device?.brightness != null) {
      return device!.brightness.toString();
    }

    return super.formatStateValue(device);
  }

  @override
  Widget buildLeading(BuildContext context, Device? device) {
    final path = AppTheme.of(context).isDark ? "dark/" : "";

    return Consumer<ConnectionNotifier>(
      builder: (context, provider, child) {
        return InkWell(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          child: child,
          onTap: () => provider.callService(
            domain: "light",
            service: "toggle",
            entityId: item.id,
          ),
        );
      },
      child: SvgPicture.asset(
        device?.state == "on" ? 'assets/images/${path}light_on.svg' : 'assets/images/${path}light_off.svg',
        width: 48,
        height: 48,
      ),
    );
  }

  @override
  Widget? buildTrailing(BuildContext context, Device? device) {
    final bool isDimmer = device?.colorMode == ColorMode.brightness;

    final List<Widget> children = [];

    if (isDimmer) {
      children.addAll(
        [
          ListItemActionIcon(
            icon: Icons.add,
            onTap: (provider) => provider.callService(
              domain: "light",
              service: "turn_on",
              brightness: (device?.brightness ?? 235) + 20,
              entityId: item.id,
            ),
          ),
          SizedBox(width: 4),
          ListItemActionIcon(
            icon: Icons.remove,
            onTap: (provider) => provider.callService(
              domain: "light",
              service: "turn_on",
              brightness: (device?.brightness ?? 20) - 20,
              entityId: item.id,
            ),
          ),
        ],
      );
    } else {
      children.addAll(
        [
          ListItemActionIcon(
            icon: Icons.lightbulb,
            onTap: (provider) => provider.callService(
              domain: "light",
              service: "turn_on",
              entityId: item.id,
            ),
          ),
          SizedBox(width: 4),
          ListItemActionIcon(
            icon: Icons.lightbulb_outline,
            onTap: (provider) => provider.callService(
              domain: "light",
              service: "turn_off",
              entityId: item.id,
            ),
          ),
        ],
      );
    }

    return Row(
      children: children,
    );
  }
}
