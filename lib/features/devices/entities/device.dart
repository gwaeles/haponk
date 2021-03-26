class Device {
  final int id;
  final String entityId;
  final String state;
  final DateTime lastChanged;
  final DateTime lastUpdated;
  final String friendlyName;
  final int supportedFeatures;
  final int currentPosition;
  final DateTime lastTriggered;
  final String mode;
  final double temperature;
  final int humidity;
  final double pressure;
  final double windBearing;
  final double windSpeed;
  final String attribution;
  final bool isOn;
  final String deviceClass;
  final String unitOfMeasurement;
  final int current;
  final int voltage;

  Device(
      {this.id,
      this.entityId,
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
      this.voltage});
}
