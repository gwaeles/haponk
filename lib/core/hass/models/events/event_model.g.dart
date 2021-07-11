// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return EventModel(
    eventType: _$enumDecodeNullable(_$EventTypeEnumMap, json['event_type']),
    data: json['data'] == null
        ? null
        : DataModel.fromJson(json['data'] as Map<String, dynamic>),
    origin: json['origin'] as String?,
    timeFired: json['time_fired'] == null
        ? null
        : DateTime.parse(json['time_fired'] as String),
    context: json['context'] == null
        ? null
        : ContextModel.fromJson(json['context'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'event_type': _$EventTypeEnumMap[instance.eventType],
      'data': instance.data,
      'origin': instance.origin,
      'time_fired': instance.timeFired?.toIso8601String(),
      'context': instance.context,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$EventTypeEnumMap = {
  EventType.STATE_CHANGED: 'state_changed',
};
