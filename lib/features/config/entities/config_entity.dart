import 'package:equatable/equatable.dart';

class ConfigEntity extends Equatable {
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

  ConfigEntity copyWith({
      String uuid,
      String baseUrl,
      String externalUrl,
      String internalUrl,
      String locationName,
      String installationType,
      bool requiresApiPassword,
      String version,
      DateTime lastConnection,
      String accessToken}) =>
  ConfigEntity(
    uuid: uuid ?? this.uuid,
    baseUrl: baseUrl ?? this.baseUrl,
    externalUrl: externalUrl ?? this.externalUrl,
    internalUrl: internalUrl ?? this.internalUrl,
    locationName: locationName ?? this.locationName,
    installationType: installationType ?? this.installationType,
    requiresApiPassword: requiresApiPassword ?? this.requiresApiPassword,
    version: version ?? this.version,
    lastConnection: lastConnection ?? this.lastConnection,
    accessToken: accessToken ?? this.accessToken,
  );

  @override
  List<Object> get props => [uuid];
}
