// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import 'ui/app_navigation/app_navigation_page.dart' as _i3;
import 'ui/config/config_page.dart' as _i2;
import 'ui/launcher/launcher_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LauncherRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.LauncherPage(),
      );
    },
    ConfigRoute.name: (routeData) {
      final args = routeData.argsAs<ConfigRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.ConfigPage(
          key: args.key,
          configId: args.configId,
        ),
      );
    },
    AppNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<AppNavigationRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.AppNavigationPage(
          key: args.key,
          configId: args.configId,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          LauncherRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          ConfigRoute.name,
          path: '/config-page',
        ),
        _i4.RouteConfig(
          AppNavigationRoute.name,
          path: '/app-navigation-page',
        ),
      ];
}

/// generated route for
/// [_i1.LauncherPage]
class LauncherRoute extends _i4.PageRouteInfo<void> {
  const LauncherRoute()
      : super(
          LauncherRoute.name,
          path: '/',
        );

  static const String name = 'LauncherRoute';
}

/// generated route for
/// [_i2.ConfigPage]
class ConfigRoute extends _i4.PageRouteInfo<ConfigRouteArgs> {
  ConfigRoute({
    _i5.Key? key,
    required int configId,
  }) : super(
          ConfigRoute.name,
          path: '/config-page',
          args: ConfigRouteArgs(
            key: key,
            configId: configId,
          ),
        );

  static const String name = 'ConfigRoute';
}

class ConfigRouteArgs {
  const ConfigRouteArgs({
    this.key,
    required this.configId,
  });

  final _i5.Key? key;

  final int configId;

  @override
  String toString() {
    return 'ConfigRouteArgs{key: $key, configId: $configId}';
  }
}

/// generated route for
/// [_i3.AppNavigationPage]
class AppNavigationRoute extends _i4.PageRouteInfo<AppNavigationRouteArgs> {
  AppNavigationRoute({
    _i5.Key? key,
    required int configId,
  }) : super(
          AppNavigationRoute.name,
          path: '/app-navigation-page',
          args: AppNavigationRouteArgs(
            key: key,
            configId: configId,
          ),
        );

  static const String name = 'AppNavigationRoute';
}

class AppNavigationRouteArgs {
  const AppNavigationRouteArgs({
    this.key,
    required this.configId,
  });

  final _i5.Key? key;

  final int configId;

  @override
  String toString() {
    return 'AppNavigationRouteArgs{key: $key, configId: $configId}';
  }
}
