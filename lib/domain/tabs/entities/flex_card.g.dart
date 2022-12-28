// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flex_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FlexCard _$$_FlexCardFromJson(Map<String, dynamic> json) => _$_FlexCard(
      id: json['id'] as int,
      tabId: json['tabId'] as int,
      type:
          $enumDecodeNullable(_$CardTypeEnumMap, json['type']) ?? CardType.deft,
      stateId: json['stateId'] as String?,
      parentId: json['parentId'] as int?,
      position: json['position'] as int,
      horizontalFlex: json['horizontalFlex'] as int? ?? 1,
      height: json['height'] as int? ?? 56,
      displayLeading: json['displayLeading'] as bool? ?? true,
      displayTrailing: json['displayTrailing'] as bool? ?? true,
      displayTitle: json['displayTitle'] as bool? ?? true,
      displaySubtitle: json['displaySubtitle'] as bool? ?? true,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => FlexCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FlexCardToJson(_$_FlexCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tabId': instance.tabId,
      'type': _$CardTypeEnumMap[instance.type]!,
      'stateId': instance.stateId,
      'parentId': instance.parentId,
      'position': instance.position,
      'horizontalFlex': instance.horizontalFlex,
      'height': instance.height,
      'displayLeading': instance.displayLeading,
      'displayTrailing': instance.displayTrailing,
      'displayTitle': instance.displayTitle,
      'displaySubtitle': instance.displaySubtitle,
      'children': instance.children,
    };

const _$CardTypeEnumMap = {
  CardType.deft: 'deft',
  CardType.row: 'row',
};

_$_FlexCardList _$$_FlexCardListFromJson(Map<String, dynamic> json) =>
    _$_FlexCardList(
      tabId: json['tabId'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => FlexCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FlexCardListToJson(_$_FlexCardList instance) =>
    <String, dynamic>{
      'tabId': instance.tabId,
      'items': instance.items,
    };
