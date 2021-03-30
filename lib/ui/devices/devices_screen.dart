import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hapoc/dependency_injection.dart';
import 'package:hapoc/features/devices/providers/devices_provider.dart';
import 'package:hapoc/ui/devices/widgets/devices_page.dart';
import 'package:provider/provider.dart';

class DevicesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return StreamProvider(
      create: (_) => DevicesProvider(getIt()).deviceStream,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Device list"),
            brightness: Brightness.dark,
          ),
          body: DevicesPage(),
        ),
      ),
    );
  }
}
