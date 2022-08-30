import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/data/tabs/providers/tabs_provider.dart';
import 'package:haponk/data/tabs/entities/flex_tab.dart';
import 'package:provider/provider.dart';

import 'dashboard_providers.dart';
import 'providers/editor_controller.dart';
import 'widgets/tabs/tab_container.dart';
import 'widgets/tabs/tabs_app_bar_title.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DashboardProviders(
      child: Consumer(
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
              TabContainer(
                flexTabItem: item,
              ),
            );
            tabs.add(TabWidget(
              index: i,
              item: item,
            ));
          }

          return TabsWidget(
            tabs: tabs,
            children: children,
          );
        },
      ),
    );
  }
}

class TabsWidget extends StatelessWidget {
  final List<Widget> children;
  final List<Widget> tabs;

  const TabsWidget({
    Key? key,
    required this.tabs,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editorController = context.watch<EditorController>();

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
                  title: TabsAppBarTitle(
                    onPressed: () => editorController.toggle(),
                  ),
                  floating: true,
                  toolbarHeight: 56,
                  // expandedHeight: 150.0,
                  forceElevated: innerBoxIsScrolled,
                  backgroundColor: AppTheme.of(context).inputBackgroungColor,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size(
                      double.infinity,
                      48,
                    ),
                    child: SizedBox(
                      height: 48,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TabBar(
                              isScrollable: true,
                              controller: DefaultTabController.of(context)
                                  as TabController,
                              indicatorColor: Colors.transparent,
                              automaticIndicatorColorAdjustment: false,
                              indicatorWeight: 1.0,
                              labelPadding: EdgeInsets.only(top: 8, bottom: 8),
                              tabs: tabs,
                            ),
                          ),
                          if (editorController.isOn)
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
              ),
            ];
          },
          body: TabBarView(
            children: children,
          ),
        ),
      ),
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
