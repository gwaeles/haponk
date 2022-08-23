// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Config {
  String? get externalUrl => throw _privateConstructorUsedError;
  String? get internalUrl => throw _privateConstructorUsedError;
  String? get locationName => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  DateTime? get lastConnection => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfigCopyWith<Config> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) then) =
      _$ConfigCopyWithImpl<$Res>;
  $Res call(
      {String? externalUrl,
      String? internalUrl,
      String? locationName,
      String? version,
      DateTime? lastConnection,
      String? accessToken});
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res> implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._value, this._then);

  final Config _value;
  // ignore: unused_field
  final $Res Function(Config) _then;

  @override
  $Res call({
    Object? externalUrl = freezed,
    Object? internalUrl = freezed,
    Object? locationName = freezed,
    Object? version = freezed,
    Object? lastConnection = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      externalUrl: externalUrl == freezed
          ? _value.externalUrl
          : externalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      internalUrl: internalUrl == freezed
          ? _value.internalUrl
          : internalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: locationName == freezed
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      lastConnection: lastConnection == freezed
          ? _value.lastConnection
          : lastConnection // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$$_ConfigCopyWith(_$_Config value, $Res Function(_$_Config) then) =
      __$$_ConfigCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? externalUrl,
      String? internalUrl,
      String? locationName,
      String? version,
      DateTime? lastConnection,
      String? accessToken});
}

/// @nodoc
class __$$_ConfigCopyWithImpl<$Res> extends _$ConfigCopyWithImpl<$Res>
    implements _$$_ConfigCopyWith<$Res> {
  __$$_ConfigCopyWithImpl(_$_Config _value, $Res Function(_$_Config) _then)
      : super(_value, (v) => _then(v as _$_Config));

  @override
  _$_Config get _value => super._value as _$_Config;

  @override
  $Res call({
    Object? externalUrl = freezed,
    Object? internalUrl = freezed,
    Object? locationName = freezed,
    Object? version = freezed,
    Object? lastConnection = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_$_Config(
      externalUrl: externalUrl == freezed
          ? _value.externalUrl
          : externalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      internalUrl: internalUrl == freezed
          ? _value.internalUrl
          : internalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: locationName == freezed
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      lastConnection: lastConnection == freezed
          ? _value.lastConnection
          : lastConnection // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Config extends _Config {
  const _$_Config(
      {this.externalUrl,
      this.internalUrl,
      this.locationName,
      this.version,
      this.lastConnection,
      this.accessToken})
      : super._();

  @override
  final String? externalUrl;
  @override
  final String? internalUrl;
  @override
  final String? locationName;
  @override
  final String? version;
  @override
  final DateTime? lastConnection;
  @override
  final String? accessToken;

  @override
  String toString() {
    return 'Config(externalUrl: $externalUrl, internalUrl: $internalUrl, locationName: $locationName, version: $version, lastConnection: $lastConnection, accessToken: $accessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Config &&
            const DeepCollectionEquality()
                .equals(other.externalUrl, externalUrl) &&
            const DeepCollectionEquality()
                .equals(other.internalUrl, internalUrl) &&
            const DeepCollectionEquality()
                .equals(other.locationName, locationName) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality()
                .equals(other.lastConnection, lastConnection) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(externalUrl),
      const DeepCollectionEquality().hash(internalUrl),
      const DeepCollectionEquality().hash(locationName),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(lastConnection),
      const DeepCollectionEquality().hash(accessToken));

  @JsonKey(ignore: true)
  @override
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      __$$_ConfigCopyWithImpl<_$_Config>(this, _$identity);
}

abstract class _Config extends Config {
  const factory _Config(
      {final String? externalUrl,
      final String? internalUrl,
      final String? locationName,
      final String? version,
      final DateTime? lastConnection,
      final String? accessToken}) = _$_Config;
  const _Config._() : super._();

  @override
  String? get externalUrl;
  @override
  String? get internalUrl;
  @override
  String? get locationName;
  @override
  String? get version;
  @override
  DateTime? get lastConnection;
  @override
  String? get accessToken;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ComparableConfig {
  String? get externalUrl => throw _privateConstructorUsedError;
  String? get internalUrl => throw _privateConstructorUsedError;
  String? get locationName => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComparableConfigCopyWith<ComparableConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComparableConfigCopyWith<$Res> {
  factory $ComparableConfigCopyWith(
          ComparableConfig value, $Res Function(ComparableConfig) then) =
      _$ComparableConfigCopyWithImpl<$Res>;
  $Res call(
      {String? externalUrl,
      String? internalUrl,
      String? locationName,
      String? version});
}

/// @nodoc
class _$ComparableConfigCopyWithImpl<$Res>
    implements $ComparableConfigCopyWith<$Res> {
  _$ComparableConfigCopyWithImpl(this._value, this._then);

  final ComparableConfig _value;
  // ignore: unused_field
  final $Res Function(ComparableConfig) _then;

  @override
  $Res call({
    Object? externalUrl = freezed,
    Object? internalUrl = freezed,
    Object? locationName = freezed,
    Object? version = freezed,
  }) {
    return _then(_value.copyWith(
      externalUrl: externalUrl == freezed
          ? _value.externalUrl
          : externalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      internalUrl: internalUrl == freezed
          ? _value.internalUrl
          : internalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: locationName == freezed
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ComparableConfigCopyWith<$Res>
    implements $ComparableConfigCopyWith<$Res> {
  factory _$$_ComparableConfigCopyWith(
          _$_ComparableConfig value, $Res Function(_$_ComparableConfig) then) =
      __$$_ComparableConfigCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? externalUrl,
      String? internalUrl,
      String? locationName,
      String? version});
}

/// @nodoc
class __$$_ComparableConfigCopyWithImpl<$Res>
    extends _$ComparableConfigCopyWithImpl<$Res>
    implements _$$_ComparableConfigCopyWith<$Res> {
  __$$_ComparableConfigCopyWithImpl(
      _$_ComparableConfig _value, $Res Function(_$_ComparableConfig) _then)
      : super(_value, (v) => _then(v as _$_ComparableConfig));

  @override
  _$_ComparableConfig get _value => super._value as _$_ComparableConfig;

  @override
  $Res call({
    Object? externalUrl = freezed,
    Object? internalUrl = freezed,
    Object? locationName = freezed,
    Object? version = freezed,
  }) {
    return _then(_$_ComparableConfig(
      externalUrl: externalUrl == freezed
          ? _value.externalUrl
          : externalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      internalUrl: internalUrl == freezed
          ? _value.internalUrl
          : internalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: locationName == freezed
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ComparableConfig implements _ComparableConfig {
  const _$_ComparableConfig(
      {this.externalUrl, this.internalUrl, this.locationName, this.version});

  @override
  final String? externalUrl;
  @override
  final String? internalUrl;
  @override
  final String? locationName;
  @override
  final String? version;

  @override
  String toString() {
    return 'ComparableConfig(externalUrl: $externalUrl, internalUrl: $internalUrl, locationName: $locationName, version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComparableConfig &&
            const DeepCollectionEquality()
                .equals(other.externalUrl, externalUrl) &&
            const DeepCollectionEquality()
                .equals(other.internalUrl, internalUrl) &&
            const DeepCollectionEquality()
                .equals(other.locationName, locationName) &&
            const DeepCollectionEquality().equals(other.version, version));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(externalUrl),
      const DeepCollectionEquality().hash(internalUrl),
      const DeepCollectionEquality().hash(locationName),
      const DeepCollectionEquality().hash(version));

  @JsonKey(ignore: true)
  @override
  _$$_ComparableConfigCopyWith<_$_ComparableConfig> get copyWith =>
      __$$_ComparableConfigCopyWithImpl<_$_ComparableConfig>(this, _$identity);
}

abstract class _ComparableConfig implements ComparableConfig {
  const factory _ComparableConfig(
      {final String? externalUrl,
      final String? internalUrl,
      final String? locationName,
      final String? version}) = _$_ComparableConfig;

  @override
  String? get externalUrl;
  @override
  String? get internalUrl;
  @override
  String? get locationName;
  @override
  String? get version;
  @override
  @JsonKey(ignore: true)
  _$$_ComparableConfigCopyWith<_$_ComparableConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
