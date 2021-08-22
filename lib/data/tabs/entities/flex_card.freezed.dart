// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'flex_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FlexCardTearOff {
  const _$FlexCardTearOff();

  _FlexCard call(
      {required int id,
      required int tabId,
      String type = 'deft',
      int? stateId,
      int? parentId,
      required int position,
      List<FlexCard>? children}) {
    return _FlexCard(
      id: id,
      tabId: tabId,
      type: type,
      stateId: stateId,
      parentId: parentId,
      position: position,
      children: children,
    );
  }
}

/// @nodoc
const $FlexCard = _$FlexCardTearOff();

/// @nodoc
mixin _$FlexCard {
  int get id => throw _privateConstructorUsedError;
  int get tabId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int? get stateId => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  int get position =>
      throw _privateConstructorUsedError; // @Default(1) int horizontalFlex,
// @Default(0) int verticalFlex,
// @Default(0) int width,
// @Default(0) int height,
  List<FlexCard>? get children => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlexCardCopyWith<FlexCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlexCardCopyWith<$Res> {
  factory $FlexCardCopyWith(FlexCard value, $Res Function(FlexCard) then) =
      _$FlexCardCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int tabId,
      String type,
      int? stateId,
      int? parentId,
      int position,
      List<FlexCard>? children});
}

/// @nodoc
class _$FlexCardCopyWithImpl<$Res> implements $FlexCardCopyWith<$Res> {
  _$FlexCardCopyWithImpl(this._value, this._then);

  final FlexCard _value;
  // ignore: unused_field
  final $Res Function(FlexCard) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? tabId = freezed,
    Object? type = freezed,
    Object? stateId = freezed,
    Object? parentId = freezed,
    Object? position = freezed,
    Object? children = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tabId: tabId == freezed
          ? _value.tabId
          : tabId // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      stateId: stateId == freezed
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<FlexCard>?,
    ));
  }
}

/// @nodoc
abstract class _$FlexCardCopyWith<$Res> implements $FlexCardCopyWith<$Res> {
  factory _$FlexCardCopyWith(_FlexCard value, $Res Function(_FlexCard) then) =
      __$FlexCardCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int tabId,
      String type,
      int? stateId,
      int? parentId,
      int position,
      List<FlexCard>? children});
}

/// @nodoc
class __$FlexCardCopyWithImpl<$Res> extends _$FlexCardCopyWithImpl<$Res>
    implements _$FlexCardCopyWith<$Res> {
  __$FlexCardCopyWithImpl(_FlexCard _value, $Res Function(_FlexCard) _then)
      : super(_value, (v) => _then(v as _FlexCard));

  @override
  _FlexCard get _value => super._value as _FlexCard;

  @override
  $Res call({
    Object? id = freezed,
    Object? tabId = freezed,
    Object? type = freezed,
    Object? stateId = freezed,
    Object? parentId = freezed,
    Object? position = freezed,
    Object? children = freezed,
  }) {
    return _then(_FlexCard(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tabId: tabId == freezed
          ? _value.tabId
          : tabId // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      stateId: stateId == freezed
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<FlexCard>?,
    ));
  }
}

/// @nodoc

class _$_FlexCard extends _FlexCard {
  const _$_FlexCard(
      {required this.id,
      required this.tabId,
      this.type = 'deft',
      this.stateId,
      this.parentId,
      required this.position,
      this.children})
      : super._();

  @override
  final int id;
  @override
  final int tabId;
  @JsonKey(defaultValue: 'deft')
  @override
  final String type;
  @override
  final int? stateId;
  @override
  final int? parentId;
  @override
  final int position;
  @override // @Default(1) int horizontalFlex,
// @Default(0) int verticalFlex,
// @Default(0) int width,
// @Default(0) int height,
  final List<FlexCard>? children;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FlexCard &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.tabId, tabId) ||
                const DeepCollectionEquality().equals(other.tabId, tabId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.stateId, stateId) ||
                const DeepCollectionEquality()
                    .equals(other.stateId, stateId)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality()
                    .equals(other.children, children)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(tabId) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(stateId) ^
      const DeepCollectionEquality().hash(parentId) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(children);

  @JsonKey(ignore: true)
  @override
  _$FlexCardCopyWith<_FlexCard> get copyWith =>
      __$FlexCardCopyWithImpl<_FlexCard>(this, _$identity);
}

abstract class _FlexCard extends FlexCard {
  const factory _FlexCard(
      {required int id,
      required int tabId,
      String type,
      int? stateId,
      int? parentId,
      required int position,
      List<FlexCard>? children}) = _$_FlexCard;
  const _FlexCard._() : super._();

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get tabId => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  int? get stateId => throw _privateConstructorUsedError;
  @override
  int? get parentId => throw _privateConstructorUsedError;
  @override
  int get position => throw _privateConstructorUsedError;
  @override // @Default(1) int horizontalFlex,
// @Default(0) int verticalFlex,
// @Default(0) int width,
// @Default(0) int height,
  List<FlexCard>? get children => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FlexCardCopyWith<_FlexCard> get copyWith =>
      throw _privateConstructorUsedError;
}
