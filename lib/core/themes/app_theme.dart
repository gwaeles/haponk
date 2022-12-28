import 'package:flutter/material.dart';
import 'package:haponk/data/connection/models/constants.dart';

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
      : AppColors.inputBackgroungDarkColor;

  Color get inputBorderColor => brightness == Brightness.light
      ? Colors.transparent
      : AppColors.inputBorderDarkColor;

  Color get inputHintColor =>
      brightness == Brightness.light ? AppColors.lightBlue : Colors.white54;

  Color get inputTextColor =>
      brightness == Brightness.light ? Colors.white : Colors.white;

  ///
  /// --- Styles --- ///
  ///

  TextStyle get listItemTitleTextStyle {
    return TextStyle(
      fontSize: 16,
      color: isLight ? AppColors.blue : Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get listItemSubtitleTextStyle {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: isLight ? AppColors.darkGrey : Colors.white54,
    );
  }

  ///
  /// --- Device Icons --- ///
  ///

  String get assetAutomation =>
      'assets/images/${isDark ? "dark/" : ""}scenario.svg';

  String get assetLightOn =>
      'assets/images/${isDark ? "dark/" : ""}light_on.svg';
  String get assetLightOff =>
      'assets/images/${isDark ? "dark/" : ""}light_off.svg';

  String get assetCoverOpened =>
      'assets/images/${isDark ? "dark/" : ""}cover_open.svg';
  String get assetCoverClosed =>
      'assets/images/${isDark ? "dark/" : ""}cover_closed.svg';
  String get assetCoverHalf =>
      'assets/images/${isDark ? "dark/" : ""}cover_half.svg';

  String get assetProcessor =>
      'assets/images/${isDark ? "dark/" : ""}processor.svg';
  String get assetSensor => 'assets/images/${isDark ? "dark/" : ""}sensor.svg';

  String assetNameOf(DeviceType deviceType) {
    switch (deviceType) {
      case DeviceType.AUTOMATION:
        return assetAutomation;
      case DeviceType.LIGHT:
        return assetLightOff;
      case DeviceType.COVER:
        return assetCoverHalf;
      case DeviceType.WEATHER:
        return assetProcessor;
      case DeviceType.BINARY_SENSOR:
        return assetProcessor;
      case DeviceType.SENSOR:
        return assetSensor;
      case DeviceType.SWITCH:
        return assetProcessor;
      case DeviceType.MEDIA_PLAYER:
        return assetProcessor;
      case DeviceType.UNKNOWN:
        return assetProcessor;
    }
  }
}

ThemeData get lightTheme => ThemeData(
      primaryColor: AppColors.blue,
      focusColor: AppColors.blue,
      disabledColor: AppColors.lightBlue,
      scaffoldBackgroundColor: AppColors.white,
      fontFamily: 'Avenir',
    );

ThemeData get darkTheme => ThemeData(
      primaryColor: AppColors.blue,
      focusColor: Colors.white70,
      disabledColor: Colors.white24,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundDarkColor,
      fontFamily: 'Avenir',
    );
