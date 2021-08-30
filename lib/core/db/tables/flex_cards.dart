import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('FlexCardDBO')
class FlexCards extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tabId => integer()();
  TextColumn get type => text()();
  IntColumn get stateId => integer().nullable()();
  IntColumn get parentId => integer().nullable()();
  IntColumn get position => integer()();
  IntColumn get horizontalFlex => integer()();
  IntColumn get height => integer()();
  IntColumn get displayLeading => integer()();
  IntColumn get displayTrailing => integer()();
  IntColumn get displayTitle => integer()();
  IntColumn get displaySubtitle => integer()();
}
