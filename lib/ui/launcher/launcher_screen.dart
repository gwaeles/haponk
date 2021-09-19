import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haponk/data/config/providers/config_notifier.dart';
import 'package:haponk/data/connection/providers/connection_notifier.dart';
import 'package:provider/provider.dart';

class LauncherScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LauncherScreenState();
}

class LauncherScreenState extends State<LauncherScreen> {
  late ConfigNotifier configNotifier;

  @override
  void initState() {
    super.initState();
    configNotifier = ConfigNotifier(
      repository: context.read(),
    );

// Todo: replace the stream by a future to avoid creation of streamController in repo
    Future.delayed(Duration(milliseconds: 250))
        .then((value) => configNotifier.messageStream.first.then((value) {
              if (value.lastConnection != null) {
                context.read<ConnectionNotifier>().connect(value);

                Navigator.of(context).pushReplacementNamed("/supervisor");
              } else {
                Navigator.of(context).pushReplacementNamed("/config");
              }
            }));
  }

  @override
  void dispose() {
    configNotifier.dispose();
    super.dispose();
  }

  ///
  /// --- WIDGET --- ///
  ///

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
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
            child:
                Image.asset("assets/images/ha_splash_logo.png", height: 152)),
      ),
    );
  }
}
