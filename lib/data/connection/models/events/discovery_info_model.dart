import 'package:json_annotation/json_annotation.dart';

part 'discovery_info_model.g.dart';

@JsonSerializable()
class DiscoveryInfoModel {
  @JsonKey(name: "external_url")
  final String? externalUrl;
  @JsonKey(name: "internal_url")
  final String? internalUrl;
  @JsonKey(name: "location_name")
  final String? locationName;
  final String? version;
  final String? state;
  @JsonKey(name: "safe_mode")
  final bool? safeMode;

  const DiscoveryInfoModel({
    this.externalUrl,
    this.internalUrl,
    this.locationName,
    this.version,
    this.state,
    this.safeMode,
  });

  factory DiscoveryInfoModel.fromJson(Map<String, dynamic> json) =>
      _$DiscoveryInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$DiscoveryInfoModelToJson(this);
}
