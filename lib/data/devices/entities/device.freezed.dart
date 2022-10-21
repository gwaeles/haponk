// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return _Device.fromJson(json);
}

/// @nodoc
mixin _$Device {
  String get id => throw _privateConstructorUsedError;
  DeviceType get deviceType => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  DateTime? get lastChanged => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;
  String? get friendlyName => throw _privateConstructorUsedError;
  int? get supportedFeatures => throw _privateConstructorUsedError;
  int? get currentPosition => throw _privateConstructorUsedError;
  DateTime? get lastTriggered => throw _privateConstructorUsedError;
  String? get mode => throw _privateConstructorUsedError;
  double? get temperature => throw _privateConstructorUsedError;
  int? get humidity => throw _privateConstructorUsedError;
  double? get pressure => throw _privateConstructorUsedError;
  double? get windBearing => throw _privateConstructorUsedError;
  double? get windSpeed => throw _privateConstructorUsedError;
  String? get attribution => throw _privateConstructorUsedError;
  bool? get isOn => throw _privateConstructorUsedError;
  String? get deviceClass => throw _privateConstructorUsedError;
  String? get unitOfMeasurement => throw _privateConstructorUsedError;
  int? get current => throw _privateConstructorUsedError;
  int? get voltage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceCopyWith<Device> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) then) =
      _$DeviceCopyWithImpl<$Res>;
  $Res call(
      {String id,
      DeviceType deviceType,
      String? state,
      DateTime? lastChanged,
      DateTime? lastUpdated,
      String? friendlyName,
      int? supportedFeatures,
      int? currentPosition,
      DateTime? lastTriggered,
      String? mode,
      double? temperature,
      int? humidity,
      double? pressure,
      double? windBearing,
      double? windSpeed,
      String? attribution,
      bool? isOn,
      String? deviceClass,
      String? unitOfMeasurement,
      int? current,
      int? voltage});
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res> implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._value, this._then);

  final Device _value;
  // ignore: unused_field
  final $Res Function(Device) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? deviceType = freezed,
    Object? state = freezed,
    Object? lastChanged = freezed,
    Object? lastUpdated = freezed,
    Object? friendlyName = freezed,
    Object? supportedFeatures = freezed,
    Object? currentPosition = freezed,
    Object? lastTriggered = freezed,
    Object? mode = freezed,
    Object? temperature = freezed,
    Object? humidity = freezed,
    Object? pressure = freezed,
    Object? windBearing = freezed,
    Object? windSpeed = freezed,
    Object? attribution = freezed,
    Object? isOn = freezed,
    Object? deviceClass = freezed,
    Object? unitOfMeasurement = freezed,
    Object? current = freezed,
    Object? voltage = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: deviceType == freezed
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as DeviceType,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      lastChanged: lastChanged == freezed
          ? _value.lastChanged
          : lastChanged // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      friendlyName: friendlyName == freezed
          ? _value.friendlyName
          : friendlyName // ignore: cast_nullable_to_non_nullable
              as String?,
      supportedFeatures: supportedFeatures == freezed
          ? _value.supportedFeatures
          : supportedFeatures // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPosition: currentPosition == freezed
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as int?,
      lastTriggered: lastTriggered == freezed
          ? _value.lastTriggered
          : lastTriggered // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int?,
      pressure: pressure == freezed
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double?,
      windBearing: windBearing == freezed
          ? _value.windBearing
          : windBearing // ignore: cast_nullable_to_non_nullable
              as double?,
      windSpeed: windSpeed == freezed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      attribution: attribution == freezed
          ? _value.attribution
          : attribution // ignore: cast_nullable_to_non_nullable
              as String?,
      isOn: isOn == freezed
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool?,
      deviceClass: deviceClass == freezed
          ? _value.deviceClass
          : deviceClass // ignore: cast_nullable_to_non_nullable
              as String?,
      unitOfMeasurement: unitOfMeasurement == freezed
          ? _value.unitOfMeasurement
          : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as String?,
      current: current == freezed
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int?,
      voltage: voltage == freezed
          ? _value.voltage
          : voltage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_DeviceCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$$_DeviceCopyWith(_$_Device value, $Res Function(_$_Device) then) =
      __$$_DeviceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      DeviceType deviceType,
      String? state,
      DateTime? lastChanged,
      DateTime? lastUpdated,
      String? friendlyName,
      int? supportedFeatures,
      int? currentPosition,
      DateTime? lastTriggered,
      String? mode,
      double? temperature,
      int? humidity,
      double? pressure,
      double? windBearing,
      double? windSpeed,
      String? attribution,
      bool? isOn,
      String? deviceClass,
      String? unitOfMeasurement,
      int? current,
      int? voltage});
}

/// @nodoc
class __$$_DeviceCopyWithImpl<$Res> extends _$DeviceCopyWithImpl<$Res>
    implements _$$_DeviceCopyWith<$Res> {
  __$$_DeviceCopyWithImpl(_$_Device _value, $Res Function(_$_Device) _then)
      : super(_value, (v) => _then(v as _$_Device));

  @override
  _$_Device get _value => super._value as _$_Device;

  @override
  $Res call({
    Object? id = freezed,
    Object? deviceType = freezed,
    Object? state = freezed,
    Object? lastChanged = freezed,
    Object? lastUpdated = freezed,
    Object? friendlyName = freezed,
    Object? supportedFeatures = freezed,
    Object? currentPosition = freezed,
    Object? lastTriggered = freezed,
    Object? mode = freezed,
    Object? temperature = freezed,
    Object? humidity = freezed,
    Object? pressure = freezed,
    Object? windBearing = freezed,
    Object? windSpeed = freezed,
    Object? attribution = freezed,
    Object? isOn = freezed,
    Object? deviceClass = freezed,
    Object? unitOfMeasurement = freezed,
    Object? current = freezed,
    Object? voltage = freezed,
  }) {
    return _then(_$_Device(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: deviceType == freezed
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as DeviceType,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      lastChanged: lastChanged == freezed
          ? _value.lastChanged
          : lastChanged // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      friendlyName: friendlyName == freezed
          ? _value.friendlyName
          : friendlyName // ignore: cast_nullable_to_non_nullable
              as String?,
      supportedFeatures: supportedFeatures == freezed
          ? _value.supportedFeatures
          : supportedFeatures // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPosition: currentPosition == freezed
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as int?,
      lastTriggered: lastTriggered == freezed
          ? _value.lastTriggered
          : lastTriggered // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int?,
      pressure: pressure == freezed
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double?,
      windBearing: windBearing == freezed
          ? _value.windBearing
          : windBearing // ignore: cast_nullable_to_non_nullable
              as double?,
      windSpeed: windSpeed == freezed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      attribution: attribution == freezed
          ? _value.attribution
          : attribution // ignore: cast_nullable_to_non_nullable
              as String?,
      isOn: isOn == freezed
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool?,
      deviceClass: deviceClass == freezed
          ? _value.deviceClass
          : deviceClass // ignore: cast_nullable_to_non_nullable
              as String?,
      unitOfMeasurement: unitOfMeasurement == freezed
          ? _value.unitOfMeasurement
          : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as String?,
      current: current == freezed
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int?,
      voltage: voltage == freezed
          ? _value.voltage
          : voltage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Device extends _Device {
  const _$_Device(
      {required this.id,
      this.deviceType = DeviceType.LIGHT,
      this.state,
      this.lastChanged,
      this.lastUpdated,
      this.friendlyName,
      this.supportedFeatures,
      this.currentPosition,
      this.lastTriggered,
      this.mode,
      this.temperature,
      this.humidity,
      this.pressure,
      this.windBearing,
      this.windSpeed,
      this.attribution,
      this.isOn,
      this.deviceClass,
      this.unitOfMeasurement,
      this.current,
      this.voltage})
      : super._();

  factory _$_Device.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final DeviceType deviceType;
  @override
  final String? state;
  @override
  final DateTime? lastChanged;
  @override
  final DateTime? lastUpdated;
  @override
  final String? friendlyName;
  @override
  final int? supportedFeatures;
  @override
  final int? currentPosition;
  @override
  final DateTime? lastTriggered;
  @override
  final String? mode;
  @override
  final double? temperature;
  @override
  final int? humidity;
  @override
  final double? pressure;
  @override
  final double? windBearing;
  @override
  final double? windSpeed;
  @override
  final String? attribution;
  @override
  final bool? isOn;
  @override
  final String? deviceClass;
  @override
  final String? unitOfMeasurement;
  @override
  final int? current;
  @override
  final int? voltage;

  @override
  String toString() {
    return 'Device(id: $id, deviceType: $deviceType, state: $state, lastChanged: $lastChanged, lastUpdated: $lastUpdated, friendlyName: $friendlyName, supportedFeatures: $supportedFeatures, currentPosition: $currentPosition, lastTriggered: $lastTriggered, mode: $mode, temperature: $temperature, humidity: $humidity, pressure: $pressure, windBearing: $windBearing, windSpeed: $windSpeed, attribution: $attribution, isOn: $isOn, deviceClass: $deviceClass, unitOfMeasurement: $unitOfMeasurement, current: $current, voltage: $voltage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Device &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.deviceType, deviceType) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality()
                .equals(other.lastChanged, lastChanged) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdated, lastUpdated) &&
            const DeepCollectionEquality()
                .equals(other.friendlyName, friendlyName) &&
            const DeepCollectionEquality()
                .equals(other.supportedFeatures, supportedFeatures) &&
            const DeepCollectionEquality()
                .equals(other.currentPosition, currentPosition) &&
            const DeepCollectionEquality()
                .equals(other.lastTriggered, lastTriggered) &&
            const DeepCollectionEquality().equals(other.mode, mode) &&
            const DeepCollectionEquality()
                .equals(other.temperature, temperature) &&
            const DeepCollectionEquality().equals(other.humidity, humidity) &&
            const DeepCollectionEquality().equals(other.pressure, pressure) &&
            const DeepCollectionEquality()
                .equals(other.windBearing, windBearing) &&
            const DeepCollectionEquality().equals(other.windSpeed, windSpeed) &&
            const DeepCollectionEquality()
                .equals(other.attribution, attribution) &&
            const DeepCollectionEquality().equals(other.isOn, isOn) &&
            const DeepCollectionEquality()
                .equals(other.deviceClass, deviceClass) &&
            const DeepCollectionEquality()
                .equals(other.unitOfMeasurement, unitOfMeasurement) &&
            const DeepCollectionEquality().equals(other.current, current) &&
            const DeepCollectionEquality().equals(other.voltage, voltage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(deviceType),
        const DeepCollectionEquality().hash(state),
        const DeepCollectionEquality().hash(lastChanged),
        const DeepCollectionEquality().hash(lastUpdated),
        const DeepCollectionEquality().hash(friendlyName),
        const DeepCollectionEquality().hash(supportedFeatures),
        const DeepCollectionEquality().hash(currentPosition),
        const DeepCollectionEquality().hash(lastTriggered),
        const DeepCollectionEquality().hash(mode),
        const DeepCollectionEquality().hash(temperature),
        const DeepCollectionEquality().hash(humidity),
        const DeepCollectionEquality().hash(pressure),
        const DeepCollectionEquality().hash(windBearing),
        const DeepCollectionEquality().hash(windSpeed),
        const DeepCollectionEquality().hash(attribution),
        const DeepCollectionEquality().hash(isOn),
        const DeepCollectionEquality().hash(deviceClass),
        const DeepCollectionEquality().hash(unitOfMeasurement),
        const DeepCollectionEquality().hash(current),
        const DeepCollectionEquality().hash(voltage)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_DeviceCopyWith<_$_Device> get copyWith =>
      __$$_DeviceCopyWithImpl<_$_Device>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceToJson(
      this,
    );
  }
}

abstract class _Device extends Device {
  const factory _Device(
      {required final String id,
      final DeviceType deviceType,
      final String? state,
      final DateTime? lastChanged,
      final DateTime? lastUpdated,
      final String? friendlyName,
      final int? supportedFeatures,
      final int? currentPosition,
      final DateTime? lastTriggered,
      final String? mode,
      final double? temperature,
      final int? humidity,
      final double? pressure,
      final double? windBearing,
      final double? windSpeed,
      final String? attribution,
      final bool? isOn,
      final String? deviceClass,
      final String? unitOfMeasurement,
      final int? current,
      final int? voltage}) = _$_Device;
  const _Device._() : super._();

  factory _Device.fromJson(Map<String, dynamic> json) = _$_Device.fromJson;

  @override
  String get id;
  @override
  DeviceType get deviceType;
  @override
  String? get state;
  @override
  DateTime? get lastChanged;
  @override
  DateTime? get lastUpdated;
  @override
  String? get friendlyName;
  @override
  int? get supportedFeatures;
  @override
  int? get currentPosition;
  @override
  DateTime? get lastTriggered;
  @override
  String? get mode;
  @override
  double? get temperature;
  @override
  int? get humidity;
  @override
  double? get pressure;
  @override
  double? get windBearing;
  @override
  double? get windSpeed;
  @override
  String? get attribution;
  @override
  bool? get isOn;
  @override
  String? get deviceClass;
  @override
  String? get unitOfMeasurement;
  @override
  int? get current;
  @override
  int? get voltage;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceCopyWith<_$_Device> get copyWith =>
      throw _privateConstructorUsedError;
}

ComparableDevice _$ComparableDeviceFromJson(Map<String, dynamic> json) {
  return _ComparableDevice.fromJson(json);
}

/// @nodoc
mixin _$ComparableDevice {
  String get id => throw _privateConstructorUsedError;
  DeviceType get deviceType => throw _privateConstructorUsedError;
  String? get friendlyName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComparableDeviceCopyWith<ComparableDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComparableDeviceCopyWith<$Res> {
  factory $ComparableDeviceCopyWith(
          ComparableDevice value, $Res Function(ComparableDevice) then) =
      _$ComparableDeviceCopyWithImpl<$Res>;
  $Res call({String id, DeviceType deviceType, String? friendlyName});
}

/// @nodoc
class _$ComparableDeviceCopyWithImpl<$Res>
    implements $ComparableDeviceCopyWith<$Res> {
  _$ComparableDeviceCopyWithImpl(this._value, this._then);

  final ComparableDevice _value;
  // ignore: unused_field
  final $Res Function(ComparableDevice) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? deviceType = freezed,
    Object? friendlyName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: deviceType == freezed
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as DeviceType,
      friendlyName: friendlyName == freezed
          ? _value.friendlyName
          : friendlyName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ComparableDeviceCopyWith<$Res>
    implements $ComparableDeviceCopyWith<$Res> {
  factory _$$_ComparableDeviceCopyWith(
          _$_ComparableDevice value, $Res Function(_$_ComparableDevice) then) =
      __$$_ComparableDeviceCopyWithImpl<$Res>;
  @override
  $Res call({String id, DeviceType deviceType, String? friendlyName});
}

/// @nodoc
class __$$_ComparableDeviceCopyWithImpl<$Res>
    extends _$ComparableDeviceCopyWithImpl<$Res>
    implements _$$_ComparableDeviceCopyWith<$Res> {
  __$$_ComparableDeviceCopyWithImpl(
      _$_ComparableDevice _value, $Res Function(_$_ComparableDevice) _then)
      : super(_value, (v) => _then(v as _$_ComparableDevice));

  @override
  _$_ComparableDevice get _value => super._value as _$_ComparableDevice;

  @override
  $Res call({
    Object? id = freezed,
    Object? deviceType = freezed,
    Object? friendlyName = freezed,
  }) {
    return _then(_$_ComparableDevice(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: deviceType == freezed
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as DeviceType,
      friendlyName: friendlyName == freezed
          ? _value.friendlyName
          : friendlyName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ComparableDevice implements _ComparableDevice {
  const _$_ComparableDevice(
      {required this.id,
      this.deviceType = DeviceType.LIGHT,
      this.friendlyName});

  factory _$_ComparableDevice.fromJson(Map<String, dynamic> json) =>
      _$$_ComparableDeviceFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final DeviceType deviceType;
  @override
  final String? friendlyName;

  @override
  String toString() {
    return 'ComparableDevice(id: $id, deviceType: $deviceType, friendlyName: $friendlyName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComparableDevice &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.deviceType, deviceType) &&
            const DeepCollectionEquality()
                .equals(other.friendlyName, friendlyName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(deviceType),
      const DeepCollectionEquality().hash(friendlyName));

  @JsonKey(ignore: true)
  @override
  _$$_ComparableDeviceCopyWith<_$_ComparableDevice> get copyWith =>
      __$$_ComparableDeviceCopyWithImpl<_$_ComparableDevice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ComparableDeviceToJson(
      this,
    );
  }
}

abstract class _ComparableDevice implements ComparableDevice {
  const factory _ComparableDevice(
      {required final String id,
      final DeviceType deviceType,
      final String? friendlyName}) = _$_ComparableDevice;

  factory _ComparableDevice.fromJson(Map<String, dynamic> json) =
      _$_ComparableDevice.fromJson;

  @override
  String get id;
  @override
  DeviceType get deviceType;
  @override
  String? get friendlyName;
  @override
  @JsonKey(ignore: true)
  _$$_ComparableDeviceCopyWith<_$_ComparableDevice> get copyWith =>
      throw _privateConstructorUsedError;
}
