import 'package:freezed_annotation/freezed_annotation.dart';

part 'flex_card.freezed.dart';
part 'flex_card.g.dart';

enum CardType { deft, row }

@freezed
class FlexCard with _$FlexCard {
  const factory FlexCard({
    required int id,
    required int tabId,
    @Default(CardType.deft) CardType type,
    String? stateId,
    int? parentId,
    required int position,
    @Default(1) int horizontalFlex,
    @Default(56) int height,
    @Default(true) bool displayLeading,
    @Default(true) bool displayTrailing,
    @Default(true) bool displayTitle,
    @Default(true) bool displaySubtitle,
    List<FlexCard>? children,
  }) = _FlexCard;
  const FlexCard._();

  String toString() {
    final prefix = type == CardType.row ? 'R' : '';
    final devicePart = stateId == null ? '' : '::$stateId';
    final parentPart = parentId != null && parentId! > 0 ? '$parentId-' : '';
    final childrenPart = children
            ?.map((e) => e.toString())
            .reduce((value, element) => '$value $element') ??
        '';

    return '$prefix$position ($parentPart$id$devicePart) $childrenPart';
  }

  bool get isChild => parentId != null && parentId! > 0;
  bool get hasChildren => (children?.length ?? 0) > 0;

  factory FlexCard.fromJson(Map<String, dynamic> json) =>
      _$FlexCardFromJson(json);
}

@freezed
class FlexCardList with _$FlexCardList {
  const factory FlexCardList({
    required int tabId,
    required List<FlexCard> items,
  }) = _FlexCardList;

  factory FlexCardList.fromJson(Map<String, dynamic> json) =>
      _$FlexCardListFromJson(json);
}
