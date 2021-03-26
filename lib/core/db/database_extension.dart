import 'package:moor_flutter/moor_flutter.dart';

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