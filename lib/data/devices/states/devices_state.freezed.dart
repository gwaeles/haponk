// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'devices_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DevicesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<ComparableDevice> devices) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<ComparableDevice> devices)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<ComparableDevice> devices)? loaded,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DevicesIdle value)? idle,
    TResult Function(DevicesLoaded value)? loaded,
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
abstract class _$$DevicesIdleCopyWith<$Res> {
  factory _$$DevicesIdleCopyWith(
          _$DevicesIdle value, $Res Function(_$DevicesIdle) then) =
      __$$DevicesIdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DevicesIdleCopyWithImpl<$Res> extends _$DevicesStateCopyWithImpl<$Res>
    implements _$$DevicesIdleCopyWith<$Res> {
  __$$DevicesIdleCopyWithImpl(
      _$DevicesIdle _value, $Res Function(_$DevicesIdle) _then)
      : super(_value, (v) => _then(v as _$DevicesIdle));

  @override
  _$DevicesIdle get _value => super._value as _$DevicesIdle;
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DevicesIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<ComparableDevice> devices) loaded,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<ComparableDevice> devices)? loaded,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<ComparableDevice> devices)? loaded,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DevicesIdle value)? idle,
    TResult Function(DevicesLoaded value)? loaded,
  }) {
    return idle?.call(this);
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
abstract class _$$DevicesLoadedCopyWith<$Res> {
  factory _$$DevicesLoadedCopyWith(
          _$DevicesLoaded value, $Res Function(_$DevicesLoaded) then) =
      __$$DevicesLoadedCopyWithImpl<$Res>;
  $Res call({List<ComparableDevice> devices});
}

/// @nodoc
class __$$DevicesLoadedCopyWithImpl<$Res>
    extends _$DevicesStateCopyWithImpl<$Res>
    implements _$$DevicesLoadedCopyWith<$Res> {
  __$$DevicesLoadedCopyWithImpl(
      _$DevicesLoaded _value, $Res Function(_$DevicesLoaded) _then)
      : super(_value, (v) => _then(v as _$DevicesLoaded));

  @override
  _$DevicesLoaded get _value => super._value as _$DevicesLoaded;

  @override
  $Res call({
    Object? devices = freezed,
  }) {
    return _then(_$DevicesLoaded(
      devices: devices == freezed
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<ComparableDevice>,
    ));
  }
}

/// @nodoc

class _$DevicesLoaded implements DevicesLoaded {
  _$DevicesLoaded({required final List<ComparableDevice> devices})
      : _devices = devices;

  final List<ComparableDevice> _devices;
  @override
  List<ComparableDevice> get devices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString() {
    return 'DevicesState.loaded(devices: $devices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevicesLoaded &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  _$$DevicesLoadedCopyWith<_$DevicesLoaded> get copyWith =>
      __$$DevicesLoadedCopyWithImpl<_$DevicesLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<ComparableDevice> devices) loaded,
  }) {
    return loaded(devices);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<ComparableDevice> devices)? loaded,
  }) {
    return loaded?.call(devices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<ComparableDevice> devices)? loaded,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DevicesIdle value)? idle,
    TResult Function(DevicesLoaded value)? loaded,
  }) {
    return loaded?.call(this);
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
  factory DevicesLoaded({required final List<ComparableDevice> devices}) =
      _$DevicesLoaded;

  List<ComparableDevice> get devices;
  @JsonKey(ignore: true)
  _$$DevicesLoadedCopyWith<_$DevicesLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
