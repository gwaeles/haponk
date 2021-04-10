import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  final Brightness brightness;

  AppTheme(this.brightness);

  factory AppTheme.of(BuildContext context) {
    return AppTheme(Theme.of(context).brightness);
  }

  TextStyle get listItemTitleTextStyle {
    return TextStyle(
      fontSize: 16,
      color: brightness == Brightness.light ? AppColors.blue : AppColors.lightBlue,
      fontWeight: FontWeight.bold
    );
  }

  TextStyle get listItemSubtitleTextStyle {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: AppColors.darkGrey,
    );
  }
}
