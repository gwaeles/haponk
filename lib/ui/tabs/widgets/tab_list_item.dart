import 'package:flutter/material.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/features/tabs/entities/flex_tab.dart';

class TabListItem extends StatelessWidget {
  final FlexTab item;

  const TabListItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildChild(context);
  }

  Widget buildChild(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Expanded(
        child: Text(
          item.label,
          style: AppTheme.of(context).listItemTitleTextStyle,
        ),
      ),
    );
  }
}
