// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comparable_device_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ComparableDeviceList _$ComparableDeviceListFromJson(Map<String, dynamic> json) {
  return _ComparableDeviceList.fromJson(json);
}

/// @nodoc
mixin _$ComparableDeviceList {
  List<ComparableDevice> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComparableDeviceListCopyWith<ComparableDeviceList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComparableDeviceListCopyWith<$Res> {
  factory $ComparableDeviceListCopyWith(ComparableDeviceList value,
          $Res Function(ComparableDeviceList) then) =
      _$ComparableDeviceListCopyWithImpl<$Res>;
  $Res call({List<ComparableDevice> items});
}

/// @nodoc
class _$ComparableDeviceListCopyWithImpl<$Res>
    implements $ComparableDeviceListCopyWith<$Res> {
  _$ComparableDeviceListCopyWithImpl(this._value, this._then);

  final ComparableDeviceList _value;
  // ignore: unused_field
  final $Res Function(ComparableDeviceList) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ComparableDevice>,
    ));
  }
}

/// @nodoc
abstract class _$$_ComparableDeviceListCopyWith<$Res>
    implements $ComparableDeviceListCopyWith<$Res> {
  factory _$$_ComparableDeviceListCopyWith(_$_ComparableDeviceList value,
          $Res Function(_$_ComparableDeviceList) then) =
      __$$_ComparableDeviceListCopyWithImpl<$Res>;
  @override
  $Res call({List<ComparableDevice> items});
}

/// @nodoc
class __$$_ComparableDeviceListCopyWithImpl<$Res>
    extends _$ComparableDeviceListCopyWithImpl<$Res>
    implements _$$_ComparableDeviceListCopyWith<$Res> {
  __$$_ComparableDeviceListCopyWithImpl(_$_ComparableDeviceList _value,
      $Res Function(_$_ComparableDeviceList) _then)
      : super(_value, (v) => _then(v as _$_ComparableDeviceList));

  @override
  _$_ComparableDeviceList get _value => super._value as _$_ComparableDeviceList;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_$_ComparableDeviceList(
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ComparableDevice>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ComparableDeviceList implements _ComparableDeviceList {
  const _$_ComparableDeviceList({required final List<ComparableDevice> items})
      : _items = items;

  factory _$_ComparableDeviceList.fromJson(Map<String, dynamic> json) =>
      _$$_ComparableDeviceListFromJson(json);

  final List<ComparableDevice> _items;
  @override
  List<ComparableDevice> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ComparableDeviceList(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComparableDeviceList &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$_ComparableDeviceListCopyWith<_$_ComparableDeviceList> get copyWith =>
      __$$_ComparableDeviceListCopyWithImpl<_$_ComparableDeviceList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ComparableDeviceListToJson(
      this,
    );
  }
}

abstract class _ComparableDeviceList implements ComparableDeviceList {
  const factory _ComparableDeviceList(
      {required final List<ComparableDevice> items}) = _$_ComparableDeviceList;

  factory _ComparableDeviceList.fromJson(Map<String, dynamic> json) =
      _$_ComparableDeviceList.fromJson;

  @override
  List<ComparableDevice> get items;
  @override
  @JsonKey(ignore: true)
  _$$_ComparableDeviceListCopyWith<_$_ComparableDeviceList> get copyWith =>
      throw _privateConstructorUsedError;
}
