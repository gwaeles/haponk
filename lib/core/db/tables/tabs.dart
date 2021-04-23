import 'package:moor_flutter/moor_flutter.dart';

class Tabs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get label => text()();
  IntColumn get order => integer()();
}