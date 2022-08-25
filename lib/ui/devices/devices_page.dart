import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/config/blocs/config_bloc.dart';
import 'package:haponk/data/devices/blocs/devices_bloc.dart';
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
          BlocProvider(
            create: (context) => DevicesBloc(
              repository: context.read(),
            ),
          ),
          BlocProvider<ConfigBloc>(
            lazy: false,
            create: (context) => ConfigBloc(
              repository: context.read(),
            ),
          ),
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
