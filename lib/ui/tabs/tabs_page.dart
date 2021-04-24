import 'package:flutter/material.dart';
import 'package:haponk/dependency_injection.dart';
import 'package:haponk/features/tabs/providers/tabs_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/tab_list.dart';

class TabsPage extends StatelessWidget {
  final ScrollController controller;

  const TabsPage({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => TabsProvider(getIt())),
        StreamProvider(
            create: (context) => context.read<TabsProvider>().tabsStream)
      ],
      child: CustomScrollView(
        controller: controller,
        slivers: <Widget>[
          TabList(),
        ],
      )
    );
  }
}
