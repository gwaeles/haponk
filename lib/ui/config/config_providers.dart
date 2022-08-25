import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/config/blocs/config_bloc.dart';
import 'package:provider/provider.dart';

class ConfigProviders extends StatelessWidget {
  final Widget? child;

  const ConfigProviders({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => ConfigBloc(
            repository: context.read(),
          ),
        ),
      ],
      child: child,
    );
  }
}
