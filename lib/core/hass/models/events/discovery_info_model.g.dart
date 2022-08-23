// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoveryInfoModel _$DiscoveryInfoModelFromJson(Map<String, dynamic> json) =>
    DiscoveryInfoModel(
      externalUrl: json['external_url'] as String?,
      internalUrl: json['internal_url'] as String?,
      locationName: json['location_name'] as String?,
      version: json['version'] as String?,
      state: json['state'] as String?,
      safeMode: json['safe_mode'] as bool?,
    );

Map<String, dynamic> _$DiscoveryInfoModelToJson(DiscoveryInfoModel instance) =>
    <String, dynamic>{
      'external_url': instance.externalUrl,
      'internal_url': instance.internalUrl,
      'location_name': instance.locationName,
      'version': instance.version,
      'state': instance.state,
      'safe_mode': instance.safeMode,
    };
