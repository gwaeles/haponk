import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/ui/app/router/app_router.gr.dart';
import 'package:haponk/ui/app/widgets/app_providers.dart';

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'app_name'.tr(),
        theme: lightTheme,
        darkTheme: darkTheme,
      ),
    );
  }
}
