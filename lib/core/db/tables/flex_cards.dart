import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('FlexCardDBO')
class FlexCards extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tabId => integer()();
  TextColumn get type => text()();
  IntColumn get stateId => integer().nullable()();
  IntColumn get parentId => integer().nullable()();
  IntColumn get position => integer()();
}
