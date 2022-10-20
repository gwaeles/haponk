// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'config_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConfigState {
  Status get status => throw _privateConstructorUsedError;
  ConnexionStatus get connexionStatus => throw _privateConstructorUsedError;
  Config? get data => throw _privateConstructorUsedError;
  Exception? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfigStateCopyWith<ConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigStateCopyWith<$Res> {
  factory $ConfigStateCopyWith(
          ConfigState value, $Res Function(ConfigState) then) =
      _$ConfigStateCopyWithImpl<$Res>;
  $Res call(
      {Status status,
      ConnexionStatus connexionStatus,
      Config? data,
      Exception? failure});

  $ConfigCopyWith<$Res>? get data;
}

/// @nodoc
class _$ConfigStateCopyWithImpl<$Res> implements $ConfigStateCopyWith<$Res> {
  _$ConfigStateCopyWithImpl(this._value, this._then);

  final ConfigState _value;
  // ignore: unused_field
  final $Res Function(ConfigState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? connexionStatus = freezed,
    Object? data = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      connexionStatus: connexionStatus == freezed
          ? _value.connexionStatus
          : connexionStatus // ignore: cast_nullable_to_non_nullable
              as ConnexionStatus,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Config?,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }

  @override
  $ConfigCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ConfigCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$$_ConfigStateCopyWith<$Res>
    implements $ConfigStateCopyWith<$Res> {
  factory _$$_ConfigStateCopyWith(
          _$_ConfigState value, $Res Function(_$_ConfigState) then) =
      __$$_ConfigStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Status status,
      ConnexionStatus connexionStatus,
      Config? data,
      Exception? failure});

  @override
  $ConfigCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ConfigStateCopyWithImpl<$Res> extends _$ConfigStateCopyWithImpl<$Res>
    implements _$$_ConfigStateCopyWith<$Res> {
  __$$_ConfigStateCopyWithImpl(
      _$_ConfigState _value, $Res Function(_$_ConfigState) _then)
      : super(_value, (v) => _then(v as _$_ConfigState));

  @override
  _$_ConfigState get _value => super._value as _$_ConfigState;

  @override
  $Res call({
    Object? status = freezed,
    Object? connexionStatus = freezed,
    Object? data = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$_ConfigState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      connexionStatus: connexionStatus == freezed
          ? _value.connexionStatus
          : connexionStatus // ignore: cast_nullable_to_non_nullable
              as ConnexionStatus,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Config?,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_ConfigState implements _ConfigState {
  _$_ConfigState(
      {this.status = Status.initial,
      this.connexionStatus = ConnexionStatus.initial,
      this.data,
      this.failure});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final ConnexionStatus connexionStatus;
  @override
  final Config? data;
  @override
  final Exception? failure;

  @override
  String toString() {
    return 'ConfigState(status: $status, connexionStatus: $connexionStatus, data: $data, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfigState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.connexionStatus, connexionStatus) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(connexionStatus),
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$_ConfigStateCopyWith<_$_ConfigState> get copyWith =>
      __$$_ConfigStateCopyWithImpl<_$_ConfigState>(this, _$identity);
}

abstract class _ConfigState implements ConfigState {
  factory _ConfigState(
      {final Status status,
      final ConnexionStatus connexionStatus,
      final Config? data,
      final Exception? failure}) = _$_ConfigState;

  @override
  Status get status;
  @override
  ConnexionStatus get connexionStatus;
  @override
  Config? get data;
  @override
  Exception? get failure;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigStateCopyWith<_$_ConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}
