import 'package:freezed_annotation/freezed_annotation.dart';

part 'config.freezed.dart';

@freezed
class Config with _$Config {
  const factory Config({
    String? externalUrl,
    String? internalUrl,
    String? locationName,
    String? version,
    DateTime? lastConnection,
    String? accessToken,
  }) = _Config;
  const Config._();

  ComparableConfig toComparable() => ComparableConfig(
        externalUrl: externalUrl,
        internalUrl: internalUrl,
        locationName: locationName,
        version: version,
      );
}

@freezed
class ComparableConfig with _$ComparableConfig {
  const factory ComparableConfig({
    String? externalUrl,
    String? internalUrl,
    String? locationName,
    String? version,
  }) = _ComparableConfig;
}
