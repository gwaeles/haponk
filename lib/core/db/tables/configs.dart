import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('ConfigDBO')
class Configs extends Table {
  IntColumn get id => integer()();
  TextColumn get uuid => text().nullable()();
  TextColumn get baseUrl => text().nullable()();
  TextColumn get externalUrl => text().nullable()();
  TextColumn get internalUrl => text().nullable()();
  TextColumn get locationName => text().nullable()();
  TextColumn get installationType => text().nullable()();
  BoolColumn get requiresApiPassword =>
      boolean().withDefault(const Constant(false))();
  TextColumn get version => text().nullable()();
  DateTimeColumn get lastConnection => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
