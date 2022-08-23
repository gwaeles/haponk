// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ConfigDBO extends DataClass implements Insertable<ConfigDBO> {
  final int id;
  final String? externalUrl;
  final String? internalUrl;
  final String? locationName;
  final String? version;
  final DateTime? lastConnection;
  const ConfigDBO(
      {required this.id,
      this.externalUrl,
      this.internalUrl,
      this.locationName,
      this.version,
      this.lastConnection});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || externalUrl != null) {
      map['external_url'] = Variable<String>(externalUrl);
    }
    if (!nullToAbsent || internalUrl != null) {
      map['internal_url'] = Variable<String>(internalUrl);
    }
    if (!nullToAbsent || locationName != null) {
      map['location_name'] = Variable<String>(locationName);
    }
    if (!nullToAbsent || version != null) {
      map['version'] = Variable<String>(version);
    }
    if (!nullToAbsent || lastConnection != null) {
      map['last_connection'] = Variable<DateTime>(lastConnection);
    }
    return map;
  }

  ConfigsCompanion toCompanion(bool nullToAbsent) {
    return ConfigsCompanion(
      id: Value(id),
      externalUrl: externalUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(externalUrl),
      internalUrl: internalUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(internalUrl),
      locationName: locationName == null && nullToAbsent
          ? const Value.absent()
          : Value(locationName),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
      lastConnection: lastConnection == null && nullToAbsent
          ? const Value.absent()
          : Value(lastConnection),
    );
  }

  factory ConfigDBO.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConfigDBO(
      id: serializer.fromJson<int>(json['id']),
      externalUrl: serializer.fromJson<String?>(json['externalUrl']),
      internalUrl: serializer.fromJson<String?>(json['internalUrl']),
      locationName: serializer.fromJson<String?>(json['locationName']),
      version: serializer.fromJson<String?>(json['version']),
      lastConnection: serializer.fromJson<DateTime?>(json['lastConnection']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'externalUrl': serializer.toJson<String?>(externalUrl),
      'internalUrl': serializer.toJson<String?>(internalUrl),
      'locationName': serializer.toJson<String?>(locationName),
      'version': serializer.toJson<String?>(version),
      'lastConnection': serializer.toJson<DateTime?>(lastConnection),
    };
  }

  ConfigDBO copyWith(
          {int? id,
          Value<String?> externalUrl = const Value.absent(),
          Value<String?> internalUrl = const Value.absent(),
          Value<String?> locationName = const Value.absent(),
          Value<String?> version = const Value.absent(),
          Value<DateTime?> lastConnection = const Value.absent()}) =>
      ConfigDBO(
        id: id ?? this.id,
        externalUrl: externalUrl.present ? externalUrl.value : this.externalUrl,
        internalUrl: internalUrl.present ? internalUrl.value : this.internalUrl,
        locationName:
            locationName.present ? locationName.value : this.locationName,
        version: version.present ? version.value : this.version,
        lastConnection:
            lastConnection.present ? lastConnection.value : this.lastConnection,
      );
  @override
  String toString() {
    return (StringBuffer('ConfigDBO(')
          ..write('id: $id, ')
          ..write('externalUrl: $externalUrl, ')
          ..write('internalUrl: $internalUrl, ')
          ..write('locationName: $locationName, ')
          ..write('version: $version, ')
          ..write('lastConnection: $lastConnection')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, externalUrl, internalUrl, locationName, version, lastConnection);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConfigDBO &&
          other.id == this.id &&
          other.externalUrl == this.externalUrl &&
          other.internalUrl == this.internalUrl &&
          other.locationName == this.locationName &&
          other.version == this.version &&
          other.lastConnection == this.lastConnection);
}

class ConfigsCompanion extends UpdateCompanion<ConfigDBO> {
  final Value<int> id;
  final Value<String?> externalUrl;
  final Value<String?> internalUrl;
  final Value<String?> locationName;
  final Value<String?> version;
  final Value<DateTime?> lastConnection;
  const ConfigsCompanion({
    this.id = const Value.absent(),
    this.externalUrl = const Value.absent(),
    this.internalUrl = const Value.absent(),
    this.locationName = const Value.absent(),
    this.version = const Value.absent(),
    this.lastConnection = const Value.absent(),
  });
  ConfigsCompanion.insert({
    this.id = const Value.absent(),
    this.externalUrl = const Value.absent(),
    this.internalUrl = const Value.absent(),
    this.locationName = const Value.absent(),
    this.version = const Value.absent(),
    this.lastConnection = const Value.absent(),
  });
  static Insertable<ConfigDBO> custom({
    Expression<int>? id,
    Expression<String>? externalUrl,
    Expression<String>? internalUrl,
    Expression<String>? locationName,
    Expression<String>? version,
    Expression<DateTime>? lastConnection,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (externalUrl != null) 'external_url': externalUrl,
      if (internalUrl != null) 'internal_url': internalUrl,
      if (locationName != null) 'location_name': locationName,
      if (version != null) 'version': version,
      if (lastConnection != null) 'last_connection': lastConnection,
    });
  }

  ConfigsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? externalUrl,
      Value<String?>? internalUrl,
      Value<String?>? locationName,
      Value<String?>? version,
      Value<DateTime?>? lastConnection}) {
    return ConfigsCompanion(
      id: id ?? this.id,
      externalUrl: externalUrl ?? this.externalUrl,
      internalUrl: internalUrl ?? this.internalUrl,
      locationName: locationName ?? this.locationName,
      version: version ?? this.version,
      lastConnection: lastConnection ?? this.lastConnection,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (externalUrl.present) {
      map['external_url'] = Variable<String>(externalUrl.value);
    }
    if (internalUrl.present) {
      map['internal_url'] = Variable<String>(internalUrl.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (lastConnection.present) {
      map['last_connection'] = Variable<DateTime>(lastConnection.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConfigsCompanion(')
          ..write('id: $id, ')
          ..write('externalUrl: $externalUrl, ')
          ..write('internalUrl: $internalUrl, ')
          ..write('locationName: $locationName, ')
          ..write('version: $version, ')
          ..write('lastConnection: $lastConnection')
          ..write(')'))
        .toString();
  }
}

class $ConfigsTable extends Configs with TableInfo<$ConfigsTable, ConfigDBO> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConfigsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _externalUrlMeta =
      const VerificationMeta('externalUrl');
  @override
  late final GeneratedColumn<String> externalUrl = GeneratedColumn<String>(
      'external_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _internalUrlMeta =
      const VerificationMeta('internalUrl');
  @override
  late final GeneratedColumn<String> internalUrl = GeneratedColumn<String>(
      'internal_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _locationNameMeta =
      const VerificationMeta('locationName');
  @override
  late final GeneratedColumn<String> locationName = GeneratedColumn<String>(
      'location_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _versionMeta = const VerificationMeta('version');
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
      'version', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _lastConnectionMeta =
      const VerificationMeta('lastConnection');
  @override
  late final GeneratedColumn<DateTime> lastConnection =
      GeneratedColumn<DateTime>('last_connection', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, externalUrl, internalUrl, locationName, version, lastConnection];
  @override
  String get aliasedName => _alias ?? 'configs';
  @override
  String get actualTableName => 'configs';
  @override
  VerificationContext validateIntegrity(Insertable<ConfigDBO> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('external_url')) {
      context.handle(
          _externalUrlMeta,
          externalUrl.isAcceptableOrUnknown(
              data['external_url']!, _externalUrlMeta));
    }
    if (data.containsKey('internal_url')) {
      context.handle(
          _internalUrlMeta,
          internalUrl.isAcceptableOrUnknown(
              data['internal_url']!, _internalUrlMeta));
    }
    if (data.containsKey('location_name')) {
      context.handle(
          _locationNameMeta,
          locationName.isAcceptableOrUnknown(
              data['location_name']!, _locationNameMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('last_connection')) {
      context.handle(
          _lastConnectionMeta,
          lastConnection.isAcceptableOrUnknown(
              data['last_connection']!, _lastConnectionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConfigDBO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConfigDBO(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      externalUrl: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}external_url']),
      internalUrl: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}internal_url']),
      locationName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}location_name']),
      version: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}version']),
      lastConnection: attachedDatabase.options.types.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_connection']),
    );
  }

  @override
  $ConfigsTable createAlias(String alias) {
    return $ConfigsTable(attachedDatabase, alias);
  }
}

class StateDBO extends DataClass implements Insertable<StateDBO> {
  final int id;
  final String? entityId;
  final String? state;
  final DateTime? lastChanged;
  final DateTime? lastUpdated;
  final String? displayLabel;
  final String? displayType;
  final String? friendlyName;
  final int? supportedFeatures;
  final int? currentPosition;
  final DateTime? lastTriggered;
  final String? mode;
  final double? temperature;
  final int? humidity;
  final double? pressure;
  final double? windBearing;
  final double? windSpeed;
  final String? attribution;
  final bool? isOn;
  final String? deviceClass;
  final String? unitOfMeasurement;
  final int? current;
  final int? voltage;
  const StateDBO(
      {required this.id,
      this.entityId,
      this.state,
      this.lastChanged,
      this.lastUpdated,
      this.displayLabel,
      this.displayType,
      this.friendlyName,
      this.supportedFeatures,
      this.currentPosition,
      this.lastTriggered,
      this.mode,
      this.temperature,
      this.humidity,
      this.pressure,
      this.windBearing,
      this.windSpeed,
      this.attribution,
      this.isOn,
      this.deviceClass,
      this.unitOfMeasurement,
      this.current,
      this.voltage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || entityId != null) {
      map['entity_id'] = Variable<String>(entityId);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || lastChanged != null) {
      map['last_changed'] = Variable<DateTime>(lastChanged);
    }
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<DateTime>(lastUpdated);
    }
    if (!nullToAbsent || displayLabel != null) {
      map['display_label'] = Variable<String>(displayLabel);
    }
    if (!nullToAbsent || displayType != null) {
      map['display_type'] = Variable<String>(displayType);
    }
    if (!nullToAbsent || friendlyName != null) {
      map['friendly_name'] = Variable<String>(friendlyName);
    }
    if (!nullToAbsent || supportedFeatures != null) {
      map['supported_features'] = Variable<int>(supportedFeatures);
    }
    if (!nullToAbsent || currentPosition != null) {
      map['current_position'] = Variable<int>(currentPosition);
    }
    if (!nullToAbsent || lastTriggered != null) {
      map['last_triggered'] = Variable<DateTime>(lastTriggered);
    }
    if (!nullToAbsent || mode != null) {
      map['mode'] = Variable<String>(mode);
    }
    if (!nullToAbsent || temperature != null) {
      map['temperature'] = Variable<double>(temperature);
    }
    if (!nullToAbsent || humidity != null) {
      map['humidity'] = Variable<int>(humidity);
    }
    if (!nullToAbsent || pressure != null) {
      map['pressure'] = Variable<double>(pressure);
    }
    if (!nullToAbsent || windBearing != null) {
      map['wind_bearing'] = Variable<double>(windBearing);
    }
    if (!nullToAbsent || windSpeed != null) {
      map['wind_speed'] = Variable<double>(windSpeed);
    }
    if (!nullToAbsent || attribution != null) {
      map['attribution'] = Variable<String>(attribution);
    }
    if (!nullToAbsent || isOn != null) {
      map['is_on'] = Variable<bool>(isOn);
    }
    if (!nullToAbsent || deviceClass != null) {
      map['device_class'] = Variable<String>(deviceClass);
    }
    if (!nullToAbsent || unitOfMeasurement != null) {
      map['unit_of_measurement'] = Variable<String>(unitOfMeasurement);
    }
    if (!nullToAbsent || current != null) {
      map['current'] = Variable<int>(current);
    }
    if (!nullToAbsent || voltage != null) {
      map['voltage'] = Variable<int>(voltage);
    }
    return map;
  }

  StatesCompanion toCompanion(bool nullToAbsent) {
    return StatesCompanion(
      id: Value(id),
      entityId: entityId == null && nullToAbsent
          ? const Value.absent()
          : Value(entityId),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      lastChanged: lastChanged == null && nullToAbsent
          ? const Value.absent()
          : Value(lastChanged),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
      displayLabel: displayLabel == null && nullToAbsent
          ? const Value.absent()
          : Value(displayLabel),
      displayType: displayType == null && nullToAbsent
          ? const Value.absent()
          : Value(displayType),
      friendlyName: friendlyName == null && nullToAbsent
          ? const Value.absent()
          : Value(friendlyName),
      supportedFeatures: supportedFeatures == null && nullToAbsent
          ? const Value.absent()
          : Value(supportedFeatures),
      currentPosition: currentPosition == null && nullToAbsent
          ? const Value.absent()
          : Value(currentPosition),
      lastTriggered: lastTriggered == null && nullToAbsent
          ? const Value.absent()
          : Value(lastTriggered),
      mode: mode == null && nullToAbsent ? const Value.absent() : Value(mode),
      temperature: temperature == null && nullToAbsent
          ? const Value.absent()
          : Value(temperature),
      humidity: humidity == null && nullToAbsent
          ? const Value.absent()
          : Value(humidity),
      pressure: pressure == null && nullToAbsent
          ? const Value.absent()
          : Value(pressure),
      windBearing: windBearing == null && nullToAbsent
          ? const Value.absent()
          : Value(windBearing),
      windSpeed: windSpeed == null && nullToAbsent
          ? const Value.absent()
          : Value(windSpeed),
      attribution: attribution == null && nullToAbsent
          ? const Value.absent()
          : Value(attribution),
      isOn: isOn == null && nullToAbsent ? const Value.absent() : Value(isOn),
      deviceClass: deviceClass == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceClass),
      unitOfMeasurement: unitOfMeasurement == null && nullToAbsent
          ? const Value.absent()
          : Value(unitOfMeasurement),
      current: current == null && nullToAbsent
          ? const Value.absent()
          : Value(current),
      voltage: voltage == null && nullToAbsent
          ? const Value.absent()
          : Value(voltage),
    );
  }

  factory StateDBO.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StateDBO(
      id: serializer.fromJson<int>(json['id']),
      entityId: serializer.fromJson<String?>(json['entityId']),
      state: serializer.fromJson<String?>(json['state']),
      lastChanged: serializer.fromJson<DateTime?>(json['lastChanged']),
      lastUpdated: serializer.fromJson<DateTime?>(json['lastUpdated']),
      displayLabel: serializer.fromJson<String?>(json['displayLabel']),
      displayType: serializer.fromJson<String?>(json['displayType']),
      friendlyName: serializer.fromJson<String?>(json['friendlyName']),
      supportedFeatures: serializer.fromJson<int?>(json['supportedFeatures']),
      currentPosition: serializer.fromJson<int?>(json['currentPosition']),
      lastTriggered: serializer.fromJson<DateTime?>(json['lastTriggered']),
      mode: serializer.fromJson<String?>(json['mode']),
      temperature: serializer.fromJson<double?>(json['temperature']),
      humidity: serializer.fromJson<int?>(json['humidity']),
      pressure: serializer.fromJson<double?>(json['pressure']),
      windBearing: serializer.fromJson<double?>(json['windBearing']),
      windSpeed: serializer.fromJson<double?>(json['windSpeed']),
      attribution: serializer.fromJson<String?>(json['attribution']),
      isOn: serializer.fromJson<bool?>(json['isOn']),
      deviceClass: serializer.fromJson<String?>(json['deviceClass']),
      unitOfMeasurement:
          serializer.fromJson<String?>(json['unitOfMeasurement']),
      current: serializer.fromJson<int?>(json['current']),
      voltage: serializer.fromJson<int?>(json['voltage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityId': serializer.toJson<String?>(entityId),
      'state': serializer.toJson<String?>(state),
      'lastChanged': serializer.toJson<DateTime?>(lastChanged),
      'lastUpdated': serializer.toJson<DateTime?>(lastUpdated),
      'displayLabel': serializer.toJson<String?>(displayLabel),
      'displayType': serializer.toJson<String?>(displayType),
      'friendlyName': serializer.toJson<String?>(friendlyName),
      'supportedFeatures': serializer.toJson<int?>(supportedFeatures),
      'currentPosition': serializer.toJson<int?>(currentPosition),
      'lastTriggered': serializer.toJson<DateTime?>(lastTriggered),
      'mode': serializer.toJson<String?>(mode),
      'temperature': serializer.toJson<double?>(temperature),
      'humidity': serializer.toJson<int?>(humidity),
      'pressure': serializer.toJson<double?>(pressure),
      'windBearing': serializer.toJson<double?>(windBearing),
      'windSpeed': serializer.toJson<double?>(windSpeed),
      'attribution': serializer.toJson<String?>(attribution),
      'isOn': serializer.toJson<bool?>(isOn),
      'deviceClass': serializer.toJson<String?>(deviceClass),
      'unitOfMeasurement': serializer.toJson<String?>(unitOfMeasurement),
      'current': serializer.toJson<int?>(current),
      'voltage': serializer.toJson<int?>(voltage),
    };
  }

  StateDBO copyWith(
          {int? id,
          Value<String?> entityId = const Value.absent(),
          Value<String?> state = const Value.absent(),
          Value<DateTime?> lastChanged = const Value.absent(),
          Value<DateTime?> lastUpdated = const Value.absent(),
          Value<String?> displayLabel = const Value.absent(),
          Value<String?> displayType = const Value.absent(),
          Value<String?> friendlyName = const Value.absent(),
          Value<int?> supportedFeatures = const Value.absent(),
          Value<int?> currentPosition = const Value.absent(),
          Value<DateTime?> lastTriggered = const Value.absent(),
          Value<String?> mode = const Value.absent(),
          Value<double?> temperature = const Value.absent(),
          Value<int?> humidity = const Value.absent(),
          Value<double?> pressure = const Value.absent(),
          Value<double?> windBearing = const Value.absent(),
          Value<double?> windSpeed = const Value.absent(),
          Value<String?> attribution = const Value.absent(),
          Value<bool?> isOn = const Value.absent(),
          Value<String?> deviceClass = const Value.absent(),
          Value<String?> unitOfMeasurement = const Value.absent(),
          Value<int?> current = const Value.absent(),
          Value<int?> voltage = const Value.absent()}) =>
      StateDBO(
        id: id ?? this.id,
        entityId: entityId.present ? entityId.value : this.entityId,
        state: state.present ? state.value : this.state,
        lastChanged: lastChanged.present ? lastChanged.value : this.lastChanged,
        lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
        displayLabel:
            displayLabel.present ? displayLabel.value : this.displayLabel,
        displayType: displayType.present ? displayType.value : this.displayType,
        friendlyName:
            friendlyName.present ? friendlyName.value : this.friendlyName,
        supportedFeatures: supportedFeatures.present
            ? supportedFeatures.value
            : this.supportedFeatures,
        currentPosition: currentPosition.present
            ? currentPosition.value
            : this.currentPosition,
        lastTriggered:
            lastTriggered.present ? lastTriggered.value : this.lastTriggered,
        mode: mode.present ? mode.value : this.mode,
        temperature: temperature.present ? temperature.value : this.temperature,
        humidity: humidity.present ? humidity.value : this.humidity,
        pressure: pressure.present ? pressure.value : this.pressure,
        windBearing: windBearing.present ? windBearing.value : this.windBearing,
        windSpeed: windSpeed.present ? windSpeed.value : this.windSpeed,
        attribution: attribution.present ? attribution.value : this.attribution,
        isOn: isOn.present ? isOn.value : this.isOn,
        deviceClass: deviceClass.present ? deviceClass.value : this.deviceClass,
        unitOfMeasurement: unitOfMeasurement.present
            ? unitOfMeasurement.value
            : this.unitOfMeasurement,
        current: current.present ? current.value : this.current,
        voltage: voltage.present ? voltage.value : this.voltage,
      );
  @override
  String toString() {
    return (StringBuffer('StateDBO(')
          ..write('id: $id, ')
          ..write('entityId: $entityId, ')
          ..write('state: $state, ')
          ..write('lastChanged: $lastChanged, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('displayLabel: $displayLabel, ')
          ..write('displayType: $displayType, ')
          ..write('friendlyName: $friendlyName, ')
          ..write('supportedFeatures: $supportedFeatures, ')
          ..write('currentPosition: $currentPosition, ')
          ..write('lastTriggered: $lastTriggered, ')
          ..write('mode: $mode, ')
          ..write('temperature: $temperature, ')
          ..write('humidity: $humidity, ')
          ..write('pressure: $pressure, ')
          ..write('windBearing: $windBearing, ')
          ..write('windSpeed: $windSpeed, ')
          ..write('attribution: $attribution, ')
          ..write('isOn: $isOn, ')
          ..write('deviceClass: $deviceClass, ')
          ..write('unitOfMeasurement: $unitOfMeasurement, ')
          ..write('current: $current, ')
          ..write('voltage: $voltage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        entityId,
        state,
        lastChanged,
        lastUpdated,
        displayLabel,
        displayType,
        friendlyName,
        supportedFeatures,
        currentPosition,
        lastTriggered,
        mode,
        temperature,
        humidity,
        pressure,
        windBearing,
        windSpeed,
        attribution,
        isOn,
        deviceClass,
        unitOfMeasurement,
        current,
        voltage
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StateDBO &&
          other.id == this.id &&
          other.entityId == this.entityId &&
          other.state == this.state &&
          other.lastChanged == this.lastChanged &&
          other.lastUpdated == this.lastUpdated &&
          other.displayLabel == this.displayLabel &&
          other.displayType == this.displayType &&
          other.friendlyName == this.friendlyName &&
          other.supportedFeatures == this.supportedFeatures &&
          other.currentPosition == this.currentPosition &&
          other.lastTriggered == this.lastTriggered &&
          other.mode == this.mode &&
          other.temperature == this.temperature &&
          other.humidity == this.humidity &&
          other.pressure == this.pressure &&
          other.windBearing == this.windBearing &&
          other.windSpeed == this.windSpeed &&
          other.attribution == this.attribution &&
          other.isOn == this.isOn &&
          other.deviceClass == this.deviceClass &&
          other.unitOfMeasurement == this.unitOfMeasurement &&
          other.current == this.current &&
          other.voltage == this.voltage);
}

class StatesCompanion extends UpdateCompanion<StateDBO> {
  final Value<int> id;
  final Value<String?> entityId;
  final Value<String?> state;
  final Value<DateTime?> lastChanged;
  final Value<DateTime?> lastUpdated;
  final Value<String?> displayLabel;
  final Value<String?> displayType;
  final Value<String?> friendlyName;
  final Value<int?> supportedFeatures;
  final Value<int?> currentPosition;
  final Value<DateTime?> lastTriggered;
  final Value<String?> mode;
  final Value<double?> temperature;
  final Value<int?> humidity;
  final Value<double?> pressure;
  final Value<double?> windBearing;
  final Value<double?> windSpeed;
  final Value<String?> attribution;
  final Value<bool?> isOn;
  final Value<String?> deviceClass;
  final Value<String?> unitOfMeasurement;
  final Value<int?> current;
  final Value<int?> voltage;
  const StatesCompanion({
    this.id = const Value.absent(),
    this.entityId = const Value.absent(),
    this.state = const Value.absent(),
    this.lastChanged = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.displayLabel = const Value.absent(),
    this.displayType = const Value.absent(),
    this.friendlyName = const Value.absent(),
    this.supportedFeatures = const Value.absent(),
    this.currentPosition = const Value.absent(),
    this.lastTriggered = const Value.absent(),
    this.mode = const Value.absent(),
    this.temperature = const Value.absent(),
    this.humidity = const Value.absent(),
    this.pressure = const Value.absent(),
    this.windBearing = const Value.absent(),
    this.windSpeed = const Value.absent(),
    this.attribution = const Value.absent(),
    this.isOn = const Value.absent(),
    this.deviceClass = const Value.absent(),
    this.unitOfMeasurement = const Value.absent(),
    this.current = const Value.absent(),
    this.voltage = const Value.absent(),
  });
  StatesCompanion.insert({
    this.id = const Value.absent(),
    this.entityId = const Value.absent(),
    this.state = const Value.absent(),
    this.lastChanged = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.displayLabel = const Value.absent(),
    this.displayType = const Value.absent(),
    this.friendlyName = const Value.absent(),
    this.supportedFeatures = const Value.absent(),
    this.currentPosition = const Value.absent(),
    this.lastTriggered = const Value.absent(),
    this.mode = const Value.absent(),
    this.temperature = const Value.absent(),
    this.humidity = const Value.absent(),
    this.pressure = const Value.absent(),
    this.windBearing = const Value.absent(),
    this.windSpeed = const Value.absent(),
    this.attribution = const Value.absent(),
    this.isOn = const Value.absent(),
    this.deviceClass = const Value.absent(),
    this.unitOfMeasurement = const Value.absent(),
    this.current = const Value.absent(),
    this.voltage = const Value.absent(),
  });
  static Insertable<StateDBO> custom({
    Expression<int>? id,
    Expression<String>? entityId,
    Expression<String>? state,
    Expression<DateTime>? lastChanged,
    Expression<DateTime>? lastUpdated,
    Expression<String>? displayLabel,
    Expression<String>? displayType,
    Expression<String>? friendlyName,
    Expression<int>? supportedFeatures,
    Expression<int>? currentPosition,
    Expression<DateTime>? lastTriggered,
    Expression<String>? mode,
    Expression<double>? temperature,
    Expression<int>? humidity,
    Expression<double>? pressure,
    Expression<double>? windBearing,
    Expression<double>? windSpeed,
    Expression<String>? attribution,
    Expression<bool>? isOn,
    Expression<String>? deviceClass,
    Expression<String>? unitOfMeasurement,
    Expression<int>? current,
    Expression<int>? voltage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityId != null) 'entity_id': entityId,
      if (state != null) 'state': state,
      if (lastChanged != null) 'last_changed': lastChanged,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (displayLabel != null) 'display_label': displayLabel,
      if (displayType != null) 'display_type': displayType,
      if (friendlyName != null) 'friendly_name': friendlyName,
      if (supportedFeatures != null) 'supported_features': supportedFeatures,
      if (currentPosition != null) 'current_position': currentPosition,
      if (lastTriggered != null) 'last_triggered': lastTriggered,
      if (mode != null) 'mode': mode,
      if (temperature != null) 'temperature': temperature,
      if (humidity != null) 'humidity': humidity,
      if (pressure != null) 'pressure': pressure,
      if (windBearing != null) 'wind_bearing': windBearing,
      if (windSpeed != null) 'wind_speed': windSpeed,
      if (attribution != null) 'attribution': attribution,
      if (isOn != null) 'is_on': isOn,
      if (deviceClass != null) 'device_class': deviceClass,
      if (unitOfMeasurement != null) 'unit_of_measurement': unitOfMeasurement,
      if (current != null) 'current': current,
      if (voltage != null) 'voltage': voltage,
    });
  }

  StatesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? entityId,
      Value<String?>? state,
      Value<DateTime?>? lastChanged,
      Value<DateTime?>? lastUpdated,
      Value<String?>? displayLabel,
      Value<String?>? displayType,
      Value<String?>? friendlyName,
      Value<int?>? supportedFeatures,
      Value<int?>? currentPosition,
      Value<DateTime?>? lastTriggered,
      Value<String?>? mode,
      Value<double?>? temperature,
      Value<int?>? humidity,
      Value<double?>? pressure,
      Value<double?>? windBearing,
      Value<double?>? windSpeed,
      Value<String?>? attribution,
      Value<bool?>? isOn,
      Value<String?>? deviceClass,
      Value<String?>? unitOfMeasurement,
      Value<int?>? current,
      Value<int?>? voltage}) {
    return StatesCompanion(
      id: id ?? this.id,
      entityId: entityId ?? this.entityId,
      state: state ?? this.state,
      lastChanged: lastChanged ?? this.lastChanged,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      displayLabel: displayLabel ?? this.displayLabel,
      displayType: displayType ?? this.displayType,
      friendlyName: friendlyName ?? this.friendlyName,
      supportedFeatures: supportedFeatures ?? this.supportedFeatures,
      currentPosition: currentPosition ?? this.currentPosition,
      lastTriggered: lastTriggered ?? this.lastTriggered,
      mode: mode ?? this.mode,
      temperature: temperature ?? this.temperature,
      humidity: humidity ?? this.humidity,
      pressure: pressure ?? this.pressure,
      windBearing: windBearing ?? this.windBearing,
      windSpeed: windSpeed ?? this.windSpeed,
      attribution: attribution ?? this.attribution,
      isOn: isOn ?? this.isOn,
      deviceClass: deviceClass ?? this.deviceClass,
      unitOfMeasurement: unitOfMeasurement ?? this.unitOfMeasurement,
      current: current ?? this.current,
      voltage: voltage ?? this.voltage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (lastChanged.present) {
      map['last_changed'] = Variable<DateTime>(lastChanged.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (displayLabel.present) {
      map['display_label'] = Variable<String>(displayLabel.value);
    }
    if (displayType.present) {
      map['display_type'] = Variable<String>(displayType.value);
    }
    if (friendlyName.present) {
      map['friendly_name'] = Variable<String>(friendlyName.value);
    }
    if (supportedFeatures.present) {
      map['supported_features'] = Variable<int>(supportedFeatures.value);
    }
    if (currentPosition.present) {
      map['current_position'] = Variable<int>(currentPosition.value);
    }
    if (lastTriggered.present) {
      map['last_triggered'] = Variable<DateTime>(lastTriggered.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<double>(temperature.value);
    }
    if (humidity.present) {
      map['humidity'] = Variable<int>(humidity.value);
    }
    if (pressure.present) {
      map['pressure'] = Variable<double>(pressure.value);
    }
    if (windBearing.present) {
      map['wind_bearing'] = Variable<double>(windBearing.value);
    }
    if (windSpeed.present) {
      map['wind_speed'] = Variable<double>(windSpeed.value);
    }
    if (attribution.present) {
      map['attribution'] = Variable<String>(attribution.value);
    }
    if (isOn.present) {
      map['is_on'] = Variable<bool>(isOn.value);
    }
    if (deviceClass.present) {
      map['device_class'] = Variable<String>(deviceClass.value);
    }
    if (unitOfMeasurement.present) {
      map['unit_of_measurement'] = Variable<String>(unitOfMeasurement.value);
    }
    if (current.present) {
      map['current'] = Variable<int>(current.value);
    }
    if (voltage.present) {
      map['voltage'] = Variable<int>(voltage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatesCompanion(')
          ..write('id: $id, ')
          ..write('entityId: $entityId, ')
          ..write('state: $state, ')
          ..write('lastChanged: $lastChanged, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('displayLabel: $displayLabel, ')
          ..write('displayType: $displayType, ')
          ..write('friendlyName: $friendlyName, ')
          ..write('supportedFeatures: $supportedFeatures, ')
          ..write('currentPosition: $currentPosition, ')
          ..write('lastTriggered: $lastTriggered, ')
          ..write('mode: $mode, ')
          ..write('temperature: $temperature, ')
          ..write('humidity: $humidity, ')
          ..write('pressure: $pressure, ')
          ..write('windBearing: $windBearing, ')
          ..write('windSpeed: $windSpeed, ')
          ..write('attribution: $attribution, ')
          ..write('isOn: $isOn, ')
          ..write('deviceClass: $deviceClass, ')
          ..write('unitOfMeasurement: $unitOfMeasurement, ')
          ..write('current: $current, ')
          ..write('voltage: $voltage')
          ..write(')'))
        .toString();
  }
}

class $StatesTable extends States with TableInfo<$StatesTable, StateDBO> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _entityIdMeta = const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
      'entity_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _lastChangedMeta =
      const VerificationMeta('lastChanged');
  @override
  late final GeneratedColumn<DateTime> lastChanged = GeneratedColumn<DateTime>(
      'last_changed', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  final VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  final VerificationMeta _displayLabelMeta =
      const VerificationMeta('displayLabel');
  @override
  late final GeneratedColumn<String> displayLabel = GeneratedColumn<String>(
      'display_label', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _displayTypeMeta =
      const VerificationMeta('displayType');
  @override
  late final GeneratedColumn<String> displayType = GeneratedColumn<String>(
      'display_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _friendlyNameMeta =
      const VerificationMeta('friendlyName');
  @override
  late final GeneratedColumn<String> friendlyName = GeneratedColumn<String>(
      'friendly_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _supportedFeaturesMeta =
      const VerificationMeta('supportedFeatures');
  @override
  late final GeneratedColumn<int> supportedFeatures = GeneratedColumn<int>(
      'supported_features', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _currentPositionMeta =
      const VerificationMeta('currentPosition');
  @override
  late final GeneratedColumn<int> currentPosition = GeneratedColumn<int>(
      'current_position', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _lastTriggeredMeta =
      const VerificationMeta('lastTriggered');
  @override
  late final GeneratedColumn<DateTime> lastTriggered =
      GeneratedColumn<DateTime>('last_triggered', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  final VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
      'mode', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _temperatureMeta =
      const VerificationMeta('temperature');
  @override
  late final GeneratedColumn<double> temperature = GeneratedColumn<double>(
      'temperature', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  final VerificationMeta _humidityMeta = const VerificationMeta('humidity');
  @override
  late final GeneratedColumn<int> humidity = GeneratedColumn<int>(
      'humidity', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _pressureMeta = const VerificationMeta('pressure');
  @override
  late final GeneratedColumn<double> pressure = GeneratedColumn<double>(
      'pressure', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  final VerificationMeta _windBearingMeta =
      const VerificationMeta('windBearing');
  @override
  late final GeneratedColumn<double> windBearing = GeneratedColumn<double>(
      'wind_bearing', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  final VerificationMeta _windSpeedMeta = const VerificationMeta('windSpeed');
  @override
  late final GeneratedColumn<double> windSpeed = GeneratedColumn<double>(
      'wind_speed', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  final VerificationMeta _attributionMeta =
      const VerificationMeta('attribution');
  @override
  late final GeneratedColumn<String> attribution = GeneratedColumn<String>(
      'attribution', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _isOnMeta = const VerificationMeta('isOn');
  @override
  late final GeneratedColumn<bool> isOn = GeneratedColumn<bool>(
      'is_on', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_on IN (0, 1))');
  final VerificationMeta _deviceClassMeta =
      const VerificationMeta('deviceClass');
  @override
  late final GeneratedColumn<String> deviceClass = GeneratedColumn<String>(
      'device_class', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _unitOfMeasurementMeta =
      const VerificationMeta('unitOfMeasurement');
  @override
  late final GeneratedColumn<String> unitOfMeasurement =
      GeneratedColumn<String>('unit_of_measurement', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _currentMeta = const VerificationMeta('current');
  @override
  late final GeneratedColumn<int> current = GeneratedColumn<int>(
      'current', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _voltageMeta = const VerificationMeta('voltage');
  @override
  late final GeneratedColumn<int> voltage = GeneratedColumn<int>(
      'voltage', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        entityId,
        state,
        lastChanged,
        lastUpdated,
        displayLabel,
        displayType,
        friendlyName,
        supportedFeatures,
        currentPosition,
        lastTriggered,
        mode,
        temperature,
        humidity,
        pressure,
        windBearing,
        windSpeed,
        attribution,
        isOn,
        deviceClass,
        unitOfMeasurement,
        current,
        voltage
      ];
  @override
  String get aliasedName => _alias ?? 'states';
  @override
  String get actualTableName => 'states';
  @override
  VerificationContext validateIntegrity(Insertable<StateDBO> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('last_changed')) {
      context.handle(
          _lastChangedMeta,
          lastChanged.isAcceptableOrUnknown(
              data['last_changed']!, _lastChangedMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    if (data.containsKey('display_label')) {
      context.handle(
          _displayLabelMeta,
          displayLabel.isAcceptableOrUnknown(
              data['display_label']!, _displayLabelMeta));
    }
    if (data.containsKey('display_type')) {
      context.handle(
          _displayTypeMeta,
          displayType.isAcceptableOrUnknown(
              data['display_type']!, _displayTypeMeta));
    }
    if (data.containsKey('friendly_name')) {
      context.handle(
          _friendlyNameMeta,
          friendlyName.isAcceptableOrUnknown(
              data['friendly_name']!, _friendlyNameMeta));
    }
    if (data.containsKey('supported_features')) {
      context.handle(
          _supportedFeaturesMeta,
          supportedFeatures.isAcceptableOrUnknown(
              data['supported_features']!, _supportedFeaturesMeta));
    }
    if (data.containsKey('current_position')) {
      context.handle(
          _currentPositionMeta,
          currentPosition.isAcceptableOrUnknown(
              data['current_position']!, _currentPositionMeta));
    }
    if (data.containsKey('last_triggered')) {
      context.handle(
          _lastTriggeredMeta,
          lastTriggered.isAcceptableOrUnknown(
              data['last_triggered']!, _lastTriggeredMeta));
    }
    if (data.containsKey('mode')) {
      context.handle(
          _modeMeta, mode.isAcceptableOrUnknown(data['mode']!, _modeMeta));
    }
    if (data.containsKey('temperature')) {
      context.handle(
          _temperatureMeta,
          temperature.isAcceptableOrUnknown(
              data['temperature']!, _temperatureMeta));
    }
    if (data.containsKey('humidity')) {
      context.handle(_humidityMeta,
          humidity.isAcceptableOrUnknown(data['humidity']!, _humidityMeta));
    }
    if (data.containsKey('pressure')) {
      context.handle(_pressureMeta,
          pressure.isAcceptableOrUnknown(data['pressure']!, _pressureMeta));
    }
    if (data.containsKey('wind_bearing')) {
      context.handle(
          _windBearingMeta,
          windBearing.isAcceptableOrUnknown(
              data['wind_bearing']!, _windBearingMeta));
    }
    if (data.containsKey('wind_speed')) {
      context.handle(_windSpeedMeta,
          windSpeed.isAcceptableOrUnknown(data['wind_speed']!, _windSpeedMeta));
    }
    if (data.containsKey('attribution')) {
      context.handle(
          _attributionMeta,
          attribution.isAcceptableOrUnknown(
              data['attribution']!, _attributionMeta));
    }
    if (data.containsKey('is_on')) {
      context.handle(
          _isOnMeta, isOn.isAcceptableOrUnknown(data['is_on']!, _isOnMeta));
    }
    if (data.containsKey('device_class')) {
      context.handle(
          _deviceClassMeta,
          deviceClass.isAcceptableOrUnknown(
              data['device_class']!, _deviceClassMeta));
    }
    if (data.containsKey('unit_of_measurement')) {
      context.handle(
          _unitOfMeasurementMeta,
          unitOfMeasurement.isAcceptableOrUnknown(
              data['unit_of_measurement']!, _unitOfMeasurementMeta));
    }
    if (data.containsKey('current')) {
      context.handle(_currentMeta,
          current.isAcceptableOrUnknown(data['current']!, _currentMeta));
    }
    if (data.containsKey('voltage')) {
      context.handle(_voltageMeta,
          voltage.isAcceptableOrUnknown(data['voltage']!, _voltageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StateDBO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StateDBO(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      entityId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}entity_id']),
      state: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}state']),
      lastChanged: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_changed']),
      lastUpdated: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated']),
      displayLabel: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}display_label']),
      displayType: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}display_type']),
      friendlyName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}friendly_name']),
      supportedFeatures: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}supported_features']),
      currentPosition: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}current_position']),
      lastTriggered: attachedDatabase.options.types.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_triggered']),
      mode: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}mode']),
      temperature: attachedDatabase.options.types
          .read(DriftSqlType.double, data['${effectivePrefix}temperature']),
      humidity: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}humidity']),
      pressure: attachedDatabase.options.types
          .read(DriftSqlType.double, data['${effectivePrefix}pressure']),
      windBearing: attachedDatabase.options.types
          .read(DriftSqlType.double, data['${effectivePrefix}wind_bearing']),
      windSpeed: attachedDatabase.options.types
          .read(DriftSqlType.double, data['${effectivePrefix}wind_speed']),
      attribution: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}attribution']),
      isOn: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}is_on']),
      deviceClass: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}device_class']),
      unitOfMeasurement: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}unit_of_measurement']),
      current: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}current']),
      voltage: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}voltage']),
    );
  }

  @override
  $StatesTable createAlias(String alias) {
    return $StatesTable(attachedDatabase, alias);
  }
}

class FlexTabDBO extends DataClass implements Insertable<FlexTabDBO> {
  final int id;
  final String label;
  final int order;
  const FlexTabDBO(
      {required this.id, required this.label, required this.order});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    map['order'] = Variable<int>(order);
    return map;
  }

  FlexTabsCompanion toCompanion(bool nullToAbsent) {
    return FlexTabsCompanion(
      id: Value(id),
      label: Value(label),
      order: Value(order),
    );
  }

  factory FlexTabDBO.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FlexTabDBO(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
      'order': serializer.toJson<int>(order),
    };
  }

  FlexTabDBO copyWith({int? id, String? label, int? order}) => FlexTabDBO(
        id: id ?? this.id,
        label: label ?? this.label,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('FlexTabDBO(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label, order);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FlexTabDBO &&
          other.id == this.id &&
          other.label == this.label &&
          other.order == this.order);
}

class FlexTabsCompanion extends UpdateCompanion<FlexTabDBO> {
  final Value<int> id;
  final Value<String> label;
  final Value<int> order;
  const FlexTabsCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.order = const Value.absent(),
  });
  FlexTabsCompanion.insert({
    this.id = const Value.absent(),
    required String label,
    required int order,
  })  : label = Value(label),
        order = Value(order);
  static Insertable<FlexTabDBO> custom({
    Expression<int>? id,
    Expression<String>? label,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (order != null) 'order': order,
    });
  }

  FlexTabsCompanion copyWith(
      {Value<int>? id, Value<String>? label, Value<int>? order}) {
    return FlexTabsCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlexTabsCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $FlexTabsTable extends FlexTabs
    with TableInfo<$FlexTabsTable, FlexTabDBO> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlexTabsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, label, order];
  @override
  String get aliasedName => _alias ?? 'flex_tabs';
  @override
  String get actualTableName => 'flex_tabs';
  @override
  VerificationContext validateIntegrity(Insertable<FlexTabDBO> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FlexTabDBO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FlexTabDBO(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      label: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      order: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
    );
  }

  @override
  $FlexTabsTable createAlias(String alias) {
    return $FlexTabsTable(attachedDatabase, alias);
  }
}

class FlexCardDBO extends DataClass implements Insertable<FlexCardDBO> {
  final int id;
  final int tabId;
  final String type;
  final int? stateId;
  final int? parentId;
  final int position;
  final int horizontalFlex;
  final int height;
  final int displayLeading;
  final int displayTrailing;
  final int displayTitle;
  final int displaySubtitle;
  const FlexCardDBO(
      {required this.id,
      required this.tabId,
      required this.type,
      this.stateId,
      this.parentId,
      required this.position,
      required this.horizontalFlex,
      required this.height,
      required this.displayLeading,
      required this.displayTrailing,
      required this.displayTitle,
      required this.displaySubtitle});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tab_id'] = Variable<int>(tabId);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || stateId != null) {
      map['state_id'] = Variable<int>(stateId);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    map['position'] = Variable<int>(position);
    map['horizontal_flex'] = Variable<int>(horizontalFlex);
    map['height'] = Variable<int>(height);
    map['display_leading'] = Variable<int>(displayLeading);
    map['display_trailing'] = Variable<int>(displayTrailing);
    map['display_title'] = Variable<int>(displayTitle);
    map['display_subtitle'] = Variable<int>(displaySubtitle);
    return map;
  }

  FlexCardsCompanion toCompanion(bool nullToAbsent) {
    return FlexCardsCompanion(
      id: Value(id),
      tabId: Value(tabId),
      type: Value(type),
      stateId: stateId == null && nullToAbsent
          ? const Value.absent()
          : Value(stateId),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      position: Value(position),
      horizontalFlex: Value(horizontalFlex),
      height: Value(height),
      displayLeading: Value(displayLeading),
      displayTrailing: Value(displayTrailing),
      displayTitle: Value(displayTitle),
      displaySubtitle: Value(displaySubtitle),
    );
  }

  factory FlexCardDBO.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FlexCardDBO(
      id: serializer.fromJson<int>(json['id']),
      tabId: serializer.fromJson<int>(json['tabId']),
      type: serializer.fromJson<String>(json['type']),
      stateId: serializer.fromJson<int?>(json['stateId']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      position: serializer.fromJson<int>(json['position']),
      horizontalFlex: serializer.fromJson<int>(json['horizontalFlex']),
      height: serializer.fromJson<int>(json['height']),
      displayLeading: serializer.fromJson<int>(json['displayLeading']),
      displayTrailing: serializer.fromJson<int>(json['displayTrailing']),
      displayTitle: serializer.fromJson<int>(json['displayTitle']),
      displaySubtitle: serializer.fromJson<int>(json['displaySubtitle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tabId': serializer.toJson<int>(tabId),
      'type': serializer.toJson<String>(type),
      'stateId': serializer.toJson<int?>(stateId),
      'parentId': serializer.toJson<int?>(parentId),
      'position': serializer.toJson<int>(position),
      'horizontalFlex': serializer.toJson<int>(horizontalFlex),
      'height': serializer.toJson<int>(height),
      'displayLeading': serializer.toJson<int>(displayLeading),
      'displayTrailing': serializer.toJson<int>(displayTrailing),
      'displayTitle': serializer.toJson<int>(displayTitle),
      'displaySubtitle': serializer.toJson<int>(displaySubtitle),
    };
  }

  FlexCardDBO copyWith(
          {int? id,
          int? tabId,
          String? type,
          Value<int?> stateId = const Value.absent(),
          Value<int?> parentId = const Value.absent(),
          int? position,
          int? horizontalFlex,
          int? height,
          int? displayLeading,
          int? displayTrailing,
          int? displayTitle,
          int? displaySubtitle}) =>
      FlexCardDBO(
        id: id ?? this.id,
        tabId: tabId ?? this.tabId,
        type: type ?? this.type,
        stateId: stateId.present ? stateId.value : this.stateId,
        parentId: parentId.present ? parentId.value : this.parentId,
        position: position ?? this.position,
        horizontalFlex: horizontalFlex ?? this.horizontalFlex,
        height: height ?? this.height,
        displayLeading: displayLeading ?? this.displayLeading,
        displayTrailing: displayTrailing ?? this.displayTrailing,
        displayTitle: displayTitle ?? this.displayTitle,
        displaySubtitle: displaySubtitle ?? this.displaySubtitle,
      );
  @override
  String toString() {
    return (StringBuffer('FlexCardDBO(')
          ..write('id: $id, ')
          ..write('tabId: $tabId, ')
          ..write('type: $type, ')
          ..write('stateId: $stateId, ')
          ..write('parentId: $parentId, ')
          ..write('position: $position, ')
          ..write('horizontalFlex: $horizontalFlex, ')
          ..write('height: $height, ')
          ..write('displayLeading: $displayLeading, ')
          ..write('displayTrailing: $displayTrailing, ')
          ..write('displayTitle: $displayTitle, ')
          ..write('displaySubtitle: $displaySubtitle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      tabId,
      type,
      stateId,
      parentId,
      position,
      horizontalFlex,
      height,
      displayLeading,
      displayTrailing,
      displayTitle,
      displaySubtitle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FlexCardDBO &&
          other.id == this.id &&
          other.tabId == this.tabId &&
          other.type == this.type &&
          other.stateId == this.stateId &&
          other.parentId == this.parentId &&
          other.position == this.position &&
          other.horizontalFlex == this.horizontalFlex &&
          other.height == this.height &&
          other.displayLeading == this.displayLeading &&
          other.displayTrailing == this.displayTrailing &&
          other.displayTitle == this.displayTitle &&
          other.displaySubtitle == this.displaySubtitle);
}

class FlexCardsCompanion extends UpdateCompanion<FlexCardDBO> {
  final Value<int> id;
  final Value<int> tabId;
  final Value<String> type;
  final Value<int?> stateId;
  final Value<int?> parentId;
  final Value<int> position;
  final Value<int> horizontalFlex;
  final Value<int> height;
  final Value<int> displayLeading;
  final Value<int> displayTrailing;
  final Value<int> displayTitle;
  final Value<int> displaySubtitle;
  const FlexCardsCompanion({
    this.id = const Value.absent(),
    this.tabId = const Value.absent(),
    this.type = const Value.absent(),
    this.stateId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.position = const Value.absent(),
    this.horizontalFlex = const Value.absent(),
    this.height = const Value.absent(),
    this.displayLeading = const Value.absent(),
    this.displayTrailing = const Value.absent(),
    this.displayTitle = const Value.absent(),
    this.displaySubtitle = const Value.absent(),
  });
  FlexCardsCompanion.insert({
    this.id = const Value.absent(),
    required int tabId,
    required String type,
    this.stateId = const Value.absent(),
    this.parentId = const Value.absent(),
    required int position,
    required int horizontalFlex,
    required int height,
    required int displayLeading,
    required int displayTrailing,
    required int displayTitle,
    required int displaySubtitle,
  })  : tabId = Value(tabId),
        type = Value(type),
        position = Value(position),
        horizontalFlex = Value(horizontalFlex),
        height = Value(height),
        displayLeading = Value(displayLeading),
        displayTrailing = Value(displayTrailing),
        displayTitle = Value(displayTitle),
        displaySubtitle = Value(displaySubtitle);
  static Insertable<FlexCardDBO> custom({
    Expression<int>? id,
    Expression<int>? tabId,
    Expression<String>? type,
    Expression<int>? stateId,
    Expression<int>? parentId,
    Expression<int>? position,
    Expression<int>? horizontalFlex,
    Expression<int>? height,
    Expression<int>? displayLeading,
    Expression<int>? displayTrailing,
    Expression<int>? displayTitle,
    Expression<int>? displaySubtitle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tabId != null) 'tab_id': tabId,
      if (type != null) 'type': type,
      if (stateId != null) 'state_id': stateId,
      if (parentId != null) 'parent_id': parentId,
      if (position != null) 'position': position,
      if (horizontalFlex != null) 'horizontal_flex': horizontalFlex,
      if (height != null) 'height': height,
      if (displayLeading != null) 'display_leading': displayLeading,
      if (displayTrailing != null) 'display_trailing': displayTrailing,
      if (displayTitle != null) 'display_title': displayTitle,
      if (displaySubtitle != null) 'display_subtitle': displaySubtitle,
    });
  }

  FlexCardsCompanion copyWith(
      {Value<int>? id,
      Value<int>? tabId,
      Value<String>? type,
      Value<int?>? stateId,
      Value<int?>? parentId,
      Value<int>? position,
      Value<int>? horizontalFlex,
      Value<int>? height,
      Value<int>? displayLeading,
      Value<int>? displayTrailing,
      Value<int>? displayTitle,
      Value<int>? displaySubtitle}) {
    return FlexCardsCompanion(
      id: id ?? this.id,
      tabId: tabId ?? this.tabId,
      type: type ?? this.type,
      stateId: stateId ?? this.stateId,
      parentId: parentId ?? this.parentId,
      position: position ?? this.position,
      horizontalFlex: horizontalFlex ?? this.horizontalFlex,
      height: height ?? this.height,
      displayLeading: displayLeading ?? this.displayLeading,
      displayTrailing: displayTrailing ?? this.displayTrailing,
      displayTitle: displayTitle ?? this.displayTitle,
      displaySubtitle: displaySubtitle ?? this.displaySubtitle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tabId.present) {
      map['tab_id'] = Variable<int>(tabId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (stateId.present) {
      map['state_id'] = Variable<int>(stateId.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (horizontalFlex.present) {
      map['horizontal_flex'] = Variable<int>(horizontalFlex.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (displayLeading.present) {
      map['display_leading'] = Variable<int>(displayLeading.value);
    }
    if (displayTrailing.present) {
      map['display_trailing'] = Variable<int>(displayTrailing.value);
    }
    if (displayTitle.present) {
      map['display_title'] = Variable<int>(displayTitle.value);
    }
    if (displaySubtitle.present) {
      map['display_subtitle'] = Variable<int>(displaySubtitle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlexCardsCompanion(')
          ..write('id: $id, ')
          ..write('tabId: $tabId, ')
          ..write('type: $type, ')
          ..write('stateId: $stateId, ')
          ..write('parentId: $parentId, ')
          ..write('position: $position, ')
          ..write('horizontalFlex: $horizontalFlex, ')
          ..write('height: $height, ')
          ..write('displayLeading: $displayLeading, ')
          ..write('displayTrailing: $displayTrailing, ')
          ..write('displayTitle: $displayTitle, ')
          ..write('displaySubtitle: $displaySubtitle')
          ..write(')'))
        .toString();
  }
}

class $FlexCardsTable extends FlexCards
    with TableInfo<$FlexCardsTable, FlexCardDBO> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlexCardsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _tabIdMeta = const VerificationMeta('tabId');
  @override
  late final GeneratedColumn<int> tabId = GeneratedColumn<int>(
      'tab_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _stateIdMeta = const VerificationMeta('stateId');
  @override
  late final GeneratedColumn<int> stateId = GeneratedColumn<int>(
      'state_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _parentIdMeta = const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _horizontalFlexMeta =
      const VerificationMeta('horizontalFlex');
  @override
  late final GeneratedColumn<int> horizontalFlex = GeneratedColumn<int>(
      'horizontal_flex', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
      'height', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _displayLeadingMeta =
      const VerificationMeta('displayLeading');
  @override
  late final GeneratedColumn<int> displayLeading = GeneratedColumn<int>(
      'display_leading', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _displayTrailingMeta =
      const VerificationMeta('displayTrailing');
  @override
  late final GeneratedColumn<int> displayTrailing = GeneratedColumn<int>(
      'display_trailing', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _displayTitleMeta =
      const VerificationMeta('displayTitle');
  @override
  late final GeneratedColumn<int> displayTitle = GeneratedColumn<int>(
      'display_title', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _displaySubtitleMeta =
      const VerificationMeta('displaySubtitle');
  @override
  late final GeneratedColumn<int> displaySubtitle = GeneratedColumn<int>(
      'display_subtitle', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        tabId,
        type,
        stateId,
        parentId,
        position,
        horizontalFlex,
        height,
        displayLeading,
        displayTrailing,
        displayTitle,
        displaySubtitle
      ];
  @override
  String get aliasedName => _alias ?? 'flex_cards';
  @override
  String get actualTableName => 'flex_cards';
  @override
  VerificationContext validateIntegrity(Insertable<FlexCardDBO> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tab_id')) {
      context.handle(
          _tabIdMeta, tabId.isAcceptableOrUnknown(data['tab_id']!, _tabIdMeta));
    } else if (isInserting) {
      context.missing(_tabIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('state_id')) {
      context.handle(_stateIdMeta,
          stateId.isAcceptableOrUnknown(data['state_id']!, _stateIdMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('horizontal_flex')) {
      context.handle(
          _horizontalFlexMeta,
          horizontalFlex.isAcceptableOrUnknown(
              data['horizontal_flex']!, _horizontalFlexMeta));
    } else if (isInserting) {
      context.missing(_horizontalFlexMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('display_leading')) {
      context.handle(
          _displayLeadingMeta,
          displayLeading.isAcceptableOrUnknown(
              data['display_leading']!, _displayLeadingMeta));
    } else if (isInserting) {
      context.missing(_displayLeadingMeta);
    }
    if (data.containsKey('display_trailing')) {
      context.handle(
          _displayTrailingMeta,
          displayTrailing.isAcceptableOrUnknown(
              data['display_trailing']!, _displayTrailingMeta));
    } else if (isInserting) {
      context.missing(_displayTrailingMeta);
    }
    if (data.containsKey('display_title')) {
      context.handle(
          _displayTitleMeta,
          displayTitle.isAcceptableOrUnknown(
              data['display_title']!, _displayTitleMeta));
    } else if (isInserting) {
      context.missing(_displayTitleMeta);
    }
    if (data.containsKey('display_subtitle')) {
      context.handle(
          _displaySubtitleMeta,
          displaySubtitle.isAcceptableOrUnknown(
              data['display_subtitle']!, _displaySubtitleMeta));
    } else if (isInserting) {
      context.missing(_displaySubtitleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FlexCardDBO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FlexCardDBO(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tabId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}tab_id'])!,
      type: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      stateId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}state_id']),
      parentId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id']),
      position: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      horizontalFlex: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}horizontal_flex'])!,
      height: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}height'])!,
      displayLeading: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}display_leading'])!,
      displayTrailing: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}display_trailing'])!,
      displayTitle: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}display_title'])!,
      displaySubtitle: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}display_subtitle'])!,
    );
  }

  @override
  $FlexCardsTable createAlias(String alias) {
    return $FlexCardsTable(attachedDatabase, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $ConfigsTable configs = $ConfigsTable(this);
  late final $StatesTable states = $StatesTable(this);
  late final $FlexTabsTable flexTabs = $FlexTabsTable(this);
  late final $FlexCardsTable flexCards = $FlexCardsTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [configs, states, flexTabs, flexCards];
}
