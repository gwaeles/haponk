import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hapoc/features/config/providers/config_provider.dart';
import 'package:hapoc/dependency_injection.dart';

class LauncherScreen extends StatelessWidget {
  final ConfigProvider configProvider = ConfigProvider(getIt());

  ///
  /// --- WIDGET --- ///
  ///

  @override
  Widget build(BuildContext context) {
    _loadConfig(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Center(
            child: Container(
          decoration:
              BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.blue.shade100
              ),
          width: 120,
          height: 120,
        )),
      ),
    );
  }

  void _loadConfig(BuildContext context) {
    configProvider.messageStream.first.then((value) {
      if (value?.lastConnection != null) {
        Navigator.of(context)
            .pushReplacementNamed("/devices", arguments: value);
      } else {
        Navigator.of(context)
            .pushReplacementNamed("/config");
      }

      configProvider.dispose();
    });
  }
}
