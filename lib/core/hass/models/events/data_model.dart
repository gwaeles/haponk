import 'package:json_annotation/json_annotation.dart';

import 'state_model.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  @JsonKey(name: "entity_id")
  final String? entityId;
  @JsonKey(name: "old_state", includeIfNull: false)
  final StateModel? oldState;
  @JsonKey(name: "new_state", includeIfNull: false)
  final StateModel? newState;

  const DataModel({
    this.entityId,
    this.oldState,
    this.newState,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
