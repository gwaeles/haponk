// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServiceParams {
  String get domain => throw _privateConstructorUsedError;
  String get service => throw _privateConstructorUsedError;
  String get entityId => throw _privateConstructorUsedError;
  int? get brightness => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceParamsCopyWith<ServiceParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceParamsCopyWith<$Res> {
  factory $ServiceParamsCopyWith(
          ServiceParams value, $Res Function(ServiceParams) then) =
      _$ServiceParamsCopyWithImpl<$Res>;
  $Res call({String domain, String service, String entityId, int? brightness});
}

/// @nodoc
class _$ServiceParamsCopyWithImpl<$Res>
    implements $ServiceParamsCopyWith<$Res> {
  _$ServiceParamsCopyWithImpl(this._value, this._then);

  final ServiceParams _value;
  // ignore: unused_field
  final $Res Function(ServiceParams) _then;

  @override
  $Res call({
    Object? domain = freezed,
    Object? service = freezed,
    Object? entityId = freezed,
    Object? brightness = freezed,
  }) {
    return _then(_value.copyWith(
      domain: domain == freezed
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: entityId == freezed
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      brightness: brightness == freezed
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_ServiceParamsCopyWith<$Res>
    implements $ServiceParamsCopyWith<$Res> {
  factory _$$_ServiceParamsCopyWith(
          _$_ServiceParams value, $Res Function(_$_ServiceParams) then) =
      __$$_ServiceParamsCopyWithImpl<$Res>;
  @override
  $Res call({String domain, String service, String entityId, int? brightness});
}

/// @nodoc
class __$$_ServiceParamsCopyWithImpl<$Res>
    extends _$ServiceParamsCopyWithImpl<$Res>
    implements _$$_ServiceParamsCopyWith<$Res> {
  __$$_ServiceParamsCopyWithImpl(
      _$_ServiceParams _value, $Res Function(_$_ServiceParams) _then)
      : super(_value, (v) => _then(v as _$_ServiceParams));

  @override
  _$_ServiceParams get _value => super._value as _$_ServiceParams;

  @override
  $Res call({
    Object? domain = freezed,
    Object? service = freezed,
    Object? entityId = freezed,
    Object? brightness = freezed,
  }) {
    return _then(_$_ServiceParams(
      domain: domain == freezed
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: entityId == freezed
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      brightness: brightness == freezed
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ServiceParams extends _ServiceParams {
  const _$_ServiceParams(
      {required this.domain,
      required this.service,
      required this.entityId,
      this.brightness})
      : super._();

  @override
  final String domain;
  @override
  final String service;
  @override
  final String entityId;
  @override
  final int? brightness;

  @override
  String toString() {
    return 'ServiceParams(domain: $domain, service: $service, entityId: $entityId, brightness: $brightness)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceParams &&
            const DeepCollectionEquality().equals(other.domain, domain) &&
            const DeepCollectionEquality().equals(other.service, service) &&
            const DeepCollectionEquality().equals(other.entityId, entityId) &&
            const DeepCollectionEquality()
                .equals(other.brightness, brightness));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(domain),
      const DeepCollectionEquality().hash(service),
      const DeepCollectionEquality().hash(entityId),
      const DeepCollectionEquality().hash(brightness));

  @JsonKey(ignore: true)
  @override
  _$$_ServiceParamsCopyWith<_$_ServiceParams> get copyWith =>
      __$$_ServiceParamsCopyWithImpl<_$_ServiceParams>(this, _$identity);
}

abstract class _ServiceParams extends ServiceParams {
  const factory _ServiceParams(
      {required final String domain,
      required final String service,
      required final String entityId,
      final int? brightness}) = _$_ServiceParams;
  const _ServiceParams._() : super._();

  @override
  String get domain;
  @override
  String get service;
  @override
  String get entityId;
  @override
  int? get brightness;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceParamsCopyWith<_$_ServiceParams> get copyWith =>
      throw _privateConstructorUsedError;
}
