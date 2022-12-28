// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flex_tab.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FlexTab _$$_FlexTabFromJson(Map<String, dynamic> json) => _$_FlexTab(
      id: json['id'] as int?,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$$_FlexTabToJson(_$_FlexTab instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
    };

_$_FlexTabList _$$_FlexTabListFromJson(Map<String, dynamic> json) =>
    _$_FlexTabList(
      items: (json['items'] as List<dynamic>)
          .map((e) => FlexTab.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FlexTabListToJson(_$_FlexTabList instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
