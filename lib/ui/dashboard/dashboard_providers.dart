import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as provider;

import 'providers/editor_controller.dart';

class DashboardProviders extends ConsumerWidget {
  final Widget? child;

  const DashboardProviders({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider(
          create: (_) => EditorController(),
        ),
      ],
      child: child,
    );
  }
}
