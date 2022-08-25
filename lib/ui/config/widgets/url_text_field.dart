import 'package:flutter/material.dart';

class UrlTextField extends StatelessWidget {
  UrlTextField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.onChanged,
    this.checked = false,
    this.error = false,
    String? value,
  }) {
    textController = TextEditingController.fromValue(
      TextEditingValue(text: value ?? ''),
    );
  }

  final String label;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final bool checked;
  final bool error;
  late final textController;

  @override
  Widget build(BuildContext context) {
    // final configNotifier = context.watch<ConfigNotifier>();
    // final config = configNotifier.currentConfig;

    // final checked = configNotifier.state == RequestState.LOADED;
    // final error = configNotifier.state == RequestState.ERROR;
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

    // if (textController.text.isEmpty) {
    //   // Init values
    //   configNotifier.typedUrl = config?.internalUrl;
    //   textController.text = config?.internalUrl ?? '';
    // }

    return TextField(
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
      controller: textController,
      onChanged: onChanged, //(value) => configNotifier.typedUrl = value,
    );
  }
}
