import 'package:flutter/material.dart';
import 'package:hapoc/dependency_injection.dart';
import 'package:hapoc/features/devices/entities/device.dart';
import 'package:hapoc/features/devices/providers/devices_provider.dart';
import 'package:hapoc/ui/devices/widgets/devices_page.dart';
import 'package:provider/provider.dart';

class DevicesScreen extends StatelessWidget {
  final DevicesProvider deviceProvider = DevicesProvider(getIt());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider.value(value: deviceProvider),
        StreamProvider<List<Device>>(
            initialData: null,
            create: (context) => deviceProvider.messageStream),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text("Device list"),),
        body: DevicesPage(),
      ),
    );
  }
}
