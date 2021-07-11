import 'package:json_annotation/json_annotation.dart';

part 'context_model.g.dart';

@JsonSerializable()
class ContextModel {
  final String id;
  @JsonKey(name: "parent_id")
  final String? parentId;
  @JsonKey(name: "user_id")
  final String? userId;

  const ContextModel({
    required this.id,
    this.parentId,
    this.userId,
  });

  factory ContextModel.fromJson(Map<String, dynamic> json) =>
      _$ContextModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContextModelToJson(this);
}
