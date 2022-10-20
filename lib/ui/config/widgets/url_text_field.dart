import 'package:flutter/material.dart';

class UrlTextField extends StatefulWidget {
  UrlTextField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.onChanged,
    this.checked = false,
    this.error = false,
    this.value,
  });

  final String label;
  final String? value;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final bool checked;
  final bool error;

  @override
  State<UrlTextField> createState() => _UrlTextFieldState();
}

class _UrlTextFieldState extends State<UrlTextField> {
  late final TextEditingController textController;
  String? initialeValue;

  @override
  void initState() {
    super.initState();

    initialeValue = widget.value;
    textController = TextEditingController.fromValue(
      TextEditingValue(text: initialeValue ?? ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget? suffixIcon = widget.checked
        ? Icon(
            Icons.check_circle,
            color: Colors.green,
          )
        : (widget.error
            ? Icon(
                Icons.error,
                color: Colors.red,
              )
            : null);

    if (initialeValue == null && widget.value != null) {
      initialeValue = widget.value;
      textController.text = widget.value!;
    }

    return TextField(
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: suffixIcon,
      ),
      obscureText: widget.obscureText,
      controller: textController,
      onChanged: widget.onChanged,
    );
  }
}
