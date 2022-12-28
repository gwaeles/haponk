import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/core/hive/constants.dart';
import 'package:haponk/data/config/datasources/config_adapter.dart';
import 'package:haponk/domain/config/entities/config.dart';
import 'package:hive_flutter/hive_flutter.dart';

// typedef ConfigBoxCallback = FutureOr<Box<Config>> Function();

///
/// --- Config ---
///

final configBoxProvider = FutureProvider<Box<Config>>(
  (ref) async {
    if (Hive.isBoxOpen(configBoxName)) {
      return Hive.box(configBoxName);
    }

    Hive.registerAdapter(ConfigAdapter());

    return await Hive.openBox(configBoxName);
  },
);
