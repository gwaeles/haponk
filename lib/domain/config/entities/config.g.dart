// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Config _$$_ConfigFromJson(Map<String, dynamic> json) => _$_Config(
      id: json['id'] as int,
      externalUrl: json['externalUrl'] as String?,
      internalUrl: json['internalUrl'] as String?,
      locationName: json['locationName'] as String?,
      version: json['version'] as String?,
      lastConnection: json['lastConnection'] == null
          ? null
          : DateTime.parse(json['lastConnection'] as String),
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$$_ConfigToJson(_$_Config instance) => <String, dynamic>{
      'id': instance.id,
      'externalUrl': instance.externalUrl,
      'internalUrl': instance.internalUrl,
      'locationName': instance.locationName,
      'version': instance.version,
      'lastConnection': instance.lastConnection?.toIso8601String(),
      'accessToken': instance.accessToken,
    };
