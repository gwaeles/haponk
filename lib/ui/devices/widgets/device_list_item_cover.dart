import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/domain/devices/entities/device.dart';
import 'package:haponk/domain/devices/entities/service_params.dart';
import 'package:haponk/ui/dashboard/widgets/cards/device_card_item.dart';

import 'device_list_item.dart';
import 'list_item_action_icon.dart';

class DeviceListItemCover extends DeviceListItem {
  const DeviceListItemCover({
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
    final isOpened = device?.currentPosition == null
        ? device?.state == "open"
        : device?.currentPosition == 100;
    final isClosed = device?.currentPosition == null
        ? device?.state == "closed"
        : device?.currentPosition == 0;

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
  Widget? buildTrailing(BuildContext context, Device? device) {
    final isOpened = device?.currentPosition == null
        ? device?.state == "open"
        : device?.currentPosition == 100;
    final isClosed = device?.currentPosition == null
        ? device?.state == "closed"
        : device?.currentPosition == 0;

    return Row(
      children: [
        ListItemActionIcon(
          icon: Icons.arrow_upward,
          onTap: isOpened
              ? null
              : () => callService(
                    ServiceParams(
                      domain: "cover",
                      service: "open_cover",
                      entityId: item.id,
                    ),
                  ),
        ),
        SizedBox(width: 4),
        ListItemActionIcon(
          icon: Icons.stop,
          onTap: () => callService(
            ServiceParams(
              domain: "cover",
              service: "stop_cover",
              entityId: item.id,
            ),
          ),
        ),
        SizedBox(width: 4),
        ListItemActionIcon(
          icon: Icons.arrow_downward,
          onTap: isClosed
              ? null
              : () => callService(
                    ServiceParams(
                      domain: "cover",
                      service: "close_cover",
                      entityId: item.id,
                    ),
                  ),
        ),
      ],
    );
  }
}
