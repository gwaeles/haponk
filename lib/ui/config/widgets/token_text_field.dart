import 'package:flutter/material.dart';
import 'package:haponk/core/states/request_state.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:haponk/data/config/providers/config_notifier.dart';
import 'package:haponk/data/connection/notifiers/connection_notifier.dart';
import 'package:provider/provider.dart';

class TokenTextField extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final configNotifier = context.watch<ConfigNotifier>();
    final config = context.watch<Config?>();
    final connectionNotifier = context.watch<ConnectionNotifier>();

    final checked = configNotifier.state == RequestState.LOADED &&
        connectionNotifier.isConnected;
    final error = configNotifier.state == RequestState.LOADED &&
        connectionNotifier.isNotConnected;
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
      configNotifier.typedToken = config?.accessToken;
      textController.text = config?.accessToken ?? '';
    }

    return TextField(
      decoration: new InputDecoration(
        labelText: "Long lived access token",
        suffixIcon: suffixIcon,
      ),
      obscureText: true,
      controller: textController,
      onChanged: (value) => configNotifier.typedToken = value,
    );
  }
}
