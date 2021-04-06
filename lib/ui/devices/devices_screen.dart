import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haponk/dependency_injection.dart';
import 'package:haponk/features/devices/providers/devices_provider.dart';
import 'package:haponk/ui/devices/widgets/devices_page.dart';
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
