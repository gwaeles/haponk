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
  Config? get config => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config? config) idle,
    required TResult Function(Config? config) requesting,
    required TResult Function(Config? config) validated,
    required TResult Function(Config? config) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Config? config)? idle,
    TResult Function(Config? config)? requesting,
    TResult Function(Config? config)? validated,
    TResult Function(Config? config)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config? config)? idle,
    TResult Function(Config? config)? requesting,
    TResult Function(Config? config)? validated,
    TResult Function(Config? config)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConfigStateIdle value) idle,
    required TResult Function(ConfigStateRequesting value) requesting,
    required TResult Function(ConfigStateValidated value) validated,
    required TResult Function(ConfigStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ConfigStateIdle value)? idle,
    TResult Function(ConfigStateRequesting value)? requesting,
    TResult Function(ConfigStateValidated value)? validated,
    TResult Function(ConfigStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConfigStateIdle value)? idle,
    TResult Function(ConfigStateRequesting value)? requesting,
    TResult Function(ConfigStateValidated value)? validated,
    TResult Function(ConfigStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfigStateCopyWith<ConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigStateCopyWith<$Res> {
  factory $ConfigStateCopyWith(
          ConfigState value, $Res Function(ConfigState) then) =
      _$ConfigStateCopyWithImpl<$Res>;
  $Res call({Config? config});

  $ConfigCopyWith<$Res>? get config;
}

/// @nodoc
class _$ConfigStateCopyWithImpl<$Res> implements $ConfigStateCopyWith<$Res> {
  _$ConfigStateCopyWithImpl(this._value, this._then);

  final ConfigState _value;
  // ignore: unused_field
  final $Res Function(ConfigState) _then;

  @override
  $Res call({
    Object? config = freezed,
  }) {
    return _then(_value.copyWith(
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config?,
    ));
  }

  @override
  $ConfigCopyWith<$Res>? get config {
    if (_value.config == null) {
      return null;
    }

    return $ConfigCopyWith<$Res>(_value.config!, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc
abstract class _$$ConfigStateIdleCopyWith<$Res>
    implements $ConfigStateCopyWith<$Res> {
  factory _$$ConfigStateIdleCopyWith(
          _$ConfigStateIdle value, $Res Function(_$ConfigStateIdle) then) =
      __$$ConfigStateIdleCopyWithImpl<$Res>;
  @override
  $Res call({Config? config});

  @override
  $ConfigCopyWith<$Res>? get config;
}

/// @nodoc
class __$$ConfigStateIdleCopyWithImpl<$Res>
    extends _$ConfigStateCopyWithImpl<$Res>
    implements _$$ConfigStateIdleCopyWith<$Res> {
  __$$ConfigStateIdleCopyWithImpl(
      _$ConfigStateIdle _value, $Res Function(_$ConfigStateIdle) _then)
      : super(_value, (v) => _then(v as _$ConfigStateIdle));

  @override
  _$ConfigStateIdle get _value => super._value as _$ConfigStateIdle;

  @override
  $Res call({
    Object? config = freezed,
  }) {
    return _then(_$ConfigStateIdle(
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config?,
    ));
  }
}

/// @nodoc

class _$ConfigStateIdle implements ConfigStateIdle {
  _$ConfigStateIdle({this.config});

  @override
  final Config? config;

  @override
  String toString() {
    return 'ConfigState.idle(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigStateIdle &&
            const DeepCollectionEquality().equals(other.config, config));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(config));

  @JsonKey(ignore: true)
  @override
  _$$ConfigStateIdleCopyWith<_$ConfigStateIdle> get copyWith =>
      __$$ConfigStateIdleCopyWithImpl<_$ConfigStateIdle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config? config) idle,
    required TResult Function(Config? config) requesting,
    required TResult Function(Config? config) validated,
    required TResult Function(Config? config) error,
  }) {
    return idle(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Config? config)? idle,
    TResult Function(Config? config)? requesting,
    TResult Function(Config? config)? validated,
    TResult Function(Config? config)? error,
  }) {
    return idle?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config? config)? idle,
    TResult Function(Config? config)? requesting,
    TResult Function(Config? config)? validated,
    TResult Function(Config? config)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConfigStateIdle value) idle,
    required TResult Function(ConfigStateRequesting value) requesting,
    required TResult Function(ConfigStateValidated value) validated,
    required TResult Function(ConfigStateError value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ConfigStateIdle value)? idle,
    TResult Function(ConfigStateRequesting value)? requesting,
    TResult Function(ConfigStateValidated value)? validated,
    TResult Function(ConfigStateError value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConfigStateIdle value)? idle,
    TResult Function(ConfigStateRequesting value)? requesting,
    TResult Function(ConfigStateValidated value)? validated,
    TResult Function(ConfigStateError value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class ConfigStateIdle implements ConfigState {
  factory ConfigStateIdle({final Config? config}) = _$ConfigStateIdle;

  @override
  Config? get config;
  @override
  @JsonKey(ignore: true)
  _$$ConfigStateIdleCopyWith<_$ConfigStateIdle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfigStateRequestingCopyWith<$Res>
    implements $ConfigStateCopyWith<$Res> {
  factory _$$ConfigStateRequestingCopyWith(_$ConfigStateRequesting value,
          $Res Function(_$ConfigStateRequesting) then) =
      __$$ConfigStateRequestingCopyWithImpl<$Res>;
  @override
  $Res call({Config? config});

  @override
  $ConfigCopyWith<$Res>? get config;
}

/// @nodoc
class __$$ConfigStateRequestingCopyWithImpl<$Res>
    extends _$ConfigStateCopyWithImpl<$Res>
    implements _$$ConfigStateRequestingCopyWith<$Res> {
  __$$ConfigStateRequestingCopyWithImpl(_$ConfigStateRequesting _value,
      $Res Function(_$ConfigStateRequesting) _then)
      : super(_value, (v) => _then(v as _$ConfigStateRequesting));

  @override
  _$ConfigStateRequesting get _value => super._value as _$ConfigStateRequesting;

  @override
  $Res call({
    Object? config = freezed,
  }) {
    return _then(_$ConfigStateRequesting(
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config?,
    ));
  }
}

/// @nodoc

class _$ConfigStateRequesting implements ConfigStateRequesting {
  _$ConfigStateRequesting({this.config});

  @override
  final Config? config;

  @override
  String toString() {
    return 'ConfigState.requesting(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigStateRequesting &&
            const DeepCollectionEquality().equals(other.config, config));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(config));

  @JsonKey(ignore: true)
  @override
  _$$ConfigStateRequestingCopyWith<_$ConfigStateRequesting> get copyWith =>
      __$$ConfigStateRequestingCopyWithImpl<_$ConfigStateRequesting>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config? config) idle,
    required TResult Function(Config? config) requesting,
    required TResult Function(Config? config) validated,
    required TResult Function(Config? config) error,
  }) {
    return requesting(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Config? config)? idle,
    TResult Function(Config? config)? requesting,
    TResult Function(Config? config)? validated,
    TResult Function(Config? config)? error,
  }) {
    return requesting?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config? config)? idle,
    TResult Function(Config? config)? requesting,
    TResult Function(Config? config)? validated,
    TResult Function(Config? config)? error,
    required TResult orElse(),
  }) {
    if (requesting != null) {
      return requesting(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConfigStateIdle value) idle,
    required TResult Function(ConfigStateRequesting value) requesting,
    required TResult Function(ConfigStateValidated value) validated,
    required TResult Function(ConfigStateError value) error,
  }) {
    return requesting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ConfigStateIdle value)? idle,
    TResult Function(ConfigStateRequesting value)? requesting,
    TResult Function(ConfigStateValidated value)? validated,
    TResult Function(ConfigStateError value)? error,
  }) {
    return requesting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConfigStateIdle value)? idle,
    TResult Function(ConfigStateRequesting value)? requesting,
    TResult Function(ConfigStateValidated value)? validated,
    TResult Function(ConfigStateError value)? error,
    required TResult orElse(),
  }) {
    if (requesting != null) {
      return requesting(this);
    }
    return orElse();
  }
}

abstract class ConfigStateRequesting implements ConfigState {
  factory ConfigStateRequesting({final Config? config}) =
      _$ConfigStateRequesting;

  @override
  Config? get config;
  @override
  @JsonKey(ignore: true)
  _$$ConfigStateRequestingCopyWith<_$ConfigStateRequesting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfigStateValidatedCopyWith<$Res>
    implements $ConfigStateCopyWith<$Res> {
  factory _$$ConfigStateValidatedCopyWith(_$ConfigStateValidated value,
          $Res Function(_$ConfigStateValidated) then) =
      __$$ConfigStateValidatedCopyWithImpl<$Res>;
  @override
  $Res call({Config? config});

  @override
  $ConfigCopyWith<$Res>? get config;
}

/// @nodoc
class __$$ConfigStateValidatedCopyWithImpl<$Res>
    extends _$ConfigStateCopyWithImpl<$Res>
    implements _$$ConfigStateValidatedCopyWith<$Res> {
  __$$ConfigStateValidatedCopyWithImpl(_$ConfigStateValidated _value,
      $Res Function(_$ConfigStateValidated) _then)
      : super(_value, (v) => _then(v as _$ConfigStateValidated));

  @override
  _$ConfigStateValidated get _value => super._value as _$ConfigStateValidated;

  @override
  $Res call({
    Object? config = freezed,
  }) {
    return _then(_$ConfigStateValidated(
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config?,
    ));
  }
}

/// @nodoc

class _$ConfigStateValidated implements ConfigStateValidated {
  _$ConfigStateValidated({this.config});

  @override
  final Config? config;

  @override
  String toString() {
    return 'ConfigState.validated(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigStateValidated &&
            const DeepCollectionEquality().equals(other.config, config));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(config));

  @JsonKey(ignore: true)
  @override
  _$$ConfigStateValidatedCopyWith<_$ConfigStateValidated> get copyWith =>
      __$$ConfigStateValidatedCopyWithImpl<_$ConfigStateValidated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config? config) idle,
    required TResult Function(Config? config) requesting,
    required TResult Function(Config? config) validated,
    required TResult Function(Config? config) error,
  }) {
    return validated(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Config? config)? idle,
    TResult Function(Config? config)? requesting,
    TResult Function(Config? config)? validated,
    TResult Function(Config? config)? error,
  }) {
    return validated?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config? config)? idle,
    TResult Function(Config? config)? requesting,
    TResult Function(Config? config)? validated,
    TResult Function(Config? config)? error,
    required TResult orElse(),
  }) {
    if (validated != null) {
      return validated(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConfigStateIdle value) idle,
    required TResult Function(ConfigStateRequesting value) requesting,
    required TResult Function(ConfigStateValidated value) validated,
    required TResult Function(ConfigStateError value) error,
  }) {
    return validated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ConfigStateIdle value)? idle,
    TResult Function(ConfigStateRequesting value)? requesting,
    TResult Function(ConfigStateValidated value)? validated,
    TResult Function(ConfigStateError value)? error,
  }) {
    return validated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConfigStateIdle value)? idle,
    TResult Function(ConfigStateRequesting value)? requesting,
    TResult Function(ConfigStateValidated value)? validated,
    TResult Function(ConfigStateError value)? error,
    required TResult orElse(),
  }) {
    if (validated != null) {
      return validated(this);
    }
    return orElse();
  }
}

abstract class ConfigStateValidated implements ConfigState {
  factory ConfigStateValidated({final Config? config}) = _$ConfigStateValidated;

  @override
  Config? get config;
  @override
  @JsonKey(ignore: true)
  _$$ConfigStateValidatedCopyWith<_$ConfigStateValidated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfigStateErrorCopyWith<$Res>
    implements $ConfigStateCopyWith<$Res> {
  factory _$$ConfigStateErrorCopyWith(
          _$ConfigStateError value, $Res Function(_$ConfigStateError) then) =
      __$$ConfigStateErrorCopyWithImpl<$Res>;
  @override
  $Res call({Config? config});

  @override
  $ConfigCopyWith<$Res>? get config;
}

/// @nodoc
class __$$ConfigStateErrorCopyWithImpl<$Res>
    extends _$ConfigStateCopyWithImpl<$Res>
    implements _$$ConfigStateErrorCopyWith<$Res> {
  __$$ConfigStateErrorCopyWithImpl(
      _$ConfigStateError _value, $Res Function(_$ConfigStateError) _then)
      : super(_value, (v) => _then(v as _$ConfigStateError));

  @override
  _$ConfigStateError get _value => super._value as _$ConfigStateError;

  @override
  $Res call({
    Object? config = freezed,
  }) {
    return _then(_$ConfigStateError(
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Config?,
    ));
  }
}

/// @nodoc

class _$ConfigStateError implements ConfigStateError {
  _$ConfigStateError({this.config});

  @override
  final Config? config;

  @override
  String toString() {
    return 'ConfigState.error(config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigStateError &&
            const DeepCollectionEquality().equals(other.config, config));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(config));

  @JsonKey(ignore: true)
  @override
  _$$ConfigStateErrorCopyWith<_$ConfigStateError> get copyWith =>
      __$$ConfigStateErrorCopyWithImpl<_$ConfigStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Config? config) idle,
    required TResult Function(Config? config) requesting,
    required TResult Function(Config? config) validated,
    required TResult Function(Config? config) error,
  }) {
    return error(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Config? config)? idle,
    TResult Function(Config? config)? requesting,
    TResult Function(Config? config)? validated,
    TResult Function(Config? config)? error,
  }) {
    return error?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Config? config)? idle,
    TResult Function(Config? config)? requesting,
    TResult Function(Config? config)? validated,
    TResult Function(Config? config)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConfigStateIdle value) idle,
    required TResult Function(ConfigStateRequesting value) requesting,
    required TResult Function(ConfigStateValidated value) validated,
    required TResult Function(ConfigStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ConfigStateIdle value)? idle,
    TResult Function(ConfigStateRequesting value)? requesting,
    TResult Function(ConfigStateValidated value)? validated,
    TResult Function(ConfigStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConfigStateIdle value)? idle,
    TResult Function(ConfigStateRequesting value)? requesting,
    TResult Function(ConfigStateValidated value)? validated,
    TResult Function(ConfigStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ConfigStateError implements ConfigState {
  factory ConfigStateError({final Config? config}) = _$ConfigStateError;

  @override
  Config? get config;
  @override
  @JsonKey(ignore: true)
  _$$ConfigStateErrorCopyWith<_$ConfigStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
