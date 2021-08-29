import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/data/tabs/providers/cards_provider.dart';
import 'package:haponk/data/tabs/providers/tabs_provider.dart';
import 'package:haponk/data/tabs/repositories/cards_repository.dart';
import 'package:haponk/data/tabs/repositories/tabs_repository.dart';
import 'package:haponk/dependency_injection.dart';
import 'package:haponk/data/tabs/entities/flex_tab.dart';
import 'package:provider/provider.dart';

import 'providers/editor_controller.dart';
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
      child: TabsPageContent(),
    );
  }
}

class TabsPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (
        context,
        List<FlexTab> value,
        child,
      ) {
        final List<Widget> children = [];
        final List<Widget> tabs = [];

        for (var i = 0; i < value.length; i++) {
          final item = value[i];
          children.add(
            TabList(
              flexTabItem: item,
            ),
          );
          tabs.add(TabWidget(
            index: i,
            item: item,
          ));
        }

        return Material(
          color: Colors.transparent,
          child: DefaultTabController(
            length: tabs.length,
            child: NestedScrollView(
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
                      toolbarHeight: 90,
                      // expandedHeight: 150.0,
                      forceElevated: innerBoxIsScrolled,
                      backgroundColor:
                          AppTheme.of(context).inputBackgroungColor,
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
                                controller: DefaultTabController.of(context)
                                    as TabController,
                                indicatorColor: Colors.transparent,
                                automaticIndicatorColorAdjustment: false,
                                indicatorWeight: 1.0,
                                labelPadding: EdgeInsets.zero,
                                tabs: tabs,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () =>
                                  context.read<TabsProvider>().createItem(),
                            ),
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () => context
                                  .read<TabsProvider>()
                                  .deleteItemByIndex(
                                    (DefaultTabController.of(context)
                                            as TabController)
                                        .index,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: children,
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
            padding: EdgeInsets.fromLTRB(12, 3, 12, 1),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Text(
                    item.label ?? '',
                    style: TextStyle(
                      color: selected ? Colors.white : Color(0xff979ba0),
                      fontWeight:
                          selected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                if (selected)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 2,
                      color: Color(0xffdadcdf),
                    ),
                  ),
              ],
            ),
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
