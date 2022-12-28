import 'package:auto_route/annotations.dart';
import 'package:haponk/ui/app_navigation/app_navigation_page.dart';
import 'package:haponk/ui/config/config_page.dart';
import 'package:haponk/ui/launcher/launcher_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LauncherPage, initial: true),
    AutoRoute(page: ConfigPage),
    AutoRoute(page: AppNavigationPage),
  ],
)
class $AppRouter {}
