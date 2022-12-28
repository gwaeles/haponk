import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/core/themes/app_theme.dart';

class DevicesAppBar extends StatelessWidget {
  const DevicesAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = AppTheme.of(context).inputBackgroungColor;
    final borderColor = AppTheme.of(context).inputBorderColor;
    final hintColor = AppTheme.of(context).inputHintColor;
    final textColor = AppTheme.of(context).inputTextColor;

    return SliverAppBar(
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      title: TextField(
        decoration: InputDecoration(
          hintText: "Find",
          filled: true,
          fillColor: backgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: borderColor),
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
              color: textColor,
            ),
          ),
        ),
        style: TextStyle(
          color: textColor,
        ),
        cursorColor: hintColor,
        onChanged: (value) {} // => context.read<DevicesBloc>().search(value),
      ),
      floating: true,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }
}
