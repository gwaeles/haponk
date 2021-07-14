import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haponk/dependency_injection.dart';
import 'package:haponk/data/tabs/entities/flex_tab.dart';
import 'package:haponk/data/tabs/providers/cards_provider.dart';
import 'package:haponk/data/tabs/providers/tabs_provider.dart';
import 'package:haponk/ui/supervisor/bottom_navigation/animated_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

import 'widgets/editor_controller.dart';
import 'widgets/tab_list.dart';
import 'widgets/tabs_app_bar_title.dart';

class TabsPage extends StatelessWidget {
  TabsPage({Key? key}) : super(key: key);

  final currentIndex = ValueNotifier<int>(0);
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext topContext) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EditorController()),
        Provider(create: (_) => TabsProvider(getIt())),
        StreamProvider(
          initialData: [],
          create: (context) => context.read<TabsProvider>().tabsStream,
        )
      ],
      child: Consumer(builder: (context, List<FlexTab> value, child) {
        final List<CardsProvider> cardsProviders = [];
        final List<Widget> children = [];
        final List<Widget> tabs = [];

        for (var i = 0; i < value.length; i++) {
          final FlexTab item = value[i];
          final cardsProvider = CardsProvider(getIt(param1: item.id));
          cardsProviders.add(cardsProvider);
          children
              .add(TabList(flexTabItem: item, cardsProvider: cardsProvider));
          tabs.add(_tabItem(i, item));
        }

        return Material(
          child: DefaultTabController(
            length: tabs.length,
            child: NestedScrollView(
              controller: scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                // These are the slivers that show up in the "outer" scroll view.
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      title: TabsAppBarTitle(),
                      floating: true,
                      // expandedHeight: 150.0,
                      forceElevated: innerBoxIsScrolled,
                      backgroundColor: Colors.transparent,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.transparent),
                      bottom: PreferredSize(
                        preferredSize: Size(double.infinity, 32),
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
                                    context.read<TabsProvider>().createItem()),
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
                    controller: scrollController,
                    child: Container(
                      height: 48,
                      color: Colors.black54,
                      child: Consumer<EditorController>(
                          builder: (context, snapshot, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _bottomBarItem(snapshot, EditorMode.CUSTOM,
                                Icons.palette, "Custom"),
                            _bottomBarItem(snapshot, EditorMode.MOVE,
                                Icons.open_with_rounded, "Move"),
                            _bottomBarItem(snapshot, EditorMode.REMOVE,
                                Icons.delete, "Remove"),
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
      }),
    );
  }

  Widget _bottomBarItem(EditorController controller, EditorMode mode,
      IconData icon, String title) {
    final color =
        controller.editorMode == mode ? Colors.amber.shade800 : Colors.white;
    return InkWell(
      onTap: () => controller.toggleEditorMode(mode),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Text(title, style: TextStyle(fontSize: 12, color: color))
        ],
      ),
    );
  }

  Widget _tabItem(int index, FlexTab item) {
    return Builder(
      builder: (context) {
        return ChangeNotifierProvider.value(
          value: DefaultTabController.of(context),
          child: Consumer(builder: (context, TabController controller, child) {
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
          }),
        );
      },
    );
  }
}
