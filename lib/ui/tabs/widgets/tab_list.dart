import 'package:flutter/material.dart';
import 'package:haponk/features/tabs/entities/flex_tab.dart';
import 'package:provider/provider.dart';

import 'tab_list_item.dart';

class TabList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = context.watch<List<FlexTab>>();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              if (index == 0) SizedBox(height: 8),
              if (index != 0) Divider(
                height: 1,
                color: Colors.grey,
              ),
              TabListItem(item: items[index]),
              if (index == (items.length - 1)) SizedBox(height: 16),
            ],
          );
        },
        childCount: items?.length ?? 0,
      ),
    );
  }
}
