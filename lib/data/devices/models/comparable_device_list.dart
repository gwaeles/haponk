import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haponk/domain/devices/entities/device.dart';

part 'comparable_device_list.freezed.dart';
part 'comparable_device_list.g.dart';

@freezed
class ComparableDeviceList with _$ComparableDeviceList {

  const factory ComparableDeviceList({
   required List<ComparableDevice> items,
  }) = _ComparableDeviceList;

  factory ComparableDeviceList.fromJson(Map<String, dynamic> json) => _$ComparableDeviceListFromJson(json);
}
