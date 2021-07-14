import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/data/devices/notifiers/devices_notifier.dart';
import 'package:provider/provider.dart';

class TabsAppBar extends StatelessWidget {
  const TabsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backwardsCompatibility: false,
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      title: _buildTitleRow(context),
      floating: true,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }

  Widget _buildTitleRow(BuildContext context) {
    final backgroundColor = AppTheme.of(context).inputBackgroungColor;
    final hintColor = AppTheme.of(context).inputHintColor;
    final textColor = AppTheme.of(context).inputTextColor;

    return TextField(
      decoration: InputDecoration(
        hintText: "Find",
        filled: true,
        fillColor: backgroundColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(width: 0, color: backgroundColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(width: 0, color: backgroundColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(width: 0, color: backgroundColor)),
        hintStyle: TextStyle(color: hintColor),
        isDense: true,
        contentPadding:
            EdgeInsets.only(left: 20, top: 11, right: 8, bottom: 11),
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
      onChanged: (value) => context.read<DevicesNotifier>().search(value),
    );
  }
}
