// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flex_tabs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FlexTabsState {
  Status get status => throw _privateConstructorUsedError;
  List<FlexTab>? get data => throw _privateConstructorUsedError;
  Exception? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlexTabsStateCopyWith<FlexTabsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlexTabsStateCopyWith<$Res> {
  factory $FlexTabsStateCopyWith(
          FlexTabsState value, $Res Function(FlexTabsState) then) =
      _$FlexTabsStateCopyWithImpl<$Res>;
  $Res call({Status status, List<FlexTab>? data, Exception? failure});
}

/// @nodoc
class _$FlexTabsStateCopyWithImpl<$Res>
    implements $FlexTabsStateCopyWith<$Res> {
  _$FlexTabsStateCopyWithImpl(this._value, this._then);

  final FlexTabsState _value;
  // ignore: unused_field
  final $Res Function(FlexTabsState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FlexTab>?,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc
abstract class _$$_FlexTabsStateCopyWith<$Res>
    implements $FlexTabsStateCopyWith<$Res> {
  factory _$$_FlexTabsStateCopyWith(
          _$_FlexTabsState value, $Res Function(_$_FlexTabsState) then) =
      __$$_FlexTabsStateCopyWithImpl<$Res>;
  @override
  $Res call({Status status, List<FlexTab>? data, Exception? failure});
}

/// @nodoc
class __$$_FlexTabsStateCopyWithImpl<$Res>
    extends _$FlexTabsStateCopyWithImpl<$Res>
    implements _$$_FlexTabsStateCopyWith<$Res> {
  __$$_FlexTabsStateCopyWithImpl(
      _$_FlexTabsState _value, $Res Function(_$_FlexTabsState) _then)
      : super(_value, (v) => _then(v as _$_FlexTabsState));

  @override
  _$_FlexTabsState get _value => super._value as _$_FlexTabsState;

  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$_FlexTabsState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FlexTab>?,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_FlexTabsState implements _FlexTabsState {
  _$_FlexTabsState(
      {this.status = Status.initial, final List<FlexTab>? data, this.failure})
      : _data = data;

  @override
  @JsonKey()
  final Status status;
  final List<FlexTab>? _data;
  @override
  List<FlexTab>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Exception? failure;

  @override
  String toString() {
    return 'FlexTabsState(status: $status, data: $data, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlexTabsState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$_FlexTabsStateCopyWith<_$_FlexTabsState> get copyWith =>
      __$$_FlexTabsStateCopyWithImpl<_$_FlexTabsState>(this, _$identity);
}

abstract class _FlexTabsState implements FlexTabsState {
  factory _FlexTabsState(
      {final Status status,
      final List<FlexTab>? data,
      final Exception? failure}) = _$_FlexTabsState;

  @override
  Status get status;
  @override
  List<FlexTab>? get data;
  @override
  Exception? get failure;
  @override
  @JsonKey(ignore: true)
  _$$_FlexTabsStateCopyWith<_$_FlexTabsState> get copyWith =>
      throw _privateConstructorUsedError;
}
