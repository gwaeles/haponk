// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flex_tab.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlexTab _$FlexTabFromJson(Map<String, dynamic> json) {
  return _FlexTab.fromJson(json);
}

/// @nodoc
mixin _$FlexTab {
  int? get id => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlexTabCopyWith<FlexTab> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlexTabCopyWith<$Res> {
  factory $FlexTabCopyWith(FlexTab value, $Res Function(FlexTab) then) =
      _$FlexTabCopyWithImpl<$Res>;
  $Res call({int? id, String? label});
}

/// @nodoc
class _$FlexTabCopyWithImpl<$Res> implements $FlexTabCopyWith<$Res> {
  _$FlexTabCopyWithImpl(this._value, this._then);

  final FlexTab _value;
  // ignore: unused_field
  final $Res Function(FlexTab) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_FlexTabCopyWith<$Res> implements $FlexTabCopyWith<$Res> {
  factory _$$_FlexTabCopyWith(
          _$_FlexTab value, $Res Function(_$_FlexTab) then) =
      __$$_FlexTabCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? label});
}

/// @nodoc
class __$$_FlexTabCopyWithImpl<$Res> extends _$FlexTabCopyWithImpl<$Res>
    implements _$$_FlexTabCopyWith<$Res> {
  __$$_FlexTabCopyWithImpl(_$_FlexTab _value, $Res Function(_$_FlexTab) _then)
      : super(_value, (v) => _then(v as _$_FlexTab));

  @override
  _$_FlexTab get _value => super._value as _$_FlexTab;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
  }) {
    return _then(_$_FlexTab(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlexTab implements _FlexTab {
  const _$_FlexTab({this.id, this.label});

  factory _$_FlexTab.fromJson(Map<String, dynamic> json) =>
      _$$_FlexTabFromJson(json);

  @override
  final int? id;
  @override
  final String? label;

  @override
  String toString() {
    return 'FlexTab(id: $id, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlexTab &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.label, label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(label));

  @JsonKey(ignore: true)
  @override
  _$$_FlexTabCopyWith<_$_FlexTab> get copyWith =>
      __$$_FlexTabCopyWithImpl<_$_FlexTab>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlexTabToJson(
      this,
    );
  }
}

abstract class _FlexTab implements FlexTab {
  const factory _FlexTab({final int? id, final String? label}) = _$_FlexTab;

  factory _FlexTab.fromJson(Map<String, dynamic> json) = _$_FlexTab.fromJson;

  @override
  int? get id;
  @override
  String? get label;
  @override
  @JsonKey(ignore: true)
  _$$_FlexTabCopyWith<_$_FlexTab> get copyWith =>
      throw _privateConstructorUsedError;
}

FlexTabList _$FlexTabListFromJson(Map<String, dynamic> json) {
  return _FlexTabList.fromJson(json);
}

/// @nodoc
mixin _$FlexTabList {
  List<FlexTab> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlexTabListCopyWith<FlexTabList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlexTabListCopyWith<$Res> {
  factory $FlexTabListCopyWith(
          FlexTabList value, $Res Function(FlexTabList) then) =
      _$FlexTabListCopyWithImpl<$Res>;
  $Res call({List<FlexTab> items});
}

/// @nodoc
class _$FlexTabListCopyWithImpl<$Res> implements $FlexTabListCopyWith<$Res> {
  _$FlexTabListCopyWithImpl(this._value, this._then);

  final FlexTabList _value;
  // ignore: unused_field
  final $Res Function(FlexTabList) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FlexTab>,
    ));
  }
}

/// @nodoc
abstract class _$$_FlexTabListCopyWith<$Res>
    implements $FlexTabListCopyWith<$Res> {
  factory _$$_FlexTabListCopyWith(
          _$_FlexTabList value, $Res Function(_$_FlexTabList) then) =
      __$$_FlexTabListCopyWithImpl<$Res>;
  @override
  $Res call({List<FlexTab> items});
}

/// @nodoc
class __$$_FlexTabListCopyWithImpl<$Res> extends _$FlexTabListCopyWithImpl<$Res>
    implements _$$_FlexTabListCopyWith<$Res> {
  __$$_FlexTabListCopyWithImpl(
      _$_FlexTabList _value, $Res Function(_$_FlexTabList) _then)
      : super(_value, (v) => _then(v as _$_FlexTabList));

  @override
  _$_FlexTabList get _value => super._value as _$_FlexTabList;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_$_FlexTabList(
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FlexTab>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlexTabList implements _FlexTabList {
  const _$_FlexTabList({required final List<FlexTab> items}) : _items = items;

  factory _$_FlexTabList.fromJson(Map<String, dynamic> json) =>
      _$$_FlexTabListFromJson(json);

  final List<FlexTab> _items;
  @override
  List<FlexTab> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'FlexTabList(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlexTabList &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$_FlexTabListCopyWith<_$_FlexTabList> get copyWith =>
      __$$_FlexTabListCopyWithImpl<_$_FlexTabList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlexTabListToJson(
      this,
    );
  }
}

abstract class _FlexTabList implements FlexTabList {
  const factory _FlexTabList({required final List<FlexTab> items}) =
      _$_FlexTabList;

  factory _FlexTabList.fromJson(Map<String, dynamic> json) =
      _$_FlexTabList.fromJson;

  @override
  List<FlexTab> get items;
  @override
  @JsonKey(ignore: true)
  _$$_FlexTabListCopyWith<_$_FlexTabList> get copyWith =>
      throw _privateConstructorUsedError;
}
