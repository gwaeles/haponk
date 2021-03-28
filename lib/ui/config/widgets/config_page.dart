import 'package:flutter/material.dart';
import 'package:hapoc/core/hass/models/constants.dart';
import 'package:hapoc/core/states/request_state.dart';
import 'package:hapoc/features/config/entities/config_entity.dart';
import 'package:hapoc/features/config/providers/config_provider.dart';
import 'package:hapoc/features/connection/providers/connection_provider.dart';
import 'package:provider/provider.dart';

class ConfigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.grey.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome", style: Theme.of(context).textTheme.headline3),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Type your Home Assistant Server url",
                    style: Theme.of(context).textTheme.subtitle1),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                  child: UrlTextField(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 48),
                  child: TokenTextField(),
                ),
                ValidButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class UrlTextField extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final configProvider = context.watch<ConfigProvider>();
    final config = configProvider.currentConfig;

    final checked = configProvider.state == RequestState.LOADED;
    final error = configProvider.state == RequestState.ERROR;
    final Widget suffixIcon = checked
        ? Icon(
            Icons.check_circle,
            color: Colors.green,
          )
        : (error
            ? Icon(
                Icons.error,
                color: Colors.red,
              )
            : null);

    if (textController.text == null || textController.text.isEmpty) {
      // Init values
      configProvider.typedUrl = config?.internalUrl;
      textController.text = config?.internalUrl;
    }

    return TextField(
      decoration: new InputDecoration(
        labelText: "Url",
        suffixIcon: suffixIcon,
      ),
      controller: textController,
      onChanged: (value) => configProvider.typedUrl = value,
    );
  }
}

class TokenTextField extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final configProvider = context.read<ConfigProvider>();
    final config = context.watch<ConfigEntity>();
    final connectionType = context.watch<ConnectionType>();

    final checked = configProvider.state == RequestState.LOADED && connectionType != ConnectionType.IDLE;
    final error = configProvider.state == RequestState.LOADED && connectionType == ConnectionType.IDLE;
    final Widget suffixIcon = checked
        ? Icon(
            Icons.check_circle,
            color: Colors.green,
          )
        : (error
            ? Icon(
                Icons.error,
                color: Colors.red,
              )
            : null);

    if (textController.text == null || textController.text.isEmpty) {
      // Init values
      configProvider.typedToken = config?.accessToken;
      textController.text = config?.accessToken;
    }

    return TextField(
      decoration: new InputDecoration(
        labelText: "Long lived access token",
        suffixIcon: suffixIcon,
      ),
      obscureText: true,
      controller: textController,
      onChanged: (value) => configProvider.typedToken = value,
    );
  }
}

class ValidButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final configProvider = context.read<ConfigProvider>();
    final connexionProvider = context.read<ConnectionProvider>();
    final connectionType = context.watch<ConnectionType>();

    return connectionType != ConnectionType.IDLE
      ? ElevatedButton(
        onPressed: () => Navigator.of(context)
            .pushReplacementNamed("/devices", arguments: configProvider.currentConfig),
        child: Text("Go home")
      )
      : ElevatedButton(
        onPressed: () => configProvider.tryConnect().then((_) {
          if (configProvider.connectionSucceed) {
            connexionProvider.connect(configProvider.currentConfig);
          }
        }),
        child: Text("Test connection")
      );
  }

}
