import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/core/hass/models/device_type_converter.dart';
import 'package:drift/drift.dart';

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

extension StateTypeExtension on StateDBO {
  DeviceType? deviceType() {
    final converter = CustomDeviceTypeConverter();

    String? type = entityId?.substring(0, entityId?.indexOf('.'));

    return converter.fromJson(type);
  }
}
