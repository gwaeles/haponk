import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haponk/core/theme/colors.dart';
import 'package:haponk/features/connection/providers/connection_provider.dart';
import 'package:haponk/ui/config/config_screen.dart';
import 'package:haponk/ui/devices/devices_screen.dart';
import 'package:haponk/ui/launcher/launcher_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import 'dependency_injection.dart';

List<Locale> appLocales = [
  const Locale('en'),
  const Locale('fr'),
];

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  declareServices();

  runApp(
    EasyLocalization(
        supportedLocales: appLocales,
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConnectionProvider(getIt()),
      child: MaterialApp(
          title: 'app_name'.tr(),
          theme: ThemeData(
            primaryColor: AppColors.blue,
            scaffoldBackgroundColor: AppColors.white,
            fontFamily: 'Avenir',
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0),
            ),
          ),
          darkTheme: ThemeData(
            primaryColor: AppColors.blue,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.grey.shade900,
            fontFamily: 'Avenir',
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0),
            ),
          ),
          routes: {
            "/launcher": (context) => LauncherScreen(),
            "/config": (context) => ConfigScreen(),
            "/devices": (context) => DevicesScreen(),
          },
          initialRoute: "/launcher",
        ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
