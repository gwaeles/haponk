import 'package:flutter/material.dart';
import 'package:haponk/dependency_injection.dart';
import 'package:haponk/features/devices/providers/devices_provider.dart';
import 'package:haponk/ui/devices/widgets/devices_page.dart';
import 'package:provider/provider.dart';

import 'widgets/animated_bottom_navigation_bar.dart';
import 'widgets/devices_app_bar.dart';

class DevicesScreen extends StatelessWidget {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => DevicesProvider(getIt())),
        StreamProvider(
            create: (context) => context.read<DevicesProvider>().deviceStream)
      ],
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              controller: controller,
              slivers: <Widget>[
                DevicesAppBar(),
                DevicesPage(),
              ],
            ),
            AnimatedBottomNavigationBar(
              controller: controller,
              child: BottomNavigationBar(
                key: GlobalKey(),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.business),
                    label: 'Business',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.school),
                    label: 'School',
                  ),
                ],
                selectedItemColor: Colors.amber[800],
              ),
            )
          ],
        ),
      ),
    );
  }
}