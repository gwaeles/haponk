import 'package:hapoc/features/config/entities/config_entity.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'database.dart';

extension StringValueExtension on String {
  Value toValue() {
    
    return Value<String>(this);
  }
}

extension IntValueExtension on int {
  Value toValue() {
    
    return Value<int>(this);
  }
}

extension DoubleValueExtension on double {
  Value toValue() {
    
    return Value<double>(this);
  }
}

extension DateTimeValueExtension on DateTime {
  Value toValue() {
    
    return Value<DateTime>(this);
  }
}

extension BoolValueExtension on bool {
  Value toValue() {
    
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
      lastConnection: this.lastConnection
    );
  }
}