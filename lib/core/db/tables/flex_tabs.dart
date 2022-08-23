import 'package:drift/drift.dart';

@DataClassName('FlexTabDBO')
class FlexTabs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get label => text()();
  IntColumn get order => integer()();
}
