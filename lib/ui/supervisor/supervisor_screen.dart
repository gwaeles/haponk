import 'package:flutter/material.dart';
import 'package:haponk/ui/devices/devices_page.dart';
import 'package:haponk/ui/supervisor/bottom_navigation/bottom_navigation_bar_page.dart';
import 'package:haponk/ui/tabs/tabs_page.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation/animated_bottom_navigation_bar.dart';
import 'bottom_navigation/bottom_navigation_bar_controller.dart';

class SupervisorScreen extends StatelessWidget {
  final List<ScrollController> pageScrollControllers = [ScrollController(), ScrollController(), ScrollController()];

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => BottomNavigationBarController(0),
      child: Scaffold(
        body: Consumer(builder: (context, BottomNavigationBarController navController, child) {
          return Stack(
            children: [
              IndexedStack(
                index: navController.value,
                children: [
                  BottomNavigationBarPage(
                    pageIndex: 0,
                    child: DevicesPage(
                      controller: pageScrollControllers[0],
                    ),
                    pageIndexController: navController,
                  ),
                  BottomNavigationBarPage(
                    pageIndex: 1,
                    child: TabsPage(
                      controller: pageScrollControllers[1],
                    ),
                    pageIndexController: navController,
                  ),
                  BottomNavigationBarPage(
                    pageIndex: 2,
                    child: Container(color: Colors.green),
                    pageIndexController: navController,
                  ),
                ],
              ),
              AnimatedBottomNavigationBar(
                controllers: pageScrollControllers,
                currentIndex: navController.value,
                child: BottomNavigationBar(
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
                  currentIndex: navController.value,
                  onTap: (value) => navController.value = value,
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
