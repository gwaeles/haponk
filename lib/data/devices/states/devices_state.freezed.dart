// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'devices_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DevicesStateTearOff {
  const _$DevicesStateTearOff();

  DevicesIdle idle() {
    return DevicesIdle();
  }

  DevicesLoaded loaded({required List<Device> devices}) {
    return DevicesLoaded(
      devices: devices,
    );
  }
}

/// @nodoc
const $DevicesState = _$DevicesStateTearOff();

/// @nodoc
mixin _$DevicesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<Device> devices) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<Device> devices)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DevicesIdle value) idle,
    required TResult Function(DevicesLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DevicesIdle value)? idle,
    TResult Function(DevicesLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevicesStateCopyWith<$Res> {
  factory $DevicesStateCopyWith(
          DevicesState value, $Res Function(DevicesState) then) =
      _$DevicesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DevicesStateCopyWithImpl<$Res> implements $DevicesStateCopyWith<$Res> {
  _$DevicesStateCopyWithImpl(this._value, this._then);

  final DevicesState _value;
  // ignore: unused_field
  final $Res Function(DevicesState) _then;
}

/// @nodoc
abstract class $DevicesIdleCopyWith<$Res> {
  factory $DevicesIdleCopyWith(
          DevicesIdle value, $Res Function(DevicesIdle) then) =
      _$DevicesIdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$DevicesIdleCopyWithImpl<$Res> extends _$DevicesStateCopyWithImpl<$Res>
    implements $DevicesIdleCopyWith<$Res> {
  _$DevicesIdleCopyWithImpl(
      DevicesIdle _value, $Res Function(DevicesIdle) _then)
      : super(_value, (v) => _then(v as DevicesIdle));

  @override
  DevicesIdle get _value => super._value as DevicesIdle;
}

/// @nodoc

class _$DevicesIdle implements DevicesIdle {
  _$DevicesIdle();

  @override
  String toString() {
    return 'DevicesState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DevicesIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<Device> devices) loaded,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<Device> devices)? loaded,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DevicesIdle value) idle,
    required TResult Function(DevicesLoaded value) loaded,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DevicesIdle value)? idle,
    TResult Function(DevicesLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class DevicesIdle implements DevicesState {
  factory DevicesIdle() = _$DevicesIdle;
}

/// @nodoc
abstract class $DevicesLoadedCopyWith<$Res> {
  factory $DevicesLoadedCopyWith(
          DevicesLoaded value, $Res Function(DevicesLoaded) then) =
      _$DevicesLoadedCopyWithImpl<$Res>;
  $Res call({List<Device> devices});
}

/// @nodoc
class _$DevicesLoadedCopyWithImpl<$Res> extends _$DevicesStateCopyWithImpl<$Res>
    implements $DevicesLoadedCopyWith<$Res> {
  _$DevicesLoadedCopyWithImpl(
      DevicesLoaded _value, $Res Function(DevicesLoaded) _then)
      : super(_value, (v) => _then(v as DevicesLoaded));

  @override
  DevicesLoaded get _value => super._value as DevicesLoaded;

  @override
  $Res call({
    Object? devices = freezed,
  }) {
    return _then(DevicesLoaded(
      devices: devices == freezed
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<Device>,
    ));
  }
}

/// @nodoc

class _$DevicesLoaded implements DevicesLoaded {
  _$DevicesLoaded({required this.devices});

  @override
  final List<Device> devices;

  @override
  String toString() {
    return 'DevicesState.loaded(devices: $devices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DevicesLoaded &&
            (identical(other.devices, devices) ||
                const DeepCollectionEquality().equals(other.devices, devices)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(devices);

  @JsonKey(ignore: true)
  @override
  $DevicesLoadedCopyWith<DevicesLoaded> get copyWith =>
      _$DevicesLoadedCopyWithImpl<DevicesLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<Device> devices) loaded,
  }) {
    return loaded(devices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<Device> devices)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(devices);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DevicesIdle value) idle,
    required TResult Function(DevicesLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DevicesIdle value)? idle,
    TResult Function(DevicesLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DevicesLoaded implements DevicesState {
  factory DevicesLoaded({required List<Device> devices}) = _$DevicesLoaded;

  List<Device> get devices => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DevicesLoadedCopyWith<DevicesLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
