import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hapoc/features/connection/providers/connection_provider.dart';
import 'package:hapoc/ui/config/config_screen.dart';
import 'package:hapoc/ui/devices/devices_screen.dart';
import 'package:hapoc/ui/launcher/launcher_screen.dart';
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
          primarySwatch: Colors.blue,
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
