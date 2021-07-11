class FlexCard {
  final int id;
  final int tabId;
  final String type;
  final int? stateId;
  final int? parentId;
  final int position;
  final int horizontalFlex;
  final int verticalFlex;
  final int width;
  final int height;
  final List<FlexCard>? children;

  FlexCard({
    required this.id,
    required this.tabId,
    required this.type,
    this.stateId,
    this.parentId,
    required this.position,
    required this.horizontalFlex,
    required this.verticalFlex,
    required this.width,
    required this.height,
    this.children,
  });

  String toString() {
    if (parentId != null && parentId! > 0) {
      return "$position ($parentId-$id)";
    }

    return "$position ($id)";
  }

  FlexCard copyWith({
    final int? id,
    final int? tabId,
    final String? type,
    final int? stateId,
    final int? parentId,
    final int? position,
    final int? horizontalFlex,
    final int? verticalFlex,
    final int? width,
    final int? height,
    final List<FlexCard>? children,
  }) =>
      FlexCard(
        id: id ?? this.id,
        tabId: tabId ?? this.tabId,
        type: type ?? this.type,
        stateId: stateId ?? this.stateId,
        parentId: parentId ?? this.parentId,
        position: position ?? this.position,
        horizontalFlex: horizontalFlex ?? this.horizontalFlex,
        verticalFlex: verticalFlex ?? this.verticalFlex,
        width: width ?? this.width,
        height: height ?? this.height,
        children: children ?? this.children,
      );
}
