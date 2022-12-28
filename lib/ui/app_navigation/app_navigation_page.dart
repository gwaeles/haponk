import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/data/connection/repositories/connection_repository.dart';
import 'package:haponk/domain/config/blocs/config_bloc.dart';
import 'package:haponk/domain/config/states/config_state.dart';
import 'package:haponk/domain/connection/controllers/connection_controller.dart';
import 'package:haponk/domain/connection/entities/constants.dart';
import 'package:haponk/ui/app_navigation/providers/bottom_navigation_bar_controller.dart';
import 'package:haponk/ui/app_navigation/widgets/bottom_navigation_bar_page.dart';
import 'package:haponk/ui/app_navigation/widgets/fake_list_page.dart';
import 'package:haponk/ui/dashboard/dashboard_screen.dart';
import 'package:haponk/ui/devices/devices_page.dart';
import 'package:provider/provider.dart' as provider;

class AppNavigationPage extends ConsumerWidget {
  final int configId;

  const AppNavigationPage({
    super.key,
    required this.configId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return provider.MultiProvider(
        providers: [
          BlocProvider<ConfigBloc>(
            create: (context) => ref.read(configBlocProvider)
              ..add(
                ConfigWatch(key: configId),
              ),
          ),
          provider.ChangeNotifierProvider(
            create: (context) => BottomNavigationBarController(0),
          )
        ],
        child: BlocListener<ConfigBloc, ConfigState>(
          listener: (context, state) {
            if (state.data != null) {
              ref
                  .read(
                    connectionControllerProvider,
                  )
                  .connect(state.data!);
            }
          },
          child: Scaffold(
            body: provider.Consumer(builder: (
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
                          child: DashboardScreen(),
                          pageIndexController: navController,
                        ),
                        BottomNavigationBarPage(
                          pageIndex: 1,
                          child: DevicesPage(),
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
                  ConnexionStatusLine(),
                  BottomNavigationBar(
                    backgroundColor: Colors.red,
                    unselectedItemColor: Colors.grey,
                    showUnselectedLabels: true,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.dashboard),
                        label: 'Board',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: 'Devices',
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
        ));
  }
}

class ConnexionStatusLine extends ConsumerWidget {
  const ConnexionStatusLine({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ConnectionType connectionType = ref.watch<ConnectionType>(
      connectionTypeProvider,
    );

    return Container(
      height: 2,
      color: connectionType != ConnectionType.idle
          ? Colors.lightGreen
          : Colors.red,
    );
  }
}
