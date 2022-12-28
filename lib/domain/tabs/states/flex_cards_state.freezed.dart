// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flex_cards_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FlexCardsState {
  Status get status => throw _privateConstructorUsedError;
  int get tabId => throw _privateConstructorUsedError;
  List<FlexCard>? get data => throw _privateConstructorUsedError;
  Exception? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlexCardsStateCopyWith<FlexCardsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlexCardsStateCopyWith<$Res> {
  factory $FlexCardsStateCopyWith(
          FlexCardsState value, $Res Function(FlexCardsState) then) =
      _$FlexCardsStateCopyWithImpl<$Res>;
  $Res call(
      {Status status, int tabId, List<FlexCard>? data, Exception? failure});
}

/// @nodoc
class _$FlexCardsStateCopyWithImpl<$Res>
    implements $FlexCardsStateCopyWith<$Res> {
  _$FlexCardsStateCopyWithImpl(this._value, this._then);

  final FlexCardsState _value;
  // ignore: unused_field
  final $Res Function(FlexCardsState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? tabId = freezed,
    Object? data = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      tabId: tabId == freezed
          ? _value.tabId
          : tabId // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FlexCard>?,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc
abstract class _$$_FlexCardsStateCopyWith<$Res>
    implements $FlexCardsStateCopyWith<$Res> {
  factory _$$_FlexCardsStateCopyWith(
          _$_FlexCardsState value, $Res Function(_$_FlexCardsState) then) =
      __$$_FlexCardsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Status status, int tabId, List<FlexCard>? data, Exception? failure});
}

/// @nodoc
class __$$_FlexCardsStateCopyWithImpl<$Res>
    extends _$FlexCardsStateCopyWithImpl<$Res>
    implements _$$_FlexCardsStateCopyWith<$Res> {
  __$$_FlexCardsStateCopyWithImpl(
      _$_FlexCardsState _value, $Res Function(_$_FlexCardsState) _then)
      : super(_value, (v) => _then(v as _$_FlexCardsState));

  @override
  _$_FlexCardsState get _value => super._value as _$_FlexCardsState;

  @override
  $Res call({
    Object? status = freezed,
    Object? tabId = freezed,
    Object? data = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$_FlexCardsState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      tabId: tabId == freezed
          ? _value.tabId
          : tabId // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FlexCard>?,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_FlexCardsState implements _FlexCardsState {
  _$_FlexCardsState(
      {this.status = Status.initial,
      required this.tabId,
      final List<FlexCard>? data,
      this.failure})
      : _data = data;

  @override
  @JsonKey()
  final Status status;
  @override
  final int tabId;
  final List<FlexCard>? _data;
  @override
  List<FlexCard>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Exception? failure;

  @override
  String toString() {
    return 'FlexCardsState(status: $status, tabId: $tabId, data: $data, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlexCardsState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.tabId, tabId) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(tabId),
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$_FlexCardsStateCopyWith<_$_FlexCardsState> get copyWith =>
      __$$_FlexCardsStateCopyWithImpl<_$_FlexCardsState>(this, _$identity);
}

abstract class _FlexCardsState implements FlexCardsState {
  factory _FlexCardsState(
      {final Status status,
      required final int tabId,
      final List<FlexCard>? data,
      final Exception? failure}) = _$_FlexCardsState;

  @override
  Status get status;
  @override
  int get tabId;
  @override
  List<FlexCard>? get data;
  @override
  Exception? get failure;
  @override
  @JsonKey(ignore: true)
  _$$_FlexCardsStateCopyWith<_$_FlexCardsState> get copyWith =>
      throw _privateConstructorUsedError;
}
