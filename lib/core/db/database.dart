import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

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

class States extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityId => text().nullable()();
  TextColumn get state => text().nullable()();
  DateTimeColumn get lastChanged => dateTime().nullable()();
  DateTimeColumn get lastUpdated => dateTime().nullable()();
  // Attributes
  TextColumn get friendlyName => text().nullable()();
  IntColumn get supportedFeatures => integer().nullable()();

  // COVER
  IntColumn get currentPosition => integer().nullable()();

  // AUTOMATION
  DateTimeColumn get lastTriggered => dateTime().nullable()();
  TextColumn get mode => text().nullable()();

  // WEATHER / SENSOR
  RealColumn get temperature => real().nullable()();
  IntColumn get humidity => integer().nullable()();
  RealColumn get pressure => real().nullable()();
  RealColumn get windBearing => real().nullable()();
  RealColumn get windSpeed => real().nullable()();
  TextColumn get attribution => text().nullable()();

  // SENSOR / BINARY SENSOR
  BoolColumn get isOn => boolean().nullable()();
  TextColumn get deviceClass => text().nullable()();
  TextColumn get unitOfMeasurement => text().nullable()();
  IntColumn get current => integer().nullable()();
  IntColumn get voltage => integer().nullable()();
}

class StateForecast extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get stateId => integer()();
  TextColumn get condition => text().nullable()();
  RealColumn get precipitation => real().nullable()();
  RealColumn get temperature => real().nullable()();
  RealColumn get templow => real().nullable()();
  RealColumn get windBearing => real().nullable()();
  RealColumn get windSpeed => real().nullable()();
  DateTimeColumn get datetime => dateTime().nullable()();
}

@UseMoor(
  tables: [Configs, States],
)
class Database extends _$Database {
  Database()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;

  Future<Config> getConfig() =>
      (select(configs)..where((item) => item.id.equals(1))).getSingle();
  Stream<Config> watchConfig() =>
      (select(configs)..where((item) => item.id.equals(1))).watchSingle();

  Future insertConfig(Config config) =>
      into(configs).insert(config, mode: InsertMode.insertOrReplace);
  Future updateConfig(Config config) => update(configs).replace(config);
  Future updateConfigDate(String uuid) => (update(configs)..where((item) => item.uuid.equals(uuid))).write(ConfigsCompanion(lastConnection: Value(DateTime.now())));
  Future deleteConfig(Config config) => delete(configs).delete(config);

  // STATES
  Future<State> getState(String entityId) =>
      (select(states)..where((item) => item.entityId.equals(entityId))).getSingle();
  Future insertState(StatesCompanion state) =>
      into(states).insert(state, mode: InsertMode.insertOrReplace);
  Future updateState(State state) => update(states).replace(state);

  Stream<List<State>> watchStates() => select(states).watch();
}
