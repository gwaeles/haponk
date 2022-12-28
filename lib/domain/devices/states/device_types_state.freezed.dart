// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device_types_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeviceTypesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<DeviceType> types) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<DeviceType> types)? loaded,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeviceTypesIdle value)? idle,
    TResult Function(DeviceTypesLoaded value)? loaded,
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
abstract class _$$DeviceTypesIdleCopyWith<$Res> {
  factory _$$DeviceTypesIdleCopyWith(
          _$DeviceTypesIdle value, $Res Function(_$DeviceTypesIdle) then) =
      __$$DeviceTypesIdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeviceTypesIdleCopyWithImpl<$Res>
    extends _$DeviceTypesStateCopyWithImpl<$Res>
    implements _$$DeviceTypesIdleCopyWith<$Res> {
  __$$DeviceTypesIdleCopyWithImpl(
      _$DeviceTypesIdle _value, $Res Function(_$DeviceTypesIdle) _then)
      : super(_value, (v) => _then(v as _$DeviceTypesIdle));

  @override
  _$DeviceTypesIdle get _value => super._value as _$DeviceTypesIdle;
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeviceTypesIdle);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<DeviceType> types)? loaded,
  }) {
    return idle?.call();
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeviceTypesIdle value)? idle,
    TResult Function(DeviceTypesLoaded value)? loaded,
  }) {
    return idle?.call(this);
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
abstract class _$$DeviceTypesLoadedCopyWith<$Res> {
  factory _$$DeviceTypesLoadedCopyWith(
          _$DeviceTypesLoaded value, $Res Function(_$DeviceTypesLoaded) then) =
      __$$DeviceTypesLoadedCopyWithImpl<$Res>;
  $Res call({List<DeviceType> types});
}

/// @nodoc
class __$$DeviceTypesLoadedCopyWithImpl<$Res>
    extends _$DeviceTypesStateCopyWithImpl<$Res>
    implements _$$DeviceTypesLoadedCopyWith<$Res> {
  __$$DeviceTypesLoadedCopyWithImpl(
      _$DeviceTypesLoaded _value, $Res Function(_$DeviceTypesLoaded) _then)
      : super(_value, (v) => _then(v as _$DeviceTypesLoaded));

  @override
  _$DeviceTypesLoaded get _value => super._value as _$DeviceTypesLoaded;

  @override
  $Res call({
    Object? types = freezed,
  }) {
    return _then(_$DeviceTypesLoaded(
      types: types == freezed
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<DeviceType>,
    ));
  }
}

/// @nodoc

class _$DeviceTypesLoaded implements DeviceTypesLoaded {
  _$DeviceTypesLoaded({required final List<DeviceType> types}) : _types = types;

  final List<DeviceType> _types;
  @override
  List<DeviceType> get types {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  String toString() {
    return 'DeviceTypesState.loaded(types: $types)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceTypesLoaded &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  _$$DeviceTypesLoadedCopyWith<_$DeviceTypesLoaded> get copyWith =>
      __$$DeviceTypesLoadedCopyWithImpl<_$DeviceTypesLoaded>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<DeviceType> types)? loaded,
  }) {
    return loaded?.call(types);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeviceTypesIdle value)? idle,
    TResult Function(DeviceTypesLoaded value)? loaded,
  }) {
    return loaded?.call(this);
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
  factory DeviceTypesLoaded({required final List<DeviceType> types}) =
      _$DeviceTypesLoaded;

  List<DeviceType> get types;
  @JsonKey(ignore: true)
  _$$DeviceTypesLoadedCopyWith<_$DeviceTypesLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
