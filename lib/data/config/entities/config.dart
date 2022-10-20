import 'package:freezed_annotation/freezed_annotation.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
class Config with _$Config {
  const factory Config({
    required int id,
    String? externalUrl,
    String? internalUrl,
    String? locationName,
    String? version,
    DateTime? lastConnection,
    String? accessToken,
  }) = _Config;
  const Config._();

  ComparableConfig toComparable() => ComparableConfig(
        id: id,
        externalUrl: externalUrl,
        internalUrl: internalUrl,
        locationName: locationName,
        version: version,
      );

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}

@freezed
class ComparableConfig with _$ComparableConfig {
  const factory ComparableConfig({
    required int id,
    String? externalUrl,
    String? internalUrl,
    String? locationName,
    String? version,
  }) = _ComparableConfig;
}
