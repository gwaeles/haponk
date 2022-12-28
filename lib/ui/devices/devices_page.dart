import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/domain/config/blocs/config_bloc.dart';
import 'package:provider/provider.dart' as provider;

import 'widgets/device_list.dart';
import 'widgets/devices_app_bar.dart';

class DevicesPage extends ConsumerWidget {
  final ScrollController? controller;

  const DevicesPage({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return provider.MultiProvider(
        providers: [
          BlocProvider<ConfigBloc>(
            lazy: false,
            create: (context) => ref.read(configBlocProvider),
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
