import 'package:haponk/core/hive/datasources/config_adapter.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String configBoxName = 'configs';
const int configAdapterTypeId = 0;

typedef ConfigBoxCallback = Future<Box<Config>> Function();

Future<Box<Config>> openConfigBox() async {
  if (Hive.isBoxOpen(configBoxName)) {
    return Hive.box(configBoxName);
  }

  Hive.registerAdapter(ConfigAdapter());

  return await Hive.openBox(configBoxName);
}
