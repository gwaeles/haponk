import 'package:moor_flutter/moor_flutter.dart';

class Cards extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()();
  IntColumn get stateId => integer().nullable()();
  IntColumn get parentId => integer().nullable()();
  IntColumn get horizontalPosition => integer()();
  IntColumn get verticalPosition => integer()();
  IntColumn get horizontalFlex => integer()();
  IntColumn get verticalFlex => integer()();
  IntColumn get width => integer()();
  IntColumn get height => integer()();
}