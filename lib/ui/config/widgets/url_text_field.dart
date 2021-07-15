import 'package:flutter/material.dart';
import 'package:haponk/core/states/request_state.dart';
import 'package:haponk/data/config/providers/config_notifier.dart';
import 'package:provider/provider.dart';

class UrlTextField extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final configNotifier = context.watch<ConfigNotifier>();
    final config = configNotifier.currentConfig;

    final checked = configNotifier.state == RequestState.LOADED;
    final error = configNotifier.state == RequestState.ERROR;
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
      configNotifier.typedUrl = config?.internalUrl;
      textController.text = config?.internalUrl ?? '';
    }

    return TextField(
      decoration: new InputDecoration(
        labelText: "Url",
        suffixIcon: suffixIcon,
      ),
      controller: textController,
      onChanged: (value) => configNotifier.typedUrl = value,
    );
  }
}
