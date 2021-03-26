class ConfigEntity {
  final String uuid;
  final String baseUrl;
  final String externalUrl;
  final String internalUrl;
  final String locationName;
  final String installationType;
  final bool requiresApiPassword;
  final String version;
  final DateTime lastConnection;
  final String accessToken;

  ConfigEntity(
      {this.uuid,
      this.baseUrl,
      this.externalUrl,
      this.internalUrl,
      this.locationName,
      this.installationType,
      this.requiresApiPassword,
      this.version,
      this.lastConnection,
      this.accessToken});
}
