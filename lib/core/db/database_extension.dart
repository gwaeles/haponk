import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/core/hass/models/device_type_converter.dart';
import 'package:haponk/data/config/entities/config_entity.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'database.dart';

extension StringValueExtension on String {
  Value<String> toValue() {
    return Value<String>(this);
  }
}

extension IntValueExtension on int {
  Value<int> toValue() {
    return Value<int>(this);
  }
}

extension DoubleValueExtension on double {
  Value<double> toValue() {
    return Value<double>(this);
  }
}

extension DateTimeValueExtension on DateTime {
  Value<DateTime> toValue() {
    return Value<DateTime>(this);
  }
}

extension BoolValueExtension on bool {
  Value<bool> toValue() {
    return Value<bool>(this);
  }
}

extension ConfigEntityExtension on Config {
  ConfigEntity toEntity() {
    return ConfigEntity(
        uuid: this.uuid,
        baseUrl: this.baseUrl,
        externalUrl: this.externalUrl,
        internalUrl: this.internalUrl,
        locationName: this.locationName,
        installationType: this.installationType,
        requiresApiPassword: this.requiresApiPassword,
        version: this.version,
        lastConnection: this.lastConnection);
  }
}

extension StateTypeExtension on State {
  DeviceType? deviceType() {
    final converter = CustomDeviceTypeConverter();

    String? type = entityId?.substring(0, entityId?.indexOf('.'));

    return converter.fromJson(type);
  }
}
