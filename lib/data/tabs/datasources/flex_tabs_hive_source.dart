import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/core/hive/constants.dart';
import 'package:haponk/data/tabs/datasources/flex_card_adapter.dart';
import 'package:haponk/data/tabs/datasources/flex_tab_adapter.dart';
import 'package:haponk/domain/tabs/entities/flex_card.dart';
import 'package:haponk/domain/tabs/entities/flex_tab.dart';
import 'package:hive_flutter/hive_flutter.dart';

///
/// --- Flex Tabs ---
///

final flexTabListBoxProvider = FutureProvider<Box<FlexTabList>>(
  (ref) async {
    if (Hive.isBoxOpen(flexTabListBoxName)) {
      return Hive.box(flexTabListBoxName);
    }

    Hive.registerAdapter(FlexTabAdapter());

    return await Hive.openBox(flexTabListBoxName);
  },
);

final flexCardListBoxProvider = FutureProvider<Box<FlexCardList>>(
  (ref) async {
    if (Hive.isBoxOpen(flexCardListBoxName)) {
      return Hive.box(flexCardListBoxName);
    }

    Hive.registerAdapter(FlexCardAdapter());

    return await Hive.openBox(flexCardListBoxName);
  },
);
