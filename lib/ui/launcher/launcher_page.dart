import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haponk/ui/launcher/launcher_listeners.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LauncherListeners(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          // Fixing the status bar icon color
          statusBarIconBrightness:
              Theme.of(context).brightness == Brightness.light
                  ? Brightness.dark
                  : Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
          body: Center(
            child: Image.asset(
              "assets/images/ha_splash_logo.png",
              height: 152,
            ),
          ),
        ),
      ),
    );
  }
}
