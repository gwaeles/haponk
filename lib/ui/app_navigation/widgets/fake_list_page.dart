import 'package:flutter/material.dart';
import 'package:haponk/core/themes/app_theme.dart';

class FakeListPage extends StatelessWidget {
  final ScrollController? controller;

  const FakeListPage({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = [];

    for (int i = 1; i < 50; i++) {
      items.add("Fake item $i");
    }

    return CustomScrollView(
      controller: controller,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  if (index == 0) SizedBox(height: 8),
                  if (index != 0)
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Expanded(
                      child: Text(
                        items[index],
                        style: AppTheme.of(context).listItemTitleTextStyle,
                      ),
                    ),
                  ),
                  if (index == (items.length - 1)) SizedBox(height: 16),
                ],
              );
            },
            childCount: items.length,
          ),
        ),
      ],
    );
  }
}
