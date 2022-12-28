import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/domain/devices/entities/device.dart';
import 'package:haponk/domain/devices/entities/service_params.dart';
import 'package:haponk/domain/tabs/entities/flex_card.dart';
import 'package:haponk/ui/devices/widgets/list_item_action_icon.dart';

import 'device_card_item.dart';

class DeviceCardItemLight extends DeviceCardItem {
  const DeviceCardItemLight({
    Key? key,
    required Device device,
    required FlexCard card,
    required ServiceCallback callService,
  }) : super(
          key: key,
          device: device,
          card: card,
          callService: callService,
        );

  @override
  Widget buildLeading(BuildContext context) {
    final appTheme = AppTheme.of(context);

    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      child: SvgPicture.asset(
        device.state == "on" ? appTheme.assetLightOn : appTheme.assetLightOff,
        width: 48,
        height: 48,
      ),
      onTap: () => callService(
            ServiceParams(
              domain: "light",
              service: "toggle",
              entityId: device.id,
            ),
          ),
    );
  }

  @override
  Widget get trailing => Row(
        children: [
          ListItemActionIcon(
            icon: Icons.lightbulb,
            onTap: () => callService(
              ServiceParams(
                domain: "light",
                service: "turn_on",
                entityId: device.id,
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
                entityId: device.id,
              ),
            ),
          ),
        ],
      );
}
