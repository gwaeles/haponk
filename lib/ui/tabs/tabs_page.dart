import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haponk/data/tabs/providers/cards_provider.dart';
import 'package:haponk/data/tabs/providers/tabs_provider.dart';
import 'package:haponk/data/tabs/repositories/cards_repository.dart';
import 'package:haponk/data/tabs/repositories/tabs_repository.dart';
import 'package:haponk/dependency_injection.dart';
import 'package:haponk/data/tabs/entities/flex_tab.dart';
import 'package:haponk/ui/supervisor/bottom_navigation/animated_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

import 'widgets/editor_controller.dart';
import 'widgets/tab_list.dart';
import 'widgets/tabs_app_bar_title.dart';

class TabsPage extends StatelessWidget {
  TabsPage({Key? key}) : super(key: key);
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext topContext) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EditorController(),
        ),
        Provider<TabsRepository>(
          create: (_) => TabsRepository(getIt()),
        ),
        ProxyProvider<TabsRepository, TabsProvider>(
          create: (context) => TabsProvider(context.read()),
          update: (context, value, previous) {
            return previous!;
          },
        ),
        StreamProvider<List<FlexTab>>(
          initialData: [],
          create: (context) => context.read<TabsProvider>().tabsStream,
        )
      ],
      child: TabsPageContent(
        controller: ScrollController(),
      ),
    );
  }
}

class TabsPageContent extends StatelessWidget {
  final ScrollController controller;

  const TabsPageContent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (
        context,
        List<FlexTab> value,
        child,
      ) {
        final List<CardsProvider> cardsNotifiers = [];
        final List<Widget> children = [];
        final List<Widget> tabs = [];

        for (var i = 0; i < value.length; i++) {
          final item = value[i];
          final cardsNotifier = CardsProvider(
            CardsRepository(
              db: getIt(),
              tabId: item.id ?? 0,
            ),
          );
          cardsNotifiers.add(cardsNotifier);
          children.add(TabList(
            flexTabItem: item,
            cardsNotifier: cardsNotifier,
          ));
          tabs.add(TabWidget(
            index: i,
            item: item,
          ));
        }

        return Material(
          child: DefaultTabController(
            length: tabs.length,
            child: NestedScrollView(
              controller: controller,
              headerSliverBuilder: (
                BuildContext context,
                bool innerBoxIsScrolled,
              ) {
                // These are the slivers that show up in the "outer" scroll view.
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                    sliver: SliverAppBar(
                      title: TabsAppBarTitle(),
                      floating: true,
                      // expandedHeight: 150.0,
                      forceElevated: innerBoxIsScrolled,
                      backgroundColor: Colors.transparent,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent,
                      ),
                      bottom: PreferredSize(
                        preferredSize: Size(
                          double.infinity,
                          32,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TabBar(
                                isScrollable: true,
                                indicatorColor: Colors.transparent,
                                automaticIndicatorColorAdjustment: false,
                                indicatorWeight: 1.0,
                                labelPadding:
                                    EdgeInsets.only(left: 8, right: 8),
                                tabs: tabs,
                                onTap: (value) => debugPrint("GWA $value"),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () =>
                                  context.read<TabsProvider>().createItem(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Stack(
                children: [
                  TabBarView(
                    children: children,
                  ),
                  AnimatedBottomNavigationBar(
                    controller: controller,
                    child: Container(
                      height: 48,
                      color: Colors.black54,
                      child: Consumer<EditorController>(
                          builder: (context, snapshot, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BottomBarItem(
                              controller: snapshot,
                              mode: EditorMode.CUSTOM,
                              icon: Icons.palette,
                              title: "Custom",
                            ),
                            BottomBarItem(
                              controller: snapshot,
                              mode: EditorMode.MOVE,
                              icon: Icons.open_with_rounded,
                              title: "Move",
                            ),
                            BottomBarItem(
                              controller: snapshot,
                              mode: EditorMode.REMOVE,
                              icon: Icons.delete,
                              title: "Remove",
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class TabWidget extends StatelessWidget {
  final int index;
  final FlexTab item;

  final currentIndex = ValueNotifier<int>(0);

  TabWidget({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TabController>.value(
      value: DefaultTabController.of(context) as TabController,
      child: Consumer(
        builder: (
          context,
          TabController controller,
          child,
        ) {
          currentIndex.value = controller.index;
          final selected = index == controller.index;
          return Container(
            margin: EdgeInsets.only(left: index == 0 ? 8 : 0),
            padding: EdgeInsets.fromLTRB(12, 3, 12, 3),
            constraints: BoxConstraints(minWidth: 80),
            decoration: BoxDecoration(
              color: selected ? Colors.purple : Colors.purple.shade300,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(child: Text(item.label ?? '')),
          );
        },
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final EditorController controller;
  final EditorMode mode;
  final IconData icon;
  final String title;

  const BottomBarItem({
    Key? key,
    required this.controller,
    required this.mode,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color =
        controller.editorMode == mode ? Colors.amber.shade800 : Colors.white;
    return InkWell(
      onTap: () => controller.toggleEditorMode(mode),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
