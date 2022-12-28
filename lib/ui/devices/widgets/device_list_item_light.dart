import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/data/connection/models/constants.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/domain/devices/entities/device.dart';
import 'package:haponk/domain/devices/entities/service_params.dart';
import 'package:haponk/ui/dashboard/widgets/cards/device_card_item.dart';

import 'device_list_item.dart';
import 'list_item_action_icon.dart';

class DeviceListItemLight extends DeviceListItem {
  const DeviceListItemLight({
    Key? key,
    required ComparableDevice device,
    required ServiceCallback callService,
  }) : super(
          key: key,
          item: device,
          callService: callService,
        );

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

    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      child: SvgPicture.asset(
        device?.state == "on"
            ? 'assets/images/${path}light_on.svg'
            : 'assets/images/${path}light_off.svg',
        width: 48,
        height: 48,
      ),
      onTap: () => callService(
        ServiceParams(
          domain: "light",
          service: "toggle",
          entityId: item.id,
        ),
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
            onTap: () => callService(
              ServiceParams(
                domain: "light",
                service: "turn_on",
                brightness: (device?.brightness ?? 235) + 20,
                entityId: item.id,
              ),
            ),
          ),
          SizedBox(width: 4),
          ListItemActionIcon(
            icon: Icons.remove,
            onTap: () => callService(
              ServiceParams(
                domain: "light",
                service: "turn_on",
                brightness: (device?.brightness ?? 20) - 20,
                entityId: item.id,
              ),
            ),
          ),
        ],
      );
    } else {
      children.addAll(
        [
          ListItemActionIcon(
            icon: Icons.lightbulb,
            onTap: () => callService(
              ServiceParams(
                domain: "light",
                service: "turn_on",
                entityId: item.id,
              ),
            ),
          ),
          SizedBox(width: 4),
          ListItemActionIcon(
            icon: Icons.lightbulb_outline,
            onTap: () => callService(
              ServiceParams(
                domain: "light",
                service: "turn_off",
                entityId: item.id,
              ),
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
