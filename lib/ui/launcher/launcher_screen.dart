import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hapoc/features/config/providers/config_provider.dart';
import 'package:hapoc/dependency_injection.dart';
import 'package:hapoc/features/connection/providers/connection_provider.dart';
import 'package:provider/provider.dart';

class LauncherScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LauncherScreenState();
}

class LauncherScreenState extends State<LauncherScreen> {
  ConfigProvider configProvider;

  @override
  void initState() {
    super.initState();
    configProvider = ConfigProvider(getIt());

// Todo: replace the stream by a future to avoid creation of streamController in repo
    Future.delayed(Duration(milliseconds: 250))
        .then((value) => configProvider.messageStream.first.then((value) {
              if (value?.lastConnection != null) {
                final connectionProvider =
                    context.read<ConnectionProvider>();

                connectionProvider.connect(value);

                Navigator.of(context)
                    .pushReplacementNamed("/devices");
              } else {
                Navigator.of(context).pushReplacementNamed("/config");
              }
            }));
  }

  @override
  void dispose() {
    configProvider.dispose();
    super.dispose();
  }

  ///
  /// --- WIDGET --- ///
  ///

  @override
  Widget build(BuildContext context) {
    
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Center(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.blue.shade100),
          width: 120,
          height: 120,
        )),
      ),
    );
  }
}
