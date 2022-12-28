import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/domain/tabs/controllers/tabs_controller.dart';
import 'package:haponk/domain/tabs/entities/flex_tab.dart';
import 'package:haponk/domain/tabs/states/flex_tabs_state.dart';
import 'package:provider/provider.dart' as provider;

import 'dashboard_providers.dart';
import 'providers/editor_controller.dart';
import 'widgets/tabs/tab_container.dart';
import 'widgets/tabs/tabs_app_bar_title.dart';

class DashboardScreen extends ConsumerWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FlexTabsState state = ref.watch(flexTabsStateProvider);

    final List<Widget> children = [];
    final List<Widget> tabs = [];
    if (state.data != null) {
      for (var i = 0; i < state.data!.length; i++) {
        final item = state.data![i];
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
    }

    return DashboardProviders(
      child: TabsWidget(
        tabs: tabs,
        children: children,
      ),
    );
  }
}

class TabsWidget extends ConsumerWidget {
  final List<Widget> children;
  final List<Widget> tabs;

  const TabsWidget({
    Key? key,
    required this.tabs,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                              onPressed: () => ref
                                  .read(flexTabsControllerProvider)
                                  .createItem(label: 'New tab'),
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
    return provider.ChangeNotifierProvider<TabController>.value(
      value: DefaultTabController.of(context) as TabController,
      child: provider.Consumer(
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
