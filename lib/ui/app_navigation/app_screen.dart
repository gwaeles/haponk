import 'package:flutter/material.dart';
import 'package:haponk/data/connection/notifiers/connection_notifier.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';
import 'package:haponk/ui/app_navigation/providers/bottom_navigation_bar_controller.dart';
import 'package:haponk/ui/app_navigation/widgets/bottom_navigation_bar_page.dart';
import 'package:haponk/ui/app_navigation/widgets/fake_list_page.dart';
import 'package:haponk/ui/dashboard/dashboard_screen.dart';
import 'package:haponk/ui/devices/devices_page.dart';
import 'package:provider/provider.dart';

class AppNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => DevicesRepository(
            db: context.read(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavigationBarController(0),
        )
      ],
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
                      child: DashboardScreen(),
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
              Consumer<ConnectionNotifier>(
                builder: (context, notifier, _) {
                  return Container(
                    height: 2,
                    color:
                        notifier.isConnected ? Colors.lightGreen : Colors.red,
                  );
                },
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
