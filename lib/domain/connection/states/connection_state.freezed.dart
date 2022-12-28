// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'connection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectionState {
  ConnectionType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectionStateCopyWith<ConnectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionStateCopyWith<$Res> {
  factory $ConnectionStateCopyWith(
          ConnectionState value, $Res Function(ConnectionState) then) =
      _$ConnectionStateCopyWithImpl<$Res>;
  $Res call({ConnectionType type});
}

/// @nodoc
class _$ConnectionStateCopyWithImpl<$Res>
    implements $ConnectionStateCopyWith<$Res> {
  _$ConnectionStateCopyWithImpl(this._value, this._then);

  final ConnectionState _value;
  // ignore: unused_field
  final $Res Function(ConnectionState) _then;

  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConnectionType,
    ));
  }
}

/// @nodoc
abstract class _$$_ConnectionStateCopyWith<$Res>
    implements $ConnectionStateCopyWith<$Res> {
  factory _$$_ConnectionStateCopyWith(
          _$_ConnectionState value, $Res Function(_$_ConnectionState) then) =
      __$$_ConnectionStateCopyWithImpl<$Res>;
  @override
  $Res call({ConnectionType type});
}

/// @nodoc
class __$$_ConnectionStateCopyWithImpl<$Res>
    extends _$ConnectionStateCopyWithImpl<$Res>
    implements _$$_ConnectionStateCopyWith<$Res> {
  __$$_ConnectionStateCopyWithImpl(
      _$_ConnectionState _value, $Res Function(_$_ConnectionState) _then)
      : super(_value, (v) => _then(v as _$_ConnectionState));

  @override
  _$_ConnectionState get _value => super._value as _$_ConnectionState;

  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_$_ConnectionState(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConnectionType,
    ));
  }
}

/// @nodoc

class _$_ConnectionState extends _ConnectionState {
  _$_ConnectionState({this.type = ConnectionType.idle}) : super._();

  @override
  @JsonKey()
  final ConnectionType type;

  @override
  String toString() {
    return 'ConnectionState(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectionState &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_ConnectionStateCopyWith<_$_ConnectionState> get copyWith =>
      __$$_ConnectionStateCopyWithImpl<_$_ConnectionState>(this, _$identity);
}

abstract class _ConnectionState extends ConnectionState {
  factory _ConnectionState({final ConnectionType type}) = _$_ConnectionState;
  _ConnectionState._() : super._();

  @override
  ConnectionType get type;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectionStateCopyWith<_$_ConnectionState> get copyWith =>
      throw _privateConstructorUsedError;
}
