// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'device_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DeviceStateTearOff {
  const _$DeviceStateTearOff();

  DeviceIdle idle() {
    return DeviceIdle();
  }

  DeviceLoaded loaded({required Device device}) {
    return DeviceLoaded(
      device: device,
    );
  }
}

/// @nodoc
const $DeviceState = _$DeviceStateTearOff();

/// @nodoc
mixin _$DeviceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(Device device) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(Device device)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceIdle value) idle,
    required TResult Function(DeviceLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceIdle value)? idle,
    TResult Function(DeviceLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceStateCopyWith<$Res> {
  factory $DeviceStateCopyWith(
          DeviceState value, $Res Function(DeviceState) then) =
      _$DeviceStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeviceStateCopyWithImpl<$Res> implements $DeviceStateCopyWith<$Res> {
  _$DeviceStateCopyWithImpl(this._value, this._then);

  final DeviceState _value;
  // ignore: unused_field
  final $Res Function(DeviceState) _then;
}

/// @nodoc
abstract class $DeviceIdleCopyWith<$Res> {
  factory $DeviceIdleCopyWith(
          DeviceIdle value, $Res Function(DeviceIdle) then) =
      _$DeviceIdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeviceIdleCopyWithImpl<$Res> extends _$DeviceStateCopyWithImpl<$Res>
    implements $DeviceIdleCopyWith<$Res> {
  _$DeviceIdleCopyWithImpl(DeviceIdle _value, $Res Function(DeviceIdle) _then)
      : super(_value, (v) => _then(v as DeviceIdle));

  @override
  DeviceIdle get _value => super._value as DeviceIdle;
}

/// @nodoc

class _$DeviceIdle implements DeviceIdle {
  _$DeviceIdle();

  @override
  String toString() {
    return 'DeviceState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DeviceIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(Device device) loaded,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(Device device)? loaded,
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
    required TResult Function(DeviceIdle value) idle,
    required TResult Function(DeviceLoaded value) loaded,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceIdle value)? idle,
    TResult Function(DeviceLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class DeviceIdle implements DeviceState {
  factory DeviceIdle() = _$DeviceIdle;
}

/// @nodoc
abstract class $DeviceLoadedCopyWith<$Res> {
  factory $DeviceLoadedCopyWith(
          DeviceLoaded value, $Res Function(DeviceLoaded) then) =
      _$DeviceLoadedCopyWithImpl<$Res>;
  $Res call({Device device});

  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class _$DeviceLoadedCopyWithImpl<$Res> extends _$DeviceStateCopyWithImpl<$Res>
    implements $DeviceLoadedCopyWith<$Res> {
  _$DeviceLoadedCopyWithImpl(
      DeviceLoaded _value, $Res Function(DeviceLoaded) _then)
      : super(_value, (v) => _then(v as DeviceLoaded));

  @override
  DeviceLoaded get _value => super._value as DeviceLoaded;

  @override
  $Res call({
    Object? device = freezed,
  }) {
    return _then(DeviceLoaded(
      device: device == freezed
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ));
  }

  @override
  $DeviceCopyWith<$Res> get device {
    return $DeviceCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value));
    });
  }
}

/// @nodoc

class _$DeviceLoaded implements DeviceLoaded {
  _$DeviceLoaded({required this.device});

  @override
  final Device device;

  @override
  String toString() {
    return 'DeviceState.loaded(device: $device)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeviceLoaded &&
            (identical(other.device, device) ||
                const DeepCollectionEquality().equals(other.device, device)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(device);

  @JsonKey(ignore: true)
  @override
  $DeviceLoadedCopyWith<DeviceLoaded> get copyWith =>
      _$DeviceLoadedCopyWithImpl<DeviceLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(Device device) loaded,
  }) {
    return loaded(device);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(Device device)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(device);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceIdle value) idle,
    required TResult Function(DeviceLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceIdle value)? idle,
    TResult Function(DeviceLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DeviceLoaded implements DeviceState {
  factory DeviceLoaded({required Device device}) = _$DeviceLoaded;

  Device get device => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceLoadedCopyWith<DeviceLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
