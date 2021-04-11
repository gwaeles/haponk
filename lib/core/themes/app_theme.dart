import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  final Brightness brightness;

  AppTheme(this.brightness);

  factory AppTheme.of(BuildContext context) {
    return AppTheme(Theme.of(context).brightness);
  }

  bool get isDark => brightness == Brightness.dark;
  bool get isLight => brightness == Brightness.light;

  ///
  /// --- Colors --- ///
  ///

  Color get inputBackgroungColor => brightness == Brightness.light
            ? AppColors.blue
            : AppColors.lightGrey;

  Color get inputHintColor => brightness == Brightness.light
            ? AppColors.lightBlue
            : AppColors.darkGrey;

  Color get inputTextColor => brightness == Brightness.light
            ? Colors.white
            : Colors.grey.shade900;

  ///
  /// --- Styles --- ///
  ///

  TextStyle get listItemTitleTextStyle {
    return TextStyle(
        fontSize: 16,
        color: isLight
            ? AppColors.blue
            : Colors.white,
        fontWeight: FontWeight.bold);
  }

  TextStyle get listItemSubtitleTextStyle {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: isLight
          ? AppColors.darkGrey
          : Colors.white54,
    );
  }
}

ThemeData get lightTheme => ThemeData(
      primaryColor: AppColors.blue,
      focusColor: AppColors.blue,
      disabledColor: AppColors.lightBlue,
      scaffoldBackgroundColor: AppColors.white,
      fontFamily: 'Avenir',
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0),
      ),
    );

ThemeData get darkTheme => ThemeData(
      primaryColor: AppColors.blue,
      focusColor: Colors.white70,
      disabledColor: Colors.white24,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey.shade900,
      fontFamily: 'Avenir',
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0),
      ),
    );
