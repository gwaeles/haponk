import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haponk/dependency_injection.dart';
import 'package:haponk/features/devices/providers/devices_provider.dart';
import 'package:haponk/ui/devices/widgets/devices_page.dart';
import 'package:provider/provider.dart';

import 'widgets/devices_app_bar.dart';

class DevicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => DevicesProvider(getIt())),
        StreamProvider(create: (context) => context.read<DevicesProvider>().deviceStream)
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              DevicesAppBar(),
              DevicesPage(),
            ],
          ),
        ),
      ),
    );
  }
}
