import 'package:json_annotation/json_annotation.dart';

import 'attributes_model.dart';
import 'context_model.dart';

part 'state_model.g.dart';

@JsonSerializable()
class StateModel {
  @JsonKey(name: "entity_id")
  final String entityId;
  final String state;
  final AttributesModel attributes;
  @JsonKey(name: "last_changed")
  final DateTime lastChanged;
  @JsonKey(name: "last_updated")
  final DateTime lastUpdated;
  final ContextModel context;

  const StateModel(
      {this.entityId,
      this.state,
      this.attributes,
      this.lastChanged,
      this.lastUpdated,
      this.context});

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);
}
