import 'package:flutter/material.dart';
import 'package:haponk/ui/app_navigation/providers/bottom_navigation_bar_controller.dart';
import 'package:haponk/ui/app_navigation/widgets/bottom_navigation_bar_page.dart';
import 'package:haponk/ui/app_navigation/widgets/fake_list_page.dart';
import 'package:haponk/ui/dashboard/tabs_page.dart';
import 'package:haponk/ui/devices/devices_page.dart';
import 'package:provider/provider.dart';

class AppNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => BottomNavigationBarController(0),
      child: Scaffold(
        body: Consumer(builder: (
          context,
          BottomNavigationBarController navController,
          child,
        ) {
          return Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: navController.value,
                  children: [
                    BottomNavigationBarPage(
                      pageIndex: 0,
                      child: DevicesPage(),
                      pageIndexController: navController,
                    ),
                    BottomNavigationBarPage(
                      pageIndex: 1,
                      child: TabsPage(),
                      pageIndexController: navController,
                    ),
                    BottomNavigationBarPage(
                      pageIndex: 2,
                      child: FakeListPage(),
                      pageIndexController: navController,
                    ),
                    BottomNavigationBarPage(
                      pageIndex: 3,
                      child: FakeListPage(),
                      pageIndexController: navController,
                    ),
                  ],
                ),
              ),
              BottomNavigationBar(
                backgroundColor: Colors.red,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard),
                    label: 'Board',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list_alt),
                    label: 'Events',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.airplay),
                    label: 'Server',
                  ),
                ],
                selectedItemColor: Colors.amber[800],
                currentIndex: navController.value,
                onTap: (value) => navController.value = value,
              ),
            ],
          );
        }),
      ),
    );
  }
}
