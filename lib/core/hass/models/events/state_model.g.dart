// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateModel _$StateModelFromJson(Map<String, dynamic> json) {
  return StateModel(
    entityId: json['entity_id'] as String?,
    state: json['state'] as String?,
    attributes: json['attributes'] == null
        ? null
        : AttributesModel.fromJson(json['attributes'] as Map<String, dynamic>),
    lastChanged: json['last_changed'] == null
        ? null
        : DateTime.parse(json['last_changed'] as String),
    lastUpdated: json['last_updated'] == null
        ? null
        : DateTime.parse(json['last_updated'] as String),
    context: json['context'] == null
        ? null
        : ContextModel.fromJson(json['context'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StateModelToJson(StateModel instance) =>
    <String, dynamic>{
      'entity_id': instance.entityId,
      'state': instance.state,
      'attributes': instance.attributes,
      'last_changed': instance.lastChanged?.toIso8601String(),
      'last_updated': instance.lastUpdated?.toIso8601String(),
      'context': instance.context,
    };
