import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('StateDBO')
class States extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityId => text().nullable()();
  TextColumn get state => text().nullable()();
  DateTimeColumn get lastChanged => dateTime().nullable()();
  DateTimeColumn get lastUpdated => dateTime().nullable()();
  // Custom
  TextColumn get displayLabel => text().nullable()();
  TextColumn get displayType => text().nullable()();
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
