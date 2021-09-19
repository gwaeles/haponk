import 'package:flutter/material.dart';
import 'package:haponk/data/tabs/entities/flex_tab.dart';
import 'package:haponk/data/tabs/providers/tabs_provider.dart';
import 'package:haponk/data/tabs/repositories/tabs_repository.dart';
import 'package:provider/provider.dart';

import 'providers/editor_controller.dart';

class DashboardProviders extends StatelessWidget {
  final Widget? child;

  const DashboardProviders({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EditorController(),
        ),
        Provider(
          create: (context) => TabsRepository(
            db: context.read(),
          ),
        ),
        Provider(
          create: (context) => TabsProvider(
            context.read(),
          ),
        ),
        StreamProvider<List<FlexTab>>(
          initialData: [],
          create: (context) => context.read<TabsProvider>().tabsStream,
        ),
      ],
      child: child,
    );
  }
}
