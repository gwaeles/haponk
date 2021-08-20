import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/data/devices/providers/devices_provider.dart';
import 'package:provider/provider.dart';

class TabsAppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = AppTheme.of(context).inputBackgroungColor;
    final hintColor = AppTheme.of(context).inputHintColor;
    final textColor = AppTheme.of(context).inputTextColor;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 12,
            offset: const Offset(3, 5),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Find",
          filled: true,
          fillColor: backgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(width: 0, color: backgroundColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(width: 0, color: backgroundColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(width: 0, color: backgroundColor),
          ),
          hintStyle: TextStyle(color: hintColor),
          isDense: true,
          contentPadding: EdgeInsets.only(
            left: 20,
            top: 11,
            right: 8,
            bottom: 11,
          ),
          suffixIconConstraints: BoxConstraints(maxHeight: 28, maxWidth: 44),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(
              'assets/images/search.svg',
              color: hintColor,
            ),
          ),
        ),
        style: TextStyle(
          color: textColor,
        ),
        cursorColor: hintColor,
        onChanged: (value) => context.read<DevicesProvider>().search(value),
      ),
    );
  }
}
