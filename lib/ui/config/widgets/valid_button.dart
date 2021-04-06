import 'package:flutter/material.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/features/config/providers/config_provider.dart';
import 'package:haponk/features/connection/providers/connection_provider.dart';
import 'package:provider/provider.dart';

class ValidButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final connectionType = context.watch<ConnectionType>();

    return connectionType != ConnectionType.IDLE
        ? ElevatedButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed(
                "/devices",
                arguments: context.read<ConfigProvider>().currentConfig),
            child: Text("Go home"))
        : ElevatedButton(
            onPressed: () =>
                context.read<ConfigProvider>().tryConnect().then((_) {
                  if (context.read<ConfigProvider>().connectionSucceed) {
                    context
                        .read<ConnectionProvider>()
                        .connect(context.read<ConfigProvider>().currentConfig);
                  }
                }),
            child: Text("Test connection"));
  }
}
