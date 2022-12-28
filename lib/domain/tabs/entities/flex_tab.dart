import 'package:freezed_annotation/freezed_annotation.dart';

part 'flex_tab.freezed.dart';
part 'flex_tab.g.dart';

@freezed
class FlexTab with _$FlexTab {
  const factory FlexTab({
    int? id,
    String? label,
  }) = _FlexTab;

  factory FlexTab.fromJson(Map<String, dynamic> json) =>
      _$FlexTabFromJson(json);
}

@freezed
class FlexTabList with _$FlexTabList {
  const factory FlexTabList({
    required List<FlexTab> items,
  }) = _FlexTabList;

  factory FlexTabList.fromJson(Map<String, dynamic> json) =>
      _$FlexTabListFromJson(json);
}
