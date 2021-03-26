import 'package:json_annotation/json_annotation.dart';

part 'discovery_info_model.g.dart';

@JsonSerializable()
class DiscoveryInfoModel {
  final String uuid;
  @JsonKey(name: "base_url")
  final String baseUrl;
  @JsonKey(name: "external_url")
  final String externalUrl;
  @JsonKey(name: "internal_url")
  final String internalUrl;
  @JsonKey(name: "location_name")
  final String locationName;
  @JsonKey(name: "installation_type")
  final String installationType;
  @JsonKey(name: "requires_api_password")
  final bool requiresApiPassword;
  final String version;

  const DiscoveryInfoModel(
      {this.uuid,
      this.baseUrl,
      this.externalUrl,
      this.internalUrl,
      this.locationName,
      this.installationType,
      this.requiresApiPassword,
      this.version});

  factory DiscoveryInfoModel.fromJson(Map<String, dynamic> json) =>
      _$DiscoveryInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$DiscoveryInfoModelToJson(this);
}
