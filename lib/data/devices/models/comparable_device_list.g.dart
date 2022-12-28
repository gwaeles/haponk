// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comparable_device_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComparableDeviceList _$$_ComparableDeviceListFromJson(
        Map<String, dynamic> json) =>
    _$_ComparableDeviceList(
      items: (json['items'] as List<dynamic>)
          .map((e) => ComparableDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ComparableDeviceListToJson(
        _$_ComparableDeviceList instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
