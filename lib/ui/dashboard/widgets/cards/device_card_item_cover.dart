import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:haponk/ui/devices/widgets/list_item_action_icon.dart';

import 'device_card_item.dart';

class DeviceCardItemCover extends DeviceCardItem {
  const DeviceCardItemCover({
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
    final isOpened = device.currentPosition == null
        ? device.state == "open"
        : device.currentPosition == 100;
    final isClosed = device.currentPosition == null
        ? device.state == "closed"
        : device.currentPosition == 0;

    return SvgPicture.asset(
      isOpened
          ? 'assets/images/${path}cover_open.svg'
          : isClosed
              ? 'assets/images/${path}cover_closed.svg'
              : 'assets/images/${path}cover_half.svg',
      width: 48,
      height: 48,
    );
  }

  @override
  Widget get trailing {
    final isOpened = device.currentPosition == null
        ? device.state == "open"
        : device.currentPosition == 100;
    final isClosed = device.currentPosition == null
        ? device.state == "closed"
        : device.currentPosition == 0;

    return Row(
      children: [
        ListItemActionIcon(
          icon: Icons.arrow_upward,
          onTap: isOpened
              ? null
              : (provider) => provider.callService(
                    domain: "cover",
                    service: "open_cover",
                    entityId: device.id,
                  ),
        ),
        SizedBox(width: 4),
        ListItemActionIcon(
          icon: Icons.stop,
          onTap: (provider) => provider.callService(
            domain: "cover",
            service: "stop_cover",
            entityId: device.id,
          ),
        ),
        SizedBox(width: 4),
        ListItemActionIcon(
          icon: Icons.arrow_downward,
          onTap: isClosed
              ? null
              : (provider) => provider.callService(
                    domain: "cover",
                    service: "close_cover",
                    entityId: device.id,
                  ),
        ),
      ],
    );
  }
}
