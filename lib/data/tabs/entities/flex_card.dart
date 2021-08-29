import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haponk/core/db/database.dart';

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
    // @Default(1) int horizontalFlex,
    // @Default(0) int verticalFlex,
    // @Default(0) int width,
    // @Default(0) int height,
    List<FlexCard>? children,
  }) = _FlexCard;
  const FlexCard._();

  String toString() {
    final prefix = type == 'row' ? 'R' : '';
    if (parentId != null && parentId! > 0) {
      return "$position ($parentId-$id)";
    }

    return "$prefix$position ($id)";
  }

  bool get isChild => parentId != null && parentId! > 0;
  bool get hasChildren => (children?.length ?? 0) > 0;

  FlexCardDBO toDBO() {
    return FlexCardDBO(
      id: id,
      parentId: parentId,
      tabId: tabId,
      stateId: stateId,
      type: type,
      position: position,
    );
  }
}
