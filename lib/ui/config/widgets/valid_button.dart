import 'package:flutter/material.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/data/config/notifiers/config_notifier.dart';
import 'package:haponk/data/connection/notifiers/connection_notifier.dart';
import 'package:provider/provider.dart';

class ValidButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final connectionType = context.watch<ConnectionType>();

    return connectionType != ConnectionType.IDLE
        ? ElevatedButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed(
                  "/supervisor",
                  arguments: context.read<ConfigNotifier>().currentConfig,
                ),
            child: Text("Go home"))
        : ElevatedButton(
            onPressed: () =>
                context.read<ConfigNotifier>().tryConnect().then((_) {
              if (context.read<ConfigNotifier>().connectionSucceed == true) {
                context.read<ConnectionNotifier>().connect(
                      context.read<ConfigNotifier>().currentConfig!,
                    );
              }
            }),
            child: Text("Test connection"),
          );
  }
}
