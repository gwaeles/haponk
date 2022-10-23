import 'package:drift/drift.dart';


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
