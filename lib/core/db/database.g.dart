// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Config extends DataClass implements Insertable<Config> {
  final int id;
  final String uuid;
  final String baseUrl;
  final String externalUrl;
  final String internalUrl;
  final String locationName;
  final String installationType;
  final bool requiresApiPassword;
  final String version;
  final DateTime lastConnection;
  Config(
      {@required this.id,
      this.uuid,
      this.baseUrl,
      this.externalUrl,
      this.internalUrl,
      this.locationName,
      this.installationType,
      @required this.requiresApiPassword,
      this.version,
      this.lastConnection});
  factory Config.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Config(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      uuid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uuid']),
      baseUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}base_url']),
      externalUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}external_url']),
      internalUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}internal_url']),
      locationName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location_name']),
      installationType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}installation_type']),
      requiresApiPassword: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}requires_api_password']),
      version:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}version']),
      lastConnection: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_connection']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || uuid != null) {
      map['uuid'] = Variable<String>(uuid);
    }
    if (!nullToAbsent || baseUrl != null) {
      map['base_url'] = Variable<String>(baseUrl);
    }
    if (!nullToAbsent || externalUrl != null) {
      map['external_url'] = Variable<String>(externalUrl);
    }
    if (!nullToAbsent || internalUrl != null) {
      map['internal_url'] = Variable<String>(internalUrl);
    }
    if (!nullToAbsent || locationName != null) {
      map['location_name'] = Variable<String>(locationName);
    }
    if (!nullToAbsent || installationType != null) {
      map['installation_type'] = Variable<String>(installationType);
    }
    if (!nullToAbsent || requiresApiPassword != null) {
      map['requires_api_password'] = Variable<bool>(requiresApiPassword);
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
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      uuid: uuid == null && nullToAbsent ? const Value.absent() : Value(uuid),
      baseUrl: baseUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(baseUrl),
      externalUrl: externalUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(externalUrl),
      internalUrl: internalUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(internalUrl),
      locationName: locationName == null && nullToAbsent
          ? const Value.absent()
          : Value(locationName),
      installationType: installationType == null && nullToAbsent
          ? const Value.absent()
          : Value(installationType),
      requiresApiPassword: requiresApiPassword == null && nullToAbsent
          ? const Value.absent()
          : Value(requiresApiPassword),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
      lastConnection: lastConnection == null && nullToAbsent
          ? const Value.absent()
          : Value(lastConnection),
    );
  }

  factory Config.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Config(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      baseUrl: serializer.fromJson<String>(json['baseUrl']),
      externalUrl: serializer.fromJson<String>(json['externalUrl']),
      internalUrl: serializer.fromJson<String>(json['internalUrl']),
      locationName: serializer.fromJson<String>(json['locationName']),
      installationType: serializer.fromJson<String>(json['installationType']),
      requiresApiPassword:
          serializer.fromJson<bool>(json['requiresApiPassword']),
      version: serializer.fromJson<String>(json['version']),
      lastConnection: serializer.fromJson<DateTime>(json['lastConnection']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'baseUrl': serializer.toJson<String>(baseUrl),
      'externalUrl': serializer.toJson<String>(externalUrl),
      'internalUrl': serializer.toJson<String>(internalUrl),
      'locationName': serializer.toJson<String>(locationName),
      'installationType': serializer.toJson<String>(installationType),
      'requiresApiPassword': serializer.toJson<bool>(requiresApiPassword),
      'version': serializer.toJson<String>(version),
      'lastConnection': serializer.toJson<DateTime>(lastConnection),
    };
  }

  Config copyWith(
          {int id,
          String uuid,
          String baseUrl,
          String externalUrl,
          String internalUrl,
          String locationName,
          String installationType,
          bool requiresApiPassword,
          String version,
          DateTime lastConnection}) =>
      Config(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        baseUrl: baseUrl ?? this.baseUrl,
        externalUrl: externalUrl ?? this.externalUrl,
        internalUrl: internalUrl ?? this.internalUrl,
        locationName: locationName ?? this.locationName,
        installationType: installationType ?? this.installationType,
        requiresApiPassword: requiresApiPassword ?? this.requiresApiPassword,
        version: version ?? this.version,
        lastConnection: lastConnection ?? this.lastConnection,
      );
  @override
  String toString() {
    return (StringBuffer('Config(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('baseUrl: $baseUrl, ')
          ..write('externalUrl: $externalUrl, ')
          ..write('internalUrl: $internalUrl, ')
          ..write('locationName: $locationName, ')
          ..write('installationType: $installationType, ')
          ..write('requiresApiPassword: $requiresApiPassword, ')
          ..write('version: $version, ')
          ..write('lastConnection: $lastConnection')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          uuid.hashCode,
          $mrjc(
              baseUrl.hashCode,
              $mrjc(
                  externalUrl.hashCode,
                  $mrjc(
                      internalUrl.hashCode,
                      $mrjc(
                          locationName.hashCode,
                          $mrjc(
                              installationType.hashCode,
                              $mrjc(
                                  requiresApiPassword.hashCode,
                                  $mrjc(version.hashCode,
                                      lastConnection.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Config &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.baseUrl == this.baseUrl &&
          other.externalUrl == this.externalUrl &&
          other.internalUrl == this.internalUrl &&
          other.locationName == this.locationName &&
          other.installationType == this.installationType &&
          other.requiresApiPassword == this.requiresApiPassword &&
          other.version == this.version &&
          other.lastConnection == this.lastConnection);
}

class ConfigsCompanion extends UpdateCompanion<Config> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> baseUrl;
  final Value<String> externalUrl;
  final Value<String> internalUrl;
  final Value<String> locationName;
  final Value<String> installationType;
  final Value<bool> requiresApiPassword;
  final Value<String> version;
  final Value<DateTime> lastConnection;
  const ConfigsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.baseUrl = const Value.absent(),
    this.externalUrl = const Value.absent(),
    this.internalUrl = const Value.absent(),
    this.locationName = const Value.absent(),
    this.installationType = const Value.absent(),
    this.requiresApiPassword = const Value.absent(),
    this.version = const Value.absent(),
    this.lastConnection = const Value.absent(),
  });
  ConfigsCompanion.insert({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.baseUrl = const Value.absent(),
    this.externalUrl = const Value.absent(),
    this.internalUrl = const Value.absent(),
    this.locationName = const Value.absent(),
    this.installationType = const Value.absent(),
    this.requiresApiPassword = const Value.absent(),
    this.version = const Value.absent(),
    this.lastConnection = const Value.absent(),
  });
  static Insertable<Config> custom({
    Expression<int> id,
    Expression<String> uuid,
    Expression<String> baseUrl,
    Expression<String> externalUrl,
    Expression<String> internalUrl,
    Expression<String> locationName,
    Expression<String> installationType,
    Expression<bool> requiresApiPassword,
    Expression<String> version,
    Expression<DateTime> lastConnection,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (baseUrl != null) 'base_url': baseUrl,
      if (externalUrl != null) 'external_url': externalUrl,
      if (internalUrl != null) 'internal_url': internalUrl,
      if (locationName != null) 'location_name': locationName,
      if (installationType != null) 'installation_type': installationType,
      if (requiresApiPassword != null)
        'requires_api_password': requiresApiPassword,
      if (version != null) 'version': version,
      if (lastConnection != null) 'last_connection': lastConnection,
    });
  }

  ConfigsCompanion copyWith(
      {Value<int> id,
      Value<String> uuid,
      Value<String> baseUrl,
      Value<String> externalUrl,
      Value<String> internalUrl,
      Value<String> locationName,
      Value<String> installationType,
      Value<bool> requiresApiPassword,
      Value<String> version,
      Value<DateTime> lastConnection}) {
    return ConfigsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      baseUrl: baseUrl ?? this.baseUrl,
      externalUrl: externalUrl ?? this.externalUrl,
      internalUrl: internalUrl ?? this.internalUrl,
      locationName: locationName ?? this.locationName,
      installationType: installationType ?? this.installationType,
      requiresApiPassword: requiresApiPassword ?? this.requiresApiPassword,
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
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (baseUrl.present) {
      map['base_url'] = Variable<String>(baseUrl.value);
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
    if (installationType.present) {
      map['installation_type'] = Variable<String>(installationType.value);
    }
    if (requiresApiPassword.present) {
      map['requires_api_password'] = Variable<bool>(requiresApiPassword.value);
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
          ..write('uuid: $uuid, ')
          ..write('baseUrl: $baseUrl, ')
          ..write('externalUrl: $externalUrl, ')
          ..write('internalUrl: $internalUrl, ')
          ..write('locationName: $locationName, ')
          ..write('installationType: $installationType, ')
          ..write('requiresApiPassword: $requiresApiPassword, ')
          ..write('version: $version, ')
          ..write('lastConnection: $lastConnection')
          ..write(')'))
        .toString();
  }
}

class $ConfigsTable extends Configs with TableInfo<$ConfigsTable, Config> {
  final GeneratedDatabase _db;
  final String _alias;
  $ConfigsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  GeneratedTextColumn _uuid;
  @override
  GeneratedTextColumn get uuid => _uuid ??= _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn(
      'uuid',
      $tableName,
      true,
    );
  }

  final VerificationMeta _baseUrlMeta = const VerificationMeta('baseUrl');
  GeneratedTextColumn _baseUrl;
  @override
  GeneratedTextColumn get baseUrl => _baseUrl ??= _constructBaseUrl();
  GeneratedTextColumn _constructBaseUrl() {
    return GeneratedTextColumn(
      'base_url',
      $tableName,
      true,
    );
  }

  final VerificationMeta _externalUrlMeta =
      const VerificationMeta('externalUrl');
  GeneratedTextColumn _externalUrl;
  @override
  GeneratedTextColumn get externalUrl =>
      _externalUrl ??= _constructExternalUrl();
  GeneratedTextColumn _constructExternalUrl() {
    return GeneratedTextColumn(
      'external_url',
      $tableName,
      true,
    );
  }

  final VerificationMeta _internalUrlMeta =
      const VerificationMeta('internalUrl');
  GeneratedTextColumn _internalUrl;
  @override
  GeneratedTextColumn get internalUrl =>
      _internalUrl ??= _constructInternalUrl();
  GeneratedTextColumn _constructInternalUrl() {
    return GeneratedTextColumn(
      'internal_url',
      $tableName,
      true,
    );
  }

  final VerificationMeta _locationNameMeta =
      const VerificationMeta('locationName');
  GeneratedTextColumn _locationName;
  @override
  GeneratedTextColumn get locationName =>
      _locationName ??= _constructLocationName();
  GeneratedTextColumn _constructLocationName() {
    return GeneratedTextColumn(
      'location_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _installationTypeMeta =
      const VerificationMeta('installationType');
  GeneratedTextColumn _installationType;
  @override
  GeneratedTextColumn get installationType =>
      _installationType ??= _constructInstallationType();
  GeneratedTextColumn _constructInstallationType() {
    return GeneratedTextColumn(
      'installation_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _requiresApiPasswordMeta =
      const VerificationMeta('requiresApiPassword');
  GeneratedBoolColumn _requiresApiPassword;
  @override
  GeneratedBoolColumn get requiresApiPassword =>
      _requiresApiPassword ??= _constructRequiresApiPassword();
  GeneratedBoolColumn _constructRequiresApiPassword() {
    return GeneratedBoolColumn('requires_api_password', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _versionMeta = const VerificationMeta('version');
  GeneratedTextColumn _version;
  @override
  GeneratedTextColumn get version => _version ??= _constructVersion();
  GeneratedTextColumn _constructVersion() {
    return GeneratedTextColumn(
      'version',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastConnectionMeta =
      const VerificationMeta('lastConnection');
  GeneratedDateTimeColumn _lastConnection;
  @override
  GeneratedDateTimeColumn get lastConnection =>
      _lastConnection ??= _constructLastConnection();
  GeneratedDateTimeColumn _constructLastConnection() {
    return GeneratedDateTimeColumn(
      'last_connection',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        baseUrl,
        externalUrl,
        internalUrl,
        locationName,
        installationType,
        requiresApiPassword,
        version,
        lastConnection
      ];
  @override
  $ConfigsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'configs';
  @override
  final String actualTableName = 'configs';
  @override
  VerificationContext validateIntegrity(Insertable<Config> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid'], _uuidMeta));
    }
    if (data.containsKey('base_url')) {
      context.handle(_baseUrlMeta,
          baseUrl.isAcceptableOrUnknown(data['base_url'], _baseUrlMeta));
    }
    if (data.containsKey('external_url')) {
      context.handle(
          _externalUrlMeta,
          externalUrl.isAcceptableOrUnknown(
              data['external_url'], _externalUrlMeta));
    }
    if (data.containsKey('internal_url')) {
      context.handle(
          _internalUrlMeta,
          internalUrl.isAcceptableOrUnknown(
              data['internal_url'], _internalUrlMeta));
    }
    if (data.containsKey('location_name')) {
      context.handle(
          _locationNameMeta,
          locationName.isAcceptableOrUnknown(
              data['location_name'], _locationNameMeta));
    }
    if (data.containsKey('installation_type')) {
      context.handle(
          _installationTypeMeta,
          installationType.isAcceptableOrUnknown(
              data['installation_type'], _installationTypeMeta));
    }
    if (data.containsKey('requires_api_password')) {
      context.handle(
          _requiresApiPasswordMeta,
          requiresApiPassword.isAcceptableOrUnknown(
              data['requires_api_password'], _requiresApiPasswordMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version'], _versionMeta));
    }
    if (data.containsKey('last_connection')) {
      context.handle(
          _lastConnectionMeta,
          lastConnection.isAcceptableOrUnknown(
              data['last_connection'], _lastConnectionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Config map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Config.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ConfigsTable createAlias(String alias) {
    return $ConfigsTable(_db, alias);
  }
}

class State extends DataClass implements Insertable<State> {
  final int id;
  final String entityId;
  final String state;
  final DateTime lastChanged;
  final DateTime lastUpdated;
  final String friendlyName;
  final int supportedFeatures;
  final int currentPosition;
  final DateTime lastTriggered;
  final String mode;
  final double temperature;
  final int humidity;
  final double pressure;
  final double windBearing;
  final double windSpeed;
  final String attribution;
  final bool isOn;
  final String deviceClass;
  final String unitOfMeasurement;
  final int current;
  final int voltage;
  State(
      {@required this.id,
      this.entityId,
      this.state,
      this.lastChanged,
      this.lastUpdated,
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
  factory State.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    final boolType = db.typeSystem.forDartType<bool>();
    return State(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      entityId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}entity_id']),
      state:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}state']),
      lastChanged: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_changed']),
      lastUpdated: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_updated']),
      friendlyName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}friendly_name']),
      supportedFeatures: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}supported_features']),
      currentPosition: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}current_position']),
      lastTriggered: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_triggered']),
      mode: stringType.mapFromDatabaseResponse(data['${effectivePrefix}mode']),
      temperature: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}temperature']),
      humidity:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}humidity']),
      pressure: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}pressure']),
      windBearing: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}wind_bearing']),
      windSpeed: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}wind_speed']),
      attribution: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}attribution']),
      isOn: boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_on']),
      deviceClass: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}device_class']),
      unitOfMeasurement: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}unit_of_measurement']),
      current:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}current']),
      voltage:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}voltage']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
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
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
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

  factory State.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return State(
      id: serializer.fromJson<int>(json['id']),
      entityId: serializer.fromJson<String>(json['entityId']),
      state: serializer.fromJson<String>(json['state']),
      lastChanged: serializer.fromJson<DateTime>(json['lastChanged']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
      friendlyName: serializer.fromJson<String>(json['friendlyName']),
      supportedFeatures: serializer.fromJson<int>(json['supportedFeatures']),
      currentPosition: serializer.fromJson<int>(json['currentPosition']),
      lastTriggered: serializer.fromJson<DateTime>(json['lastTriggered']),
      mode: serializer.fromJson<String>(json['mode']),
      temperature: serializer.fromJson<double>(json['temperature']),
      humidity: serializer.fromJson<int>(json['humidity']),
      pressure: serializer.fromJson<double>(json['pressure']),
      windBearing: serializer.fromJson<double>(json['windBearing']),
      windSpeed: serializer.fromJson<double>(json['windSpeed']),
      attribution: serializer.fromJson<String>(json['attribution']),
      isOn: serializer.fromJson<bool>(json['isOn']),
      deviceClass: serializer.fromJson<String>(json['deviceClass']),
      unitOfMeasurement: serializer.fromJson<String>(json['unitOfMeasurement']),
      current: serializer.fromJson<int>(json['current']),
      voltage: serializer.fromJson<int>(json['voltage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityId': serializer.toJson<String>(entityId),
      'state': serializer.toJson<String>(state),
      'lastChanged': serializer.toJson<DateTime>(lastChanged),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
      'friendlyName': serializer.toJson<String>(friendlyName),
      'supportedFeatures': serializer.toJson<int>(supportedFeatures),
      'currentPosition': serializer.toJson<int>(currentPosition),
      'lastTriggered': serializer.toJson<DateTime>(lastTriggered),
      'mode': serializer.toJson<String>(mode),
      'temperature': serializer.toJson<double>(temperature),
      'humidity': serializer.toJson<int>(humidity),
      'pressure': serializer.toJson<double>(pressure),
      'windBearing': serializer.toJson<double>(windBearing),
      'windSpeed': serializer.toJson<double>(windSpeed),
      'attribution': serializer.toJson<String>(attribution),
      'isOn': serializer.toJson<bool>(isOn),
      'deviceClass': serializer.toJson<String>(deviceClass),
      'unitOfMeasurement': serializer.toJson<String>(unitOfMeasurement),
      'current': serializer.toJson<int>(current),
      'voltage': serializer.toJson<int>(voltage),
    };
  }

  State copyWith(
          {int id,
          String entityId,
          String state,
          DateTime lastChanged,
          DateTime lastUpdated,
          String friendlyName,
          int supportedFeatures,
          int currentPosition,
          DateTime lastTriggered,
          String mode,
          double temperature,
          int humidity,
          double pressure,
          double windBearing,
          double windSpeed,
          String attribution,
          bool isOn,
          String deviceClass,
          String unitOfMeasurement,
          int current,
          int voltage}) =>
      State(
        id: id ?? this.id,
        entityId: entityId ?? this.entityId,
        state: state ?? this.state,
        lastChanged: lastChanged ?? this.lastChanged,
        lastUpdated: lastUpdated ?? this.lastUpdated,
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
  @override
  String toString() {
    return (StringBuffer('State(')
          ..write('id: $id, ')
          ..write('entityId: $entityId, ')
          ..write('state: $state, ')
          ..write('lastChanged: $lastChanged, ')
          ..write('lastUpdated: $lastUpdated, ')
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
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          entityId.hashCode,
          $mrjc(
              state.hashCode,
              $mrjc(
                  lastChanged.hashCode,
                  $mrjc(
                      lastUpdated.hashCode,
                      $mrjc(
                          friendlyName.hashCode,
                          $mrjc(
                              supportedFeatures.hashCode,
                              $mrjc(
                                  currentPosition.hashCode,
                                  $mrjc(
                                      lastTriggered.hashCode,
                                      $mrjc(
                                          mode.hashCode,
                                          $mrjc(
                                              temperature.hashCode,
                                              $mrjc(
                                                  humidity.hashCode,
                                                  $mrjc(
                                                      pressure.hashCode,
                                                      $mrjc(
                                                          windBearing.hashCode,
                                                          $mrjc(
                                                              windSpeed
                                                                  .hashCode,
                                                              $mrjc(
                                                                  attribution
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      isOn
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          deviceClass
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              unitOfMeasurement.hashCode,
                                                                              $mrjc(current.hashCode, voltage.hashCode)))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is State &&
          other.id == this.id &&
          other.entityId == this.entityId &&
          other.state == this.state &&
          other.lastChanged == this.lastChanged &&
          other.lastUpdated == this.lastUpdated &&
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

class StatesCompanion extends UpdateCompanion<State> {
  final Value<int> id;
  final Value<String> entityId;
  final Value<String> state;
  final Value<DateTime> lastChanged;
  final Value<DateTime> lastUpdated;
  final Value<String> friendlyName;
  final Value<int> supportedFeatures;
  final Value<int> currentPosition;
  final Value<DateTime> lastTriggered;
  final Value<String> mode;
  final Value<double> temperature;
  final Value<int> humidity;
  final Value<double> pressure;
  final Value<double> windBearing;
  final Value<double> windSpeed;
  final Value<String> attribution;
  final Value<bool> isOn;
  final Value<String> deviceClass;
  final Value<String> unitOfMeasurement;
  final Value<int> current;
  final Value<int> voltage;
  const StatesCompanion({
    this.id = const Value.absent(),
    this.entityId = const Value.absent(),
    this.state = const Value.absent(),
    this.lastChanged = const Value.absent(),
    this.lastUpdated = const Value.absent(),
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
  static Insertable<State> custom({
    Expression<int> id,
    Expression<String> entityId,
    Expression<String> state,
    Expression<DateTime> lastChanged,
    Expression<DateTime> lastUpdated,
    Expression<String> friendlyName,
    Expression<int> supportedFeatures,
    Expression<int> currentPosition,
    Expression<DateTime> lastTriggered,
    Expression<String> mode,
    Expression<double> temperature,
    Expression<int> humidity,
    Expression<double> pressure,
    Expression<double> windBearing,
    Expression<double> windSpeed,
    Expression<String> attribution,
    Expression<bool> isOn,
    Expression<String> deviceClass,
    Expression<String> unitOfMeasurement,
    Expression<int> current,
    Expression<int> voltage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityId != null) 'entity_id': entityId,
      if (state != null) 'state': state,
      if (lastChanged != null) 'last_changed': lastChanged,
      if (lastUpdated != null) 'last_updated': lastUpdated,
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
      {Value<int> id,
      Value<String> entityId,
      Value<String> state,
      Value<DateTime> lastChanged,
      Value<DateTime> lastUpdated,
      Value<String> friendlyName,
      Value<int> supportedFeatures,
      Value<int> currentPosition,
      Value<DateTime> lastTriggered,
      Value<String> mode,
      Value<double> temperature,
      Value<int> humidity,
      Value<double> pressure,
      Value<double> windBearing,
      Value<double> windSpeed,
      Value<String> attribution,
      Value<bool> isOn,
      Value<String> deviceClass,
      Value<String> unitOfMeasurement,
      Value<int> current,
      Value<int> voltage}) {
    return StatesCompanion(
      id: id ?? this.id,
      entityId: entityId ?? this.entityId,
      state: state ?? this.state,
      lastChanged: lastChanged ?? this.lastChanged,
      lastUpdated: lastUpdated ?? this.lastUpdated,
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

class $StatesTable extends States with TableInfo<$StatesTable, State> {
  final GeneratedDatabase _db;
  final String _alias;
  $StatesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _entityIdMeta = const VerificationMeta('entityId');
  GeneratedTextColumn _entityId;
  @override
  GeneratedTextColumn get entityId => _entityId ??= _constructEntityId();
  GeneratedTextColumn _constructEntityId() {
    return GeneratedTextColumn(
      'entity_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _stateMeta = const VerificationMeta('state');
  GeneratedTextColumn _state;
  @override
  GeneratedTextColumn get state => _state ??= _constructState();
  GeneratedTextColumn _constructState() {
    return GeneratedTextColumn(
      'state',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastChangedMeta =
      const VerificationMeta('lastChanged');
  GeneratedDateTimeColumn _lastChanged;
  @override
  GeneratedDateTimeColumn get lastChanged =>
      _lastChanged ??= _constructLastChanged();
  GeneratedDateTimeColumn _constructLastChanged() {
    return GeneratedDateTimeColumn(
      'last_changed',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  GeneratedDateTimeColumn _lastUpdated;
  @override
  GeneratedDateTimeColumn get lastUpdated =>
      _lastUpdated ??= _constructLastUpdated();
  GeneratedDateTimeColumn _constructLastUpdated() {
    return GeneratedDateTimeColumn(
      'last_updated',
      $tableName,
      true,
    );
  }

  final VerificationMeta _friendlyNameMeta =
      const VerificationMeta('friendlyName');
  GeneratedTextColumn _friendlyName;
  @override
  GeneratedTextColumn get friendlyName =>
      _friendlyName ??= _constructFriendlyName();
  GeneratedTextColumn _constructFriendlyName() {
    return GeneratedTextColumn(
      'friendly_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _supportedFeaturesMeta =
      const VerificationMeta('supportedFeatures');
  GeneratedIntColumn _supportedFeatures;
  @override
  GeneratedIntColumn get supportedFeatures =>
      _supportedFeatures ??= _constructSupportedFeatures();
  GeneratedIntColumn _constructSupportedFeatures() {
    return GeneratedIntColumn(
      'supported_features',
      $tableName,
      true,
    );
  }

  final VerificationMeta _currentPositionMeta =
      const VerificationMeta('currentPosition');
  GeneratedIntColumn _currentPosition;
  @override
  GeneratedIntColumn get currentPosition =>
      _currentPosition ??= _constructCurrentPosition();
  GeneratedIntColumn _constructCurrentPosition() {
    return GeneratedIntColumn(
      'current_position',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastTriggeredMeta =
      const VerificationMeta('lastTriggered');
  GeneratedDateTimeColumn _lastTriggered;
  @override
  GeneratedDateTimeColumn get lastTriggered =>
      _lastTriggered ??= _constructLastTriggered();
  GeneratedDateTimeColumn _constructLastTriggered() {
    return GeneratedDateTimeColumn(
      'last_triggered',
      $tableName,
      true,
    );
  }

  final VerificationMeta _modeMeta = const VerificationMeta('mode');
  GeneratedTextColumn _mode;
  @override
  GeneratedTextColumn get mode => _mode ??= _constructMode();
  GeneratedTextColumn _constructMode() {
    return GeneratedTextColumn(
      'mode',
      $tableName,
      true,
    );
  }

  final VerificationMeta _temperatureMeta =
      const VerificationMeta('temperature');
  GeneratedRealColumn _temperature;
  @override
  GeneratedRealColumn get temperature =>
      _temperature ??= _constructTemperature();
  GeneratedRealColumn _constructTemperature() {
    return GeneratedRealColumn(
      'temperature',
      $tableName,
      true,
    );
  }

  final VerificationMeta _humidityMeta = const VerificationMeta('humidity');
  GeneratedIntColumn _humidity;
  @override
  GeneratedIntColumn get humidity => _humidity ??= _constructHumidity();
  GeneratedIntColumn _constructHumidity() {
    return GeneratedIntColumn(
      'humidity',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pressureMeta = const VerificationMeta('pressure');
  GeneratedRealColumn _pressure;
  @override
  GeneratedRealColumn get pressure => _pressure ??= _constructPressure();
  GeneratedRealColumn _constructPressure() {
    return GeneratedRealColumn(
      'pressure',
      $tableName,
      true,
    );
  }

  final VerificationMeta _windBearingMeta =
      const VerificationMeta('windBearing');
  GeneratedRealColumn _windBearing;
  @override
  GeneratedRealColumn get windBearing =>
      _windBearing ??= _constructWindBearing();
  GeneratedRealColumn _constructWindBearing() {
    return GeneratedRealColumn(
      'wind_bearing',
      $tableName,
      true,
    );
  }

  final VerificationMeta _windSpeedMeta = const VerificationMeta('windSpeed');
  GeneratedRealColumn _windSpeed;
  @override
  GeneratedRealColumn get windSpeed => _windSpeed ??= _constructWindSpeed();
  GeneratedRealColumn _constructWindSpeed() {
    return GeneratedRealColumn(
      'wind_speed',
      $tableName,
      true,
    );
  }

  final VerificationMeta _attributionMeta =
      const VerificationMeta('attribution');
  GeneratedTextColumn _attribution;
  @override
  GeneratedTextColumn get attribution =>
      _attribution ??= _constructAttribution();
  GeneratedTextColumn _constructAttribution() {
    return GeneratedTextColumn(
      'attribution',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isOnMeta = const VerificationMeta('isOn');
  GeneratedBoolColumn _isOn;
  @override
  GeneratedBoolColumn get isOn => _isOn ??= _constructIsOn();
  GeneratedBoolColumn _constructIsOn() {
    return GeneratedBoolColumn(
      'is_on',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deviceClassMeta =
      const VerificationMeta('deviceClass');
  GeneratedTextColumn _deviceClass;
  @override
  GeneratedTextColumn get deviceClass =>
      _deviceClass ??= _constructDeviceClass();
  GeneratedTextColumn _constructDeviceClass() {
    return GeneratedTextColumn(
      'device_class',
      $tableName,
      true,
    );
  }

  final VerificationMeta _unitOfMeasurementMeta =
      const VerificationMeta('unitOfMeasurement');
  GeneratedTextColumn _unitOfMeasurement;
  @override
  GeneratedTextColumn get unitOfMeasurement =>
      _unitOfMeasurement ??= _constructUnitOfMeasurement();
  GeneratedTextColumn _constructUnitOfMeasurement() {
    return GeneratedTextColumn(
      'unit_of_measurement',
      $tableName,
      true,
    );
  }

  final VerificationMeta _currentMeta = const VerificationMeta('current');
  GeneratedIntColumn _current;
  @override
  GeneratedIntColumn get current => _current ??= _constructCurrent();
  GeneratedIntColumn _constructCurrent() {
    return GeneratedIntColumn(
      'current',
      $tableName,
      true,
    );
  }

  final VerificationMeta _voltageMeta = const VerificationMeta('voltage');
  GeneratedIntColumn _voltage;
  @override
  GeneratedIntColumn get voltage => _voltage ??= _constructVoltage();
  GeneratedIntColumn _constructVoltage() {
    return GeneratedIntColumn(
      'voltage',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        entityId,
        state,
        lastChanged,
        lastUpdated,
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
  $StatesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'states';
  @override
  final String actualTableName = 'states';
  @override
  VerificationContext validateIntegrity(Insertable<State> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id'], _entityIdMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state'], _stateMeta));
    }
    if (data.containsKey('last_changed')) {
      context.handle(
          _lastChangedMeta,
          lastChanged.isAcceptableOrUnknown(
              data['last_changed'], _lastChangedMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated'], _lastUpdatedMeta));
    }
    if (data.containsKey('friendly_name')) {
      context.handle(
          _friendlyNameMeta,
          friendlyName.isAcceptableOrUnknown(
              data['friendly_name'], _friendlyNameMeta));
    }
    if (data.containsKey('supported_features')) {
      context.handle(
          _supportedFeaturesMeta,
          supportedFeatures.isAcceptableOrUnknown(
              data['supported_features'], _supportedFeaturesMeta));
    }
    if (data.containsKey('current_position')) {
      context.handle(
          _currentPositionMeta,
          currentPosition.isAcceptableOrUnknown(
              data['current_position'], _currentPositionMeta));
    }
    if (data.containsKey('last_triggered')) {
      context.handle(
          _lastTriggeredMeta,
          lastTriggered.isAcceptableOrUnknown(
              data['last_triggered'], _lastTriggeredMeta));
    }
    if (data.containsKey('mode')) {
      context.handle(
          _modeMeta, mode.isAcceptableOrUnknown(data['mode'], _modeMeta));
    }
    if (data.containsKey('temperature')) {
      context.handle(
          _temperatureMeta,
          temperature.isAcceptableOrUnknown(
              data['temperature'], _temperatureMeta));
    }
    if (data.containsKey('humidity')) {
      context.handle(_humidityMeta,
          humidity.isAcceptableOrUnknown(data['humidity'], _humidityMeta));
    }
    if (data.containsKey('pressure')) {
      context.handle(_pressureMeta,
          pressure.isAcceptableOrUnknown(data['pressure'], _pressureMeta));
    }
    if (data.containsKey('wind_bearing')) {
      context.handle(
          _windBearingMeta,
          windBearing.isAcceptableOrUnknown(
              data['wind_bearing'], _windBearingMeta));
    }
    if (data.containsKey('wind_speed')) {
      context.handle(_windSpeedMeta,
          windSpeed.isAcceptableOrUnknown(data['wind_speed'], _windSpeedMeta));
    }
    if (data.containsKey('attribution')) {
      context.handle(
          _attributionMeta,
          attribution.isAcceptableOrUnknown(
              data['attribution'], _attributionMeta));
    }
    if (data.containsKey('is_on')) {
      context.handle(
          _isOnMeta, isOn.isAcceptableOrUnknown(data['is_on'], _isOnMeta));
    }
    if (data.containsKey('device_class')) {
      context.handle(
          _deviceClassMeta,
          deviceClass.isAcceptableOrUnknown(
              data['device_class'], _deviceClassMeta));
    }
    if (data.containsKey('unit_of_measurement')) {
      context.handle(
          _unitOfMeasurementMeta,
          unitOfMeasurement.isAcceptableOrUnknown(
              data['unit_of_measurement'], _unitOfMeasurementMeta));
    }
    if (data.containsKey('current')) {
      context.handle(_currentMeta,
          current.isAcceptableOrUnknown(data['current'], _currentMeta));
    }
    if (data.containsKey('voltage')) {
      context.handle(_voltageMeta,
          voltage.isAcceptableOrUnknown(data['voltage'], _voltageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  State map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return State.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $StatesTable createAlias(String alias) {
    return $StatesTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ConfigsTable _configs;
  $ConfigsTable get configs => _configs ??= $ConfigsTable(this);
  $StatesTable _states;
  $StatesTable get states => _states ??= $StatesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [configs, states];
}
