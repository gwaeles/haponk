import 'package:moor_flutter/moor_flutter.dart';

class FlexCards extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tabId => integer()();
  TextColumn get type => text()();
  IntColumn get stateId => integer().nullable()();
  IntColumn get parentId => integer().nullable()();
  IntColumn get position => integer()();
  IntColumn get horizontalFlex => integer()();
  IntColumn get verticalFlex => integer()();
  IntColumn get width => integer()();
  IntColumn get height => integer()();
}
