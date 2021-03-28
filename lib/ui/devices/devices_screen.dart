import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hapoc/dependency_injection.dart';
import 'package:hapoc/features/config/entities/config_entity.dart';
import 'package:hapoc/features/connection/providers/connection_provider.dart';
import 'package:hapoc/features/devices/entities/device.dart';
import 'package:hapoc/features/devices/providers/devices_provider.dart';
import 'package:hapoc/ui/devices/widgets/devices_page.dart';
import 'package:provider/provider.dart';

class DevicesScreen extends StatelessWidget {
  final DevicesProvider deviceProvider = DevicesProvider(getIt());

  @override
  Widget build(BuildContext context) {
    final ConfigEntity _configArg =
        ModalRoute.of(context).settings.arguments as ConfigEntity;
    final ConnectionProvider connectionProvider =
        context.read<ConnectionProvider>();

    connectionProvider.connect(_configArg);

    return MultiProvider(
      providers: [
        ListenableProvider.value(value: deviceProvider),
        StreamProvider<List<Device>>(
            initialData: null,
            create: (context) => deviceProvider.messageStream),
      ],
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
