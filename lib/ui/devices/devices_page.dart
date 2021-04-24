import 'package:flutter/material.dart';
import 'package:haponk/dependency_injection.dart';
import 'package:haponk/features/devices/providers/devices_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/device_list.dart';
import 'widgets/devices_app_bar.dart';

class DevicesPage extends StatelessWidget {
  final ScrollController controller;

  const DevicesPage({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => DevicesProvider(getIt())),
        StreamProvider(
            create: (context) => context.read<DevicesProvider>().deviceStream)
      ],
      child: CustomScrollView(
        controller: controller,
        slivers: <Widget>[
          DevicesAppBar(),
          DeviceList(),
        ],
      )
    );
  }
}
