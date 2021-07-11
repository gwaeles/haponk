// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContextModel _$ContextModelFromJson(Map<String, dynamic> json) {
  return ContextModel(
    id: json['id'] as String,
    parentId: json['parent_id'] as String?,
    userId: json['user_id'] as String?,
  );
}

Map<String, dynamic> _$ContextModelToJson(ContextModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parentId,
      'user_id': instance.userId,
    };
