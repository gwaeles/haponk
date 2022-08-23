import 'package:drift/drift.dart';

@DataClassName('ConfigDBO')
class Configs extends Table {
  IntColumn get id => integer()();
  TextColumn get externalUrl => text().nullable()();
  TextColumn get internalUrl => text().nullable()();
  TextColumn get locationName => text().nullable()();
  TextColumn get version => text().nullable()();
  DateTimeColumn get lastConnection => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
