// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) {
  return DataModel(
    entityId: json['entity_id'] as String,
    oldState: json['old_state'] == null
        ? null
        : StateModel.fromJson(json['old_state'] as Map<String, dynamic>),
    newState: json['new_state'] == null
        ? null
        : StateModel.fromJson(json['new_state'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'entity_id': instance.entityId,
      'old_state': instance.oldState,
      'new_state': instance.newState,
    };
