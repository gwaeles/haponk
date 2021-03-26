// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoveryInfoModel _$DiscoveryInfoModelFromJson(Map<String, dynamic> json) {
  return DiscoveryInfoModel(
    uuid: json['uuid'] as String,
    baseUrl: json['base_url'] as String,
    externalUrl: json['external_url'] as String,
    internalUrl: json['internal_url'] as String,
    locationName: json['location_name'] as String,
    installationType: json['installation_type'] as String,
    requiresApiPassword: json['requires_api_password'] as bool,
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$DiscoveryInfoModelToJson(DiscoveryInfoModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'base_url': instance.baseUrl,
      'external_url': instance.externalUrl,
      'internal_url': instance.internalUrl,
      'location_name': instance.locationName,
      'installation_type': instance.installationType,
      'requires_api_password': instance.requiresApiPassword,
      'version': instance.version,
    };
