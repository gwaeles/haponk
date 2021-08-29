import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/data/connection/providers/connection_notifier.dart';
import 'package:haponk/ui/config/config_screen.dart';
import 'package:haponk/ui/launcher/launcher_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:haponk/ui/supervisor/supervisor_screen.dart';
import 'package:provider/provider.dart';

import 'dependency_injection.dart';

List<Locale> appLocales = [
  const Locale('en'),
  const Locale('fr'),
];

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  declareServices();

  // debugPaintSizeEnabled = true;
  // debugPaintLayerBordersEnabled = true;
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
      create: (context) => ConnectionNotifier(getIt()),
      child: MaterialApp(
        title: 'app_name'.tr(),
        theme: lightTheme,
        darkTheme: darkTheme,
        routes: {
          "/launcher": (context) => LauncherScreen(),
          "/config": (context) => ConfigScreen(),
          "/supervisor": (context) => SupervisorScreen(),
        },
        initialRoute: "/launcher",
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
