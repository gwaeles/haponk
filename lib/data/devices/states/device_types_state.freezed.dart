// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'device_types_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DeviceTypesStateTearOff {
  const _$DeviceTypesStateTearOff();

  DeviceTypesIdle idle() {
    return DeviceTypesIdle();
  }

  DeviceTypesLoaded loaded({required List<DeviceType> types}) {
    return DeviceTypesLoaded(
      types: types,
    );
  }
}

/// @nodoc
const $DeviceTypesState = _$DeviceTypesStateTearOff();

/// @nodoc
mixin _$DeviceTypesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<DeviceType> types) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<DeviceType> types)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceTypesIdle value) idle,
    required TResult Function(DeviceTypesLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceTypesIdle value)? idle,
    TResult Function(DeviceTypesLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceTypesStateCopyWith<$Res> {
  factory $DeviceTypesStateCopyWith(
          DeviceTypesState value, $Res Function(DeviceTypesState) then) =
      _$DeviceTypesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeviceTypesStateCopyWithImpl<$Res>
    implements $DeviceTypesStateCopyWith<$Res> {
  _$DeviceTypesStateCopyWithImpl(this._value, this._then);

  final DeviceTypesState _value;
  // ignore: unused_field
  final $Res Function(DeviceTypesState) _then;
}

/// @nodoc
abstract class $DeviceTypesIdleCopyWith<$Res> {
  factory $DeviceTypesIdleCopyWith(
          DeviceTypesIdle value, $Res Function(DeviceTypesIdle) then) =
      _$DeviceTypesIdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeviceTypesIdleCopyWithImpl<$Res>
    extends _$DeviceTypesStateCopyWithImpl<$Res>
    implements $DeviceTypesIdleCopyWith<$Res> {
  _$DeviceTypesIdleCopyWithImpl(
      DeviceTypesIdle _value, $Res Function(DeviceTypesIdle) _then)
      : super(_value, (v) => _then(v as DeviceTypesIdle));

  @override
  DeviceTypesIdle get _value => super._value as DeviceTypesIdle;
}

/// @nodoc

class _$DeviceTypesIdle implements DeviceTypesIdle {
  _$DeviceTypesIdle();

  @override
  String toString() {
    return 'DeviceTypesState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DeviceTypesIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<DeviceType> types) loaded,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<DeviceType> types)? loaded,
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
    required TResult Function(DeviceTypesIdle value) idle,
    required TResult Function(DeviceTypesLoaded value) loaded,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceTypesIdle value)? idle,
    TResult Function(DeviceTypesLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class DeviceTypesIdle implements DeviceTypesState {
  factory DeviceTypesIdle() = _$DeviceTypesIdle;
}

/// @nodoc
abstract class $DeviceTypesLoadedCopyWith<$Res> {
  factory $DeviceTypesLoadedCopyWith(
          DeviceTypesLoaded value, $Res Function(DeviceTypesLoaded) then) =
      _$DeviceTypesLoadedCopyWithImpl<$Res>;
  $Res call({List<DeviceType> types});
}

/// @nodoc
class _$DeviceTypesLoadedCopyWithImpl<$Res>
    extends _$DeviceTypesStateCopyWithImpl<$Res>
    implements $DeviceTypesLoadedCopyWith<$Res> {
  _$DeviceTypesLoadedCopyWithImpl(
      DeviceTypesLoaded _value, $Res Function(DeviceTypesLoaded) _then)
      : super(_value, (v) => _then(v as DeviceTypesLoaded));

  @override
  DeviceTypesLoaded get _value => super._value as DeviceTypesLoaded;

  @override
  $Res call({
    Object? types = freezed,
  }) {
    return _then(DeviceTypesLoaded(
      types: types == freezed
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<DeviceType>,
    ));
  }
}

/// @nodoc

class _$DeviceTypesLoaded implements DeviceTypesLoaded {
  _$DeviceTypesLoaded({required this.types});

  @override
  final List<DeviceType> types;

  @override
  String toString() {
    return 'DeviceTypesState.loaded(types: $types)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeviceTypesLoaded &&
            (identical(other.types, types) ||
                const DeepCollectionEquality().equals(other.types, types)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(types);

  @JsonKey(ignore: true)
  @override
  $DeviceTypesLoadedCopyWith<DeviceTypesLoaded> get copyWith =>
      _$DeviceTypesLoadedCopyWithImpl<DeviceTypesLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<DeviceType> types) loaded,
  }) {
    return loaded(types);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<DeviceType> types)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(types);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceTypesIdle value) idle,
    required TResult Function(DeviceTypesLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceTypesIdle value)? idle,
    TResult Function(DeviceTypesLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DeviceTypesLoaded implements DeviceTypesState {
  factory DeviceTypesLoaded({required List<DeviceType> types}) =
      _$DeviceTypesLoaded;

  List<DeviceType> get types => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceTypesLoadedCopyWith<DeviceTypesLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
