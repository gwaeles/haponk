import 'package:freezed_annotation/freezed_annotation.dart';

part 'config.freezed.dart';

@freezed
abstract class Config with _$Config {
  const factory Config({
    String? uuid,
    String? baseUrl,
    String? externalUrl,
    String? internalUrl,
    String? locationName,
    String? installationType,
    bool? requiresApiPassword,
    String? version,
    DateTime? lastConnection,
    String? accessToken,
  }) = _Config;
  const Config._();

  ComparableConfig toComparable() => ComparableConfig(
        uuid: uuid,
        baseUrl: baseUrl,
        externalUrl: externalUrl,
        internalUrl: internalUrl,
        locationName: locationName,
        installationType: installationType,
        requiresApiPassword: requiresApiPassword,
        version: version,
      );
}

@freezed
class ComparableConfig with _$ComparableConfig {
  const factory ComparableConfig({
    String? uuid,
    String? baseUrl,
    String? externalUrl,
    String? internalUrl,
    String? locationName,
    String? installationType,
    bool? requiresApiPassword,
    String? version,
  }) = _ComparableConfig;
}
