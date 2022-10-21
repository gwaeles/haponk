import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/data/connection/notifiers/connection_notifier.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:haponk/ui/devices/widgets/list_item_action_icon.dart';
import 'package:provider/provider.dart';

import 'device_card_item.dart';

class DeviceCardItemLight extends DeviceCardItem {
  const DeviceCardItemLight({
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
    final appTheme = AppTheme.of(context);

    return Consumer<ConnectionNotifier>(
      builder: (context, provider, child) {
        return InkWell(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          child: child,
          onTap: () => provider.callService(
            domain: "light",
            service: "toggle",
            entityId: device.id,
          ),
        );
      },
      child: SvgPicture.asset(
        device.state == "on" ? appTheme.assetLightOn : appTheme.assetLightOff,
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
              domain: "light",
              service: "turn_on",
              entityId: device.id,
            ),
          ),
          SizedBox(width: 4),
          ListItemActionIcon(
            icon: Icons.lightbulb_outline,
            onTap: (provider) => provider.callService(
              domain: "light",
              service: "turn_off",
              entityId: device.id,
            ),
          ),
        ],
      );
}
