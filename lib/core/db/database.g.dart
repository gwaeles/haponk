// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Config extends DataClass implements Insertable<Config> {
  final int id;
  final String? uuid;
  final String? baseUrl;
  final String? externalUrl;
  final String? internalUrl;
  final String? locationName;
  final String? installationType;
  final bool requiresApiPassword;
  final String? version;
  final DateTime? lastConnection;
  Config(
      {required this.id,
      this.uuid,
      this.baseUrl,
      this.externalUrl,
      this.internalUrl,
      this.locationName,
      this.installationType,
      required this.requiresApiPassword,
      this.version,
      this.lastConnection});
  factory Config.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Config(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid']),
      baseUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}base_url']),
      externalUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}external_url']),
      internalUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}internal_url']),
      locationName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location_name']),
      installationType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}installation_type']),
      requiresApiPassword: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}requires_api_password'])!,
      version: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}version']),
      lastConnection: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_connection']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || uuid != null) {
      map['uuid'] = Variable<String?>(uuid);
    }
    if (!nullToAbsent || baseUrl != null) {
      map['base_url'] = Variable<String?>(baseUrl);
    }
    if (!nullToAbsent || externalUrl != null) {
      map['external_url'] = Variable<String?>(externalUrl);
    }
    if (!nullToAbsent || internalUrl != null) {
      map['internal_url'] = Variable<String?>(internalUrl);
    }
    if (!nullToAbsent || locationName != null) {
      map['location_name'] = Variable<String?>(locationName);
    }
    if (!nullToAbsent || installationType != null) {
      map['installation_type'] = Variable<String?>(installationType);
    }
    map['requires_api_password'] = Variable<bool>(requiresApiPassword);
    if (!nullToAbsent || version != null) {
      map['version'] = Variable<String?>(version);
    }
    if (!nullToAbsent || lastConnection != null) {
      map['last_connection'] = Variable<DateTime?>(lastConnection);
    }
    return map;
  }

  ConfigsCompanion toCompanion(bool nullToAbsent) {
    return ConfigsCompanion(
      id: Value(id),
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
      requiresApiPassword: Value(requiresApiPassword),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
      lastConnection: lastConnection == null && nullToAbsent
          ? const Value.absent()
          : Value(lastConnection),
    );
  }

  factory Config.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Config(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String?>(json['uuid']),
      baseUrl: serializer.fromJson<String?>(json['baseUrl']),
      externalUrl: serializer.fromJson<String?>(json['externalUrl']),
      internalUrl: serializer.fromJson<String?>(json['internalUrl']),
      locationName: serializer.fromJson<String?>(json['locationName']),
      installationType: serializer.fromJson<String?>(json['installationType']),
      requiresApiPassword:
          serializer.fromJson<bool>(json['requiresApiPassword']),
      version: serializer.fromJson<String?>(json['version']),
      lastConnection: serializer.fromJson<DateTime?>(json['lastConnection']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String?>(uuid),
      'baseUrl': serializer.toJson<String?>(baseUrl),
      'externalUrl': serializer.toJson<String?>(externalUrl),
      'internalUrl': serializer.toJson<String?>(internalUrl),
      'locationName': serializer.toJson<String?>(locationName),
      'installationType': serializer.toJson<String?>(installationType),
      'requiresApiPassword': serializer.toJson<bool>(requiresApiPassword),
      'version': serializer.toJson<String?>(version),
      'lastConnection': serializer.toJson<DateTime?>(lastConnection),
    };
  }

  Config copyWith(
          {int? id,
          String? uuid,
          String? baseUrl,
          String? externalUrl,
          String? internalUrl,
          String? locationName,
          String? installationType,
          bool? requiresApiPassword,
          String? version,
          DateTime? lastConnection}) =>
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
  bool operator ==(Object other) =>
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
  final Value<String?> uuid;
  final Value<String?> baseUrl;
  final Value<String?> externalUrl;
  final Value<String?> internalUrl;
  final Value<String?> locationName;
  final Value<String?> installationType;
  final Value<bool> requiresApiPassword;
  final Value<String?> version;
  final Value<DateTime?> lastConnection;
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
    Expression<int>? id,
    Expression<String?>? uuid,
    Expression<String?>? baseUrl,
    Expression<String?>? externalUrl,
    Expression<String?>? internalUrl,
    Expression<String?>? locationName,
    Expression<String?>? installationType,
    Expression<bool>? requiresApiPassword,
    Expression<String?>? version,
    Expression<DateTime?>? lastConnection,
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
      {Value<int>? id,
      Value<String?>? uuid,
      Value<String?>? baseUrl,
      Value<String?>? externalUrl,
      Value<String?>? internalUrl,
      Value<String?>? locationName,
      Value<String?>? installationType,
      Value<bool>? requiresApiPassword,
      Value<String?>? version,
      Value<DateTime?>? lastConnection}) {
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
      map['uuid'] = Variable<String?>(uuid.value);
    }
    if (baseUrl.present) {
      map['base_url'] = Variable<String?>(baseUrl.value);
    }
    if (externalUrl.present) {
      map['external_url'] = Variable<String?>(externalUrl.value);
    }
    if (internalUrl.present) {
      map['internal_url'] = Variable<String?>(internalUrl.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String?>(locationName.value);
    }
    if (installationType.present) {
      map['installation_type'] = Variable<String?>(installationType.value);
    }
    if (requiresApiPassword.present) {
      map['requires_api_password'] = Variable<bool>(requiresApiPassword.value);
    }
    if (version.present) {
      map['version'] = Variable<String?>(version.value);
    }
    if (lastConnection.present) {
      map['last_connection'] = Variable<DateTime?>(lastConnection.value);
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
  final String? _alias;
  $ConfigsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  late final GeneratedColumn<String?> uuid = GeneratedColumn<String?>(
      'uuid', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _baseUrlMeta = const VerificationMeta('baseUrl');
  late final GeneratedColumn<String?> baseUrl = GeneratedColumn<String?>(
      'base_url', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _externalUrlMeta =
      const VerificationMeta('externalUrl');
  late final GeneratedColumn<String?> externalUrl = GeneratedColumn<String?>(
      'external_url', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _internalUrlMeta =
      const VerificationMeta('internalUrl');
  late final GeneratedColumn<String?> internalUrl = GeneratedColumn<String?>(
      'internal_url', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _locationNameMeta =
      const VerificationMeta('locationName');
  late final GeneratedColumn<String?> locationName = GeneratedColumn<String?>(
      'location_name', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _installationTypeMeta =
      const VerificationMeta('installationType');
  late final GeneratedColumn<String?> installationType =
      GeneratedColumn<String?>('installation_type', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _requiresApiPasswordMeta =
      const VerificationMeta('requiresApiPassword');
  late final GeneratedColumn<bool?> requiresApiPassword =
      GeneratedColumn<bool?>('requires_api_password', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultConstraints: 'CHECK (requires_api_password IN (0, 1))',
          defaultValue: const Constant(false));
  final VerificationMeta _versionMeta = const VerificationMeta('version');
  late final GeneratedColumn<String?> version = GeneratedColumn<String?>(
      'version', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _lastConnectionMeta =
      const VerificationMeta('lastConnection');
  late final GeneratedColumn<DateTime?> lastConnection =
      GeneratedColumn<DateTime?>('last_connection', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
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
  String get aliasedName => _alias ?? 'configs';
  @override
  String get actualTableName => 'configs';
  @override
  VerificationContext validateIntegrity(Insertable<Config> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    }
    if (data.containsKey('base_url')) {
      context.handle(_baseUrlMeta,
          baseUrl.isAcceptableOrUnknown(data['base_url']!, _baseUrlMeta));
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
    if (data.containsKey('installation_type')) {
      context.handle(
          _installationTypeMeta,
          installationType.isAcceptableOrUnknown(
              data['installation_type']!, _installationTypeMeta));
    }
    if (data.containsKey('requires_api_password')) {
      context.handle(
          _requiresApiPasswordMeta,
          requiresApiPassword.isAcceptableOrUnknown(
              data['requires_api_password']!, _requiresApiPasswordMeta));
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
  Config map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Config.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ConfigsTable createAlias(String alias) {
    return $ConfigsTable(_db, alias);
  }
}

class State extends DataClass implements Insertable<State> {
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
  State(
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
  factory State.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return State(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      entityId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}entity_id']),
      state: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}state']),
      lastChanged: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_changed']),
      lastUpdated: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_updated']),
      displayLabel: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}display_label']),
      displayType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}display_type']),
      friendlyName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}friendly_name']),
      supportedFeatures: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}supported_features']),
      currentPosition: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current_position']),
      lastTriggered: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_triggered']),
      mode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mode']),
      temperature: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}temperature']),
      humidity: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}humidity']),
      pressure: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pressure']),
      windBearing: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}wind_bearing']),
      windSpeed: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}wind_speed']),
      attribution: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}attribution']),
      isOn: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_on']),
      deviceClass: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}device_class']),
      unitOfMeasurement: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}unit_of_measurement']),
      current: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current']),
      voltage: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}voltage']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || entityId != null) {
      map['entity_id'] = Variable<String?>(entityId);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String?>(state);
    }
    if (!nullToAbsent || lastChanged != null) {
      map['last_changed'] = Variable<DateTime?>(lastChanged);
    }
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<DateTime?>(lastUpdated);
    }
    if (!nullToAbsent || displayLabel != null) {
      map['display_label'] = Variable<String?>(displayLabel);
    }
    if (!nullToAbsent || displayType != null) {
      map['display_type'] = Variable<String?>(displayType);
    }
    if (!nullToAbsent || friendlyName != null) {
      map['friendly_name'] = Variable<String?>(friendlyName);
    }
    if (!nullToAbsent || supportedFeatures != null) {
      map['supported_features'] = Variable<int?>(supportedFeatures);
    }
    if (!nullToAbsent || currentPosition != null) {
      map['current_position'] = Variable<int?>(currentPosition);
    }
    if (!nullToAbsent || lastTriggered != null) {
      map['last_triggered'] = Variable<DateTime?>(lastTriggered);
    }
    if (!nullToAbsent || mode != null) {
      map['mode'] = Variable<String?>(mode);
    }
    if (!nullToAbsent || temperature != null) {
      map['temperature'] = Variable<double?>(temperature);
    }
    if (!nullToAbsent || humidity != null) {
      map['humidity'] = Variable<int?>(humidity);
    }
    if (!nullToAbsent || pressure != null) {
      map['pressure'] = Variable<double?>(pressure);
    }
    if (!nullToAbsent || windBearing != null) {
      map['wind_bearing'] = Variable<double?>(windBearing);
    }
    if (!nullToAbsent || windSpeed != null) {
      map['wind_speed'] = Variable<double?>(windSpeed);
    }
    if (!nullToAbsent || attribution != null) {
      map['attribution'] = Variable<String?>(attribution);
    }
    if (!nullToAbsent || isOn != null) {
      map['is_on'] = Variable<bool?>(isOn);
    }
    if (!nullToAbsent || deviceClass != null) {
      map['device_class'] = Variable<String?>(deviceClass);
    }
    if (!nullToAbsent || unitOfMeasurement != null) {
      map['unit_of_measurement'] = Variable<String?>(unitOfMeasurement);
    }
    if (!nullToAbsent || current != null) {
      map['current'] = Variable<int?>(current);
    }
    if (!nullToAbsent || voltage != null) {
      map['voltage'] = Variable<int?>(voltage);
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

  factory State.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return State(
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
    serializer ??= moorRuntimeOptions.defaultSerializer;
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

  State copyWith(
          {int? id,
          String? entityId,
          String? state,
          DateTime? lastChanged,
          DateTime? lastUpdated,
          String? displayLabel,
          String? displayType,
          String? friendlyName,
          int? supportedFeatures,
          int? currentPosition,
          DateTime? lastTriggered,
          String? mode,
          double? temperature,
          int? humidity,
          double? pressure,
          double? windBearing,
          double? windSpeed,
          String? attribution,
          bool? isOn,
          String? deviceClass,
          String? unitOfMeasurement,
          int? current,
          int? voltage}) =>
      State(
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
  @override
  String toString() {
    return (StringBuffer('State(')
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
                          displayLabel.hashCode,
                          $mrjc(
                              displayType.hashCode,
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
                                                                  windBearing
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      windSpeed
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          attribution
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              isOn.hashCode,
                                                                              $mrjc(deviceClass.hashCode, $mrjc(unitOfMeasurement.hashCode, $mrjc(current.hashCode, voltage.hashCode)))))))))))))))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is State &&
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

class StatesCompanion extends UpdateCompanion<State> {
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
  static Insertable<State> custom({
    Expression<int>? id,
    Expression<String?>? entityId,
    Expression<String?>? state,
    Expression<DateTime?>? lastChanged,
    Expression<DateTime?>? lastUpdated,
    Expression<String?>? displayLabel,
    Expression<String?>? displayType,
    Expression<String?>? friendlyName,
    Expression<int?>? supportedFeatures,
    Expression<int?>? currentPosition,
    Expression<DateTime?>? lastTriggered,
    Expression<String?>? mode,
    Expression<double?>? temperature,
    Expression<int?>? humidity,
    Expression<double?>? pressure,
    Expression<double?>? windBearing,
    Expression<double?>? windSpeed,
    Expression<String?>? attribution,
    Expression<bool?>? isOn,
    Expression<String?>? deviceClass,
    Expression<String?>? unitOfMeasurement,
    Expression<int?>? current,
    Expression<int?>? voltage,
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
      map['entity_id'] = Variable<String?>(entityId.value);
    }
    if (state.present) {
      map['state'] = Variable<String?>(state.value);
    }
    if (lastChanged.present) {
      map['last_changed'] = Variable<DateTime?>(lastChanged.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime?>(lastUpdated.value);
    }
    if (displayLabel.present) {
      map['display_label'] = Variable<String?>(displayLabel.value);
    }
    if (displayType.present) {
      map['display_type'] = Variable<String?>(displayType.value);
    }
    if (friendlyName.present) {
      map['friendly_name'] = Variable<String?>(friendlyName.value);
    }
    if (supportedFeatures.present) {
      map['supported_features'] = Variable<int?>(supportedFeatures.value);
    }
    if (currentPosition.present) {
      map['current_position'] = Variable<int?>(currentPosition.value);
    }
    if (lastTriggered.present) {
      map['last_triggered'] = Variable<DateTime?>(lastTriggered.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String?>(mode.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<double?>(temperature.value);
    }
    if (humidity.present) {
      map['humidity'] = Variable<int?>(humidity.value);
    }
    if (pressure.present) {
      map['pressure'] = Variable<double?>(pressure.value);
    }
    if (windBearing.present) {
      map['wind_bearing'] = Variable<double?>(windBearing.value);
    }
    if (windSpeed.present) {
      map['wind_speed'] = Variable<double?>(windSpeed.value);
    }
    if (attribution.present) {
      map['attribution'] = Variable<String?>(attribution.value);
    }
    if (isOn.present) {
      map['is_on'] = Variable<bool?>(isOn.value);
    }
    if (deviceClass.present) {
      map['device_class'] = Variable<String?>(deviceClass.value);
    }
    if (unitOfMeasurement.present) {
      map['unit_of_measurement'] = Variable<String?>(unitOfMeasurement.value);
    }
    if (current.present) {
      map['current'] = Variable<int?>(current.value);
    }
    if (voltage.present) {
      map['voltage'] = Variable<int?>(voltage.value);
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

class $StatesTable extends States with TableInfo<$StatesTable, State> {
  final GeneratedDatabase _db;
  final String? _alias;
  $StatesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _entityIdMeta = const VerificationMeta('entityId');
  late final GeneratedColumn<String?> entityId = GeneratedColumn<String?>(
      'entity_id', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _stateMeta = const VerificationMeta('state');
  late final GeneratedColumn<String?> state = GeneratedColumn<String?>(
      'state', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _lastChangedMeta =
      const VerificationMeta('lastChanged');
  late final GeneratedColumn<DateTime?> lastChanged =
      GeneratedColumn<DateTime?>('last_changed', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  late final GeneratedColumn<DateTime?> lastUpdated =
      GeneratedColumn<DateTime?>('last_updated', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _displayLabelMeta =
      const VerificationMeta('displayLabel');
  late final GeneratedColumn<String?> displayLabel = GeneratedColumn<String?>(
      'display_label', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _displayTypeMeta =
      const VerificationMeta('displayType');
  late final GeneratedColumn<String?> displayType = GeneratedColumn<String?>(
      'display_type', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _friendlyNameMeta =
      const VerificationMeta('friendlyName');
  late final GeneratedColumn<String?> friendlyName = GeneratedColumn<String?>(
      'friendly_name', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _supportedFeaturesMeta =
      const VerificationMeta('supportedFeatures');
  late final GeneratedColumn<int?> supportedFeatures = GeneratedColumn<int?>(
      'supported_features', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _currentPositionMeta =
      const VerificationMeta('currentPosition');
  late final GeneratedColumn<int?> currentPosition = GeneratedColumn<int?>(
      'current_position', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _lastTriggeredMeta =
      const VerificationMeta('lastTriggered');
  late final GeneratedColumn<DateTime?> lastTriggered =
      GeneratedColumn<DateTime?>('last_triggered', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _modeMeta = const VerificationMeta('mode');
  late final GeneratedColumn<String?> mode = GeneratedColumn<String?>(
      'mode', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _temperatureMeta =
      const VerificationMeta('temperature');
  late final GeneratedColumn<double?> temperature = GeneratedColumn<double?>(
      'temperature', aliasedName, true,
      typeName: 'REAL', requiredDuringInsert: false);
  final VerificationMeta _humidityMeta = const VerificationMeta('humidity');
  late final GeneratedColumn<int?> humidity = GeneratedColumn<int?>(
      'humidity', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _pressureMeta = const VerificationMeta('pressure');
  late final GeneratedColumn<double?> pressure = GeneratedColumn<double?>(
      'pressure', aliasedName, true,
      typeName: 'REAL', requiredDuringInsert: false);
  final VerificationMeta _windBearingMeta =
      const VerificationMeta('windBearing');
  late final GeneratedColumn<double?> windBearing = GeneratedColumn<double?>(
      'wind_bearing', aliasedName, true,
      typeName: 'REAL', requiredDuringInsert: false);
  final VerificationMeta _windSpeedMeta = const VerificationMeta('windSpeed');
  late final GeneratedColumn<double?> windSpeed = GeneratedColumn<double?>(
      'wind_speed', aliasedName, true,
      typeName: 'REAL', requiredDuringInsert: false);
  final VerificationMeta _attributionMeta =
      const VerificationMeta('attribution');
  late final GeneratedColumn<String?> attribution = GeneratedColumn<String?>(
      'attribution', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _isOnMeta = const VerificationMeta('isOn');
  late final GeneratedColumn<bool?> isOn = GeneratedColumn<bool?>(
      'is_on', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_on IN (0, 1))');
  final VerificationMeta _deviceClassMeta =
      const VerificationMeta('deviceClass');
  late final GeneratedColumn<String?> deviceClass = GeneratedColumn<String?>(
      'device_class', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _unitOfMeasurementMeta =
      const VerificationMeta('unitOfMeasurement');
  late final GeneratedColumn<String?> unitOfMeasurement =
      GeneratedColumn<String?>('unit_of_measurement', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _currentMeta = const VerificationMeta('current');
  late final GeneratedColumn<int?> current = GeneratedColumn<int?>(
      'current', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _voltageMeta = const VerificationMeta('voltage');
  late final GeneratedColumn<int?> voltage = GeneratedColumn<int?>(
      'voltage', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
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
  VerificationContext validateIntegrity(Insertable<State> instance,
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
  State map(Map<String, dynamic> data, {String? tablePrefix}) {
    return State.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $StatesTable createAlias(String alias) {
    return $StatesTable(_db, alias);
  }
}

class FlexTab extends DataClass implements Insertable<FlexTab> {
  final int id;
  final String label;
  final int order;
  FlexTab({required this.id, required this.label, required this.order});
  factory FlexTab.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FlexTab(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      label: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}label'])!,
      order: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order'])!,
    );
  }
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

  factory FlexTab.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FlexTab(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
      'order': serializer.toJson<int>(order),
    };
  }

  FlexTab copyWith({int? id, String? label, int? order}) => FlexTab(
        id: id ?? this.id,
        label: label ?? this.label,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('FlexTab(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(label.hashCode, order.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FlexTab &&
          other.id == this.id &&
          other.label == this.label &&
          other.order == this.order);
}

class FlexTabsCompanion extends UpdateCompanion<FlexTab> {
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
  static Insertable<FlexTab> custom({
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

class $FlexTabsTable extends FlexTabs with TableInfo<$FlexTabsTable, FlexTab> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FlexTabsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _labelMeta = const VerificationMeta('label');
  late final GeneratedColumn<String?> label = GeneratedColumn<String?>(
      'label', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _orderMeta = const VerificationMeta('order');
  late final GeneratedColumn<int?> order = GeneratedColumn<int?>(
      'order', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, label, order];
  @override
  String get aliasedName => _alias ?? 'flex_tabs';
  @override
  String get actualTableName => 'flex_tabs';
  @override
  VerificationContext validateIntegrity(Insertable<FlexTab> instance,
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
  FlexTab map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FlexTab.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FlexTabsTable createAlias(String alias) {
    return $FlexTabsTable(_db, alias);
  }
}

class FlexCard extends DataClass implements Insertable<FlexCard> {
  final int id;
  final int tabId;
  final String type;
  final int? stateId;
  final int? parentId;
  final int position;
  final int horizontalFlex;
  final int verticalFlex;
  final int width;
  final int height;
  FlexCard(
      {required this.id,
      required this.tabId,
      required this.type,
      this.stateId,
      this.parentId,
      required this.position,
      required this.horizontalFlex,
      required this.verticalFlex,
      required this.width,
      required this.height});
  factory FlexCard.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FlexCard(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      tabId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tab_id'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      stateId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}state_id']),
      parentId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parent_id']),
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position'])!,
      horizontalFlex: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}horizontal_flex'])!,
      verticalFlex: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vertical_flex'])!,
      width: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}width'])!,
      height: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}height'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tab_id'] = Variable<int>(tabId);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || stateId != null) {
      map['state_id'] = Variable<int?>(stateId);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int?>(parentId);
    }
    map['position'] = Variable<int>(position);
    map['horizontal_flex'] = Variable<int>(horizontalFlex);
    map['vertical_flex'] = Variable<int>(verticalFlex);
    map['width'] = Variable<int>(width);
    map['height'] = Variable<int>(height);
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
      verticalFlex: Value(verticalFlex),
      width: Value(width),
      height: Value(height),
    );
  }

  factory FlexCard.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FlexCard(
      id: serializer.fromJson<int>(json['id']),
      tabId: serializer.fromJson<int>(json['tabId']),
      type: serializer.fromJson<String>(json['type']),
      stateId: serializer.fromJson<int?>(json['stateId']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      position: serializer.fromJson<int>(json['position']),
      horizontalFlex: serializer.fromJson<int>(json['horizontalFlex']),
      verticalFlex: serializer.fromJson<int>(json['verticalFlex']),
      width: serializer.fromJson<int>(json['width']),
      height: serializer.fromJson<int>(json['height']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tabId': serializer.toJson<int>(tabId),
      'type': serializer.toJson<String>(type),
      'stateId': serializer.toJson<int?>(stateId),
      'parentId': serializer.toJson<int?>(parentId),
      'position': serializer.toJson<int>(position),
      'horizontalFlex': serializer.toJson<int>(horizontalFlex),
      'verticalFlex': serializer.toJson<int>(verticalFlex),
      'width': serializer.toJson<int>(width),
      'height': serializer.toJson<int>(height),
    };
  }

  FlexCard copyWith(
          {int? id,
          int? tabId,
          String? type,
          int? stateId,
          int? parentId,
          int? position,
          int? horizontalFlex,
          int? verticalFlex,
          int? width,
          int? height}) =>
      FlexCard(
        id: id ?? this.id,
        tabId: tabId ?? this.tabId,
        type: type ?? this.type,
        stateId: stateId ?? this.stateId,
        parentId: parentId ?? this.parentId,
        position: position ?? this.position,
        horizontalFlex: horizontalFlex ?? this.horizontalFlex,
        verticalFlex: verticalFlex ?? this.verticalFlex,
        width: width ?? this.width,
        height: height ?? this.height,
      );
  @override
  String toString() {
    return (StringBuffer('FlexCard(')
          ..write('id: $id, ')
          ..write('tabId: $tabId, ')
          ..write('type: $type, ')
          ..write('stateId: $stateId, ')
          ..write('parentId: $parentId, ')
          ..write('position: $position, ')
          ..write('horizontalFlex: $horizontalFlex, ')
          ..write('verticalFlex: $verticalFlex, ')
          ..write('width: $width, ')
          ..write('height: $height')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          tabId.hashCode,
          $mrjc(
              type.hashCode,
              $mrjc(
                  stateId.hashCode,
                  $mrjc(
                      parentId.hashCode,
                      $mrjc(
                          position.hashCode,
                          $mrjc(
                              horizontalFlex.hashCode,
                              $mrjc(
                                  verticalFlex.hashCode,
                                  $mrjc(
                                      width.hashCode, height.hashCode))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FlexCard &&
          other.id == this.id &&
          other.tabId == this.tabId &&
          other.type == this.type &&
          other.stateId == this.stateId &&
          other.parentId == this.parentId &&
          other.position == this.position &&
          other.horizontalFlex == this.horizontalFlex &&
          other.verticalFlex == this.verticalFlex &&
          other.width == this.width &&
          other.height == this.height);
}

class FlexCardsCompanion extends UpdateCompanion<FlexCard> {
  final Value<int> id;
  final Value<int> tabId;
  final Value<String> type;
  final Value<int?> stateId;
  final Value<int?> parentId;
  final Value<int> position;
  final Value<int> horizontalFlex;
  final Value<int> verticalFlex;
  final Value<int> width;
  final Value<int> height;
  const FlexCardsCompanion({
    this.id = const Value.absent(),
    this.tabId = const Value.absent(),
    this.type = const Value.absent(),
    this.stateId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.position = const Value.absent(),
    this.horizontalFlex = const Value.absent(),
    this.verticalFlex = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
  });
  FlexCardsCompanion.insert({
    this.id = const Value.absent(),
    required int tabId,
    required String type,
    this.stateId = const Value.absent(),
    this.parentId = const Value.absent(),
    required int position,
    required int horizontalFlex,
    required int verticalFlex,
    required int width,
    required int height,
  })  : tabId = Value(tabId),
        type = Value(type),
        position = Value(position),
        horizontalFlex = Value(horizontalFlex),
        verticalFlex = Value(verticalFlex),
        width = Value(width),
        height = Value(height);
  static Insertable<FlexCard> custom({
    Expression<int>? id,
    Expression<int>? tabId,
    Expression<String>? type,
    Expression<int?>? stateId,
    Expression<int?>? parentId,
    Expression<int>? position,
    Expression<int>? horizontalFlex,
    Expression<int>? verticalFlex,
    Expression<int>? width,
    Expression<int>? height,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tabId != null) 'tab_id': tabId,
      if (type != null) 'type': type,
      if (stateId != null) 'state_id': stateId,
      if (parentId != null) 'parent_id': parentId,
      if (position != null) 'position': position,
      if (horizontalFlex != null) 'horizontal_flex': horizontalFlex,
      if (verticalFlex != null) 'vertical_flex': verticalFlex,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
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
      Value<int>? verticalFlex,
      Value<int>? width,
      Value<int>? height}) {
    return FlexCardsCompanion(
      id: id ?? this.id,
      tabId: tabId ?? this.tabId,
      type: type ?? this.type,
      stateId: stateId ?? this.stateId,
      parentId: parentId ?? this.parentId,
      position: position ?? this.position,
      horizontalFlex: horizontalFlex ?? this.horizontalFlex,
      verticalFlex: verticalFlex ?? this.verticalFlex,
      width: width ?? this.width,
      height: height ?? this.height,
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
      map['state_id'] = Variable<int?>(stateId.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int?>(parentId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (horizontalFlex.present) {
      map['horizontal_flex'] = Variable<int>(horizontalFlex.value);
    }
    if (verticalFlex.present) {
      map['vertical_flex'] = Variable<int>(verticalFlex.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
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
          ..write('verticalFlex: $verticalFlex, ')
          ..write('width: $width, ')
          ..write('height: $height')
          ..write(')'))
        .toString();
  }
}

class $FlexCardsTable extends FlexCards
    with TableInfo<$FlexCardsTable, FlexCard> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FlexCardsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _tabIdMeta = const VerificationMeta('tabId');
  late final GeneratedColumn<int?> tabId = GeneratedColumn<int?>(
      'tab_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _stateIdMeta = const VerificationMeta('stateId');
  late final GeneratedColumn<int?> stateId = GeneratedColumn<int?>(
      'state_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _parentIdMeta = const VerificationMeta('parentId');
  late final GeneratedColumn<int?> parentId = GeneratedColumn<int?>(
      'parent_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _horizontalFlexMeta =
      const VerificationMeta('horizontalFlex');
  late final GeneratedColumn<int?> horizontalFlex = GeneratedColumn<int?>(
      'horizontal_flex', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _verticalFlexMeta =
      const VerificationMeta('verticalFlex');
  late final GeneratedColumn<int?> verticalFlex = GeneratedColumn<int?>(
      'vertical_flex', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _widthMeta = const VerificationMeta('width');
  late final GeneratedColumn<int?> width = GeneratedColumn<int?>(
      'width', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _heightMeta = const VerificationMeta('height');
  late final GeneratedColumn<int?> height = GeneratedColumn<int?>(
      'height', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        tabId,
        type,
        stateId,
        parentId,
        position,
        horizontalFlex,
        verticalFlex,
        width,
        height
      ];
  @override
  String get aliasedName => _alias ?? 'flex_cards';
  @override
  String get actualTableName => 'flex_cards';
  @override
  VerificationContext validateIntegrity(Insertable<FlexCard> instance,
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
    if (data.containsKey('vertical_flex')) {
      context.handle(
          _verticalFlexMeta,
          verticalFlex.isAcceptableOrUnknown(
              data['vertical_flex']!, _verticalFlexMeta));
    } else if (isInserting) {
      context.missing(_verticalFlexMeta);
    }
    if (data.containsKey('width')) {
      context.handle(
          _widthMeta, width.isAcceptableOrUnknown(data['width']!, _widthMeta));
    } else if (isInserting) {
      context.missing(_widthMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FlexCard map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FlexCard.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FlexCardsTable createAlias(String alias) {
    return $FlexCardsTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ConfigsTable configs = $ConfigsTable(this);
  late final $StatesTable states = $StatesTable(this);
  late final $FlexTabsTable flexTabs = $FlexTabsTable(this);
  late final $FlexCardsTable flexCards = $FlexCardsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [configs, states, flexTabs, flexCards];
}
