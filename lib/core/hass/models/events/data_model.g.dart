// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      entityId: json['entity_id'] as String?,
      oldState: json['old_state'] == null
          ? null
          : StateModel.fromJson(json['old_state'] as Map<String, dynamic>),
      newState: json['new_state'] == null
          ? null
          : StateModel.fromJson(json['new_state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) {
  final val = <String, dynamic>{
    'entity_id': instance.entityId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('old_state', instance.oldState);
  writeNotNull('new_state', instance.newState);
  return val;
}
