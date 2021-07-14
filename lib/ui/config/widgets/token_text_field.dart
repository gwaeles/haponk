import 'package:flutter/material.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/core/states/request_state.dart';
import 'package:haponk/data/config/entities/config_entity.dart';
import 'package:haponk/data/config/providers/config_provider.dart';
import 'package:provider/provider.dart';

class TokenTextField extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final configProvider = context.watch<ConfigProvider>();
    final config = context.watch<ConfigEntity>();
    final connectionType = context.watch<ConnectionType>();

    final checked = configProvider.state == RequestState.LOADED &&
        connectionType != ConnectionType.IDLE;
    final error = configProvider.state == RequestState.LOADED &&
        connectionType == ConnectionType.IDLE;
    final Widget? suffixIcon = checked
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

    if (textController.text.isEmpty) {
      // Init values
      configProvider.typedToken = config.accessToken;
      textController.text = config.accessToken ?? '';
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
