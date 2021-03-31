import 'package:flutter/material.dart';
import 'package:hapoc/core/states/request_state.dart';
import 'package:hapoc/features/config/providers/config_provider.dart';
import 'package:provider/provider.dart';

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
