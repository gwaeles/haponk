import 'package:freezed_annotation/freezed_annotation.dart';

part 'flex_card.freezed.dart';

@freezed
class FlexCard with _$FlexCard {
  const factory FlexCard({
    required int id,
    required int tabId,
    @Default('deft') String type,
    int? stateId,
    int? parentId,
    required int position,
    @Default(1) int horizontalFlex,
    @Default(0) int verticalFlex,
    @Default(0) int width,
    @Default(0) int height,
    List<FlexCard>? children,
  }) = _FlexCard;
  const FlexCard._();

  String toString() {
    if (parentId != null && parentId! > 0) {
      return "$position ($parentId-$id)";
    }

    return "$position ($id)";
  }
}
