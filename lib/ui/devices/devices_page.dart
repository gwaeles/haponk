import 'package:flutter/material.dart';
import 'package:haponk/data/devices/providers/devices_provider.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:provider/provider.dart';

import 'widgets/device_list.dart';
import 'widgets/devices_app_bar.dart';

class DevicesPage extends StatelessWidget {
  final ScrollController? controller;

  const DevicesPage({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
            create: (context) => DevicesProvider(
              repository: context.read(),
            ),
          ),
          StreamProvider<List<Device>?>(
            initialData: null,
            create: (context) => context.read<DevicesProvider>().deviceStream,
          )
        ],
        child: CustomScrollView(
          controller: controller,
          slivers: <Widget>[
            DevicesAppBar(),
            DeviceList(),
          ],
        ));
  }
}
