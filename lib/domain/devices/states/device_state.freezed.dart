// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeviceState {
  Device? get device => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Device? device) idle,
    required TResult Function(Device? device) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Device? device)? idle,
    TResult Function(Device? device)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Device? device)? idle,
    TResult Function(Device? device)? loaded,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeviceIdle value)? idle,
    TResult Function(DeviceLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceIdle value)? idle,
    TResult Function(DeviceLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceStateCopyWith<DeviceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceStateCopyWith<$Res> {
  factory $DeviceStateCopyWith(
          DeviceState value, $Res Function(DeviceState) then) =
      _$DeviceStateCopyWithImpl<$Res>;
  $Res call({Device? device});

  $DeviceCopyWith<$Res>? get device;
}

/// @nodoc
class _$DeviceStateCopyWithImpl<$Res> implements $DeviceStateCopyWith<$Res> {
  _$DeviceStateCopyWithImpl(this._value, this._then);

  final DeviceState _value;
  // ignore: unused_field
  final $Res Function(DeviceState) _then;

  @override
  $Res call({
    Object? device = freezed,
  }) {
    return _then(_value.copyWith(
      device: device == freezed
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device?,
    ));
  }

  @override
  $DeviceCopyWith<$Res>? get device {
    if (_value.device == null) {
      return null;
    }

    return $DeviceCopyWith<$Res>(_value.device!, (value) {
      return _then(_value.copyWith(device: value));
    });
  }
}

/// @nodoc
abstract class _$$DeviceIdleCopyWith<$Res>
    implements $DeviceStateCopyWith<$Res> {
  factory _$$DeviceIdleCopyWith(
          _$DeviceIdle value, $Res Function(_$DeviceIdle) then) =
      __$$DeviceIdleCopyWithImpl<$Res>;
  @override
  $Res call({Device? device});

  @override
  $DeviceCopyWith<$Res>? get device;
}

/// @nodoc
class __$$DeviceIdleCopyWithImpl<$Res> extends _$DeviceStateCopyWithImpl<$Res>
    implements _$$DeviceIdleCopyWith<$Res> {
  __$$DeviceIdleCopyWithImpl(
      _$DeviceIdle _value, $Res Function(_$DeviceIdle) _then)
      : super(_value, (v) => _then(v as _$DeviceIdle));

  @override
  _$DeviceIdle get _value => super._value as _$DeviceIdle;

  @override
  $Res call({
    Object? device = freezed,
  }) {
    return _then(_$DeviceIdle(
      device == freezed
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device?,
    ));
  }
}

/// @nodoc

class _$DeviceIdle implements DeviceIdle {
  _$DeviceIdle([this.device]);

  @override
  final Device? device;

  @override
  String toString() {
    return 'DeviceState.idle(device: $device)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceIdle &&
            const DeepCollectionEquality().equals(other.device, device));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(device));

  @JsonKey(ignore: true)
  @override
  _$$DeviceIdleCopyWith<_$DeviceIdle> get copyWith =>
      __$$DeviceIdleCopyWithImpl<_$DeviceIdle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Device? device) idle,
    required TResult Function(Device? device) loaded,
  }) {
    return idle(device);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Device? device)? idle,
    TResult Function(Device? device)? loaded,
  }) {
    return idle?.call(device);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Device? device)? idle,
    TResult Function(Device? device)? loaded,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(device);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeviceIdle value)? idle,
    TResult Function(DeviceLoaded value)? loaded,
  }) {
    return idle?.call(this);
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
  factory DeviceIdle([final Device? device]) = _$DeviceIdle;

  @override
  Device? get device;
  @override
  @JsonKey(ignore: true)
  _$$DeviceIdleCopyWith<_$DeviceIdle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceLoadedCopyWith<$Res>
    implements $DeviceStateCopyWith<$Res> {
  factory _$$DeviceLoadedCopyWith(
          _$DeviceLoaded value, $Res Function(_$DeviceLoaded) then) =
      __$$DeviceLoadedCopyWithImpl<$Res>;
  @override
  $Res call({Device? device});

  @override
  $DeviceCopyWith<$Res>? get device;
}

/// @nodoc
class __$$DeviceLoadedCopyWithImpl<$Res> extends _$DeviceStateCopyWithImpl<$Res>
    implements _$$DeviceLoadedCopyWith<$Res> {
  __$$DeviceLoadedCopyWithImpl(
      _$DeviceLoaded _value, $Res Function(_$DeviceLoaded) _then)
      : super(_value, (v) => _then(v as _$DeviceLoaded));

  @override
  _$DeviceLoaded get _value => super._value as _$DeviceLoaded;

  @override
  $Res call({
    Object? device = freezed,
  }) {
    return _then(_$DeviceLoaded(
      device: device == freezed
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device?,
    ));
  }
}

/// @nodoc

class _$DeviceLoaded implements DeviceLoaded {
  _$DeviceLoaded({this.device});

  @override
  final Device? device;

  @override
  String toString() {
    return 'DeviceState.loaded(device: $device)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceLoaded &&
            const DeepCollectionEquality().equals(other.device, device));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(device));

  @JsonKey(ignore: true)
  @override
  _$$DeviceLoadedCopyWith<_$DeviceLoaded> get copyWith =>
      __$$DeviceLoadedCopyWithImpl<_$DeviceLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Device? device) idle,
    required TResult Function(Device? device) loaded,
  }) {
    return loaded(device);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Device? device)? idle,
    TResult Function(Device? device)? loaded,
  }) {
    return loaded?.call(device);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Device? device)? idle,
    TResult Function(Device? device)? loaded,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeviceIdle value)? idle,
    TResult Function(DeviceLoaded value)? loaded,
  }) {
    return loaded?.call(this);
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
  factory DeviceLoaded({final Device? device}) = _$DeviceLoaded;

  @override
  Device? get device;
  @override
  @JsonKey(ignore: true)
  _$$DeviceLoadedCopyWith<_$DeviceLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
