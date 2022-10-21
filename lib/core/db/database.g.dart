// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FlexTabDBO extends DataClass implements Insertable<FlexTabDBO> {
  final int id;
  final String label;
  final int order;
  const FlexTabDBO(
      {required this.id, required this.label, required this.order});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    map['order'] = Variable<int>(order);
    return map;
  }

  FlexTabsCompanion toCompanion(bool nullToAbsent) {
    return FlexTabsCompanion(
      id: Value(id),
      label: Value(label),
      order: Value(order),
    );
  }

  factory FlexTabDBO.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FlexTabDBO(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
      'order': serializer.toJson<int>(order),
    };
  }

  FlexTabDBO copyWith({int? id, String? label, int? order}) => FlexTabDBO(
        id: id ?? this.id,
        label: label ?? this.label,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('FlexTabDBO(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label, order);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FlexTabDBO &&
          other.id == this.id &&
          other.label == this.label &&
          other.order == this.order);
}

class FlexTabsCompanion extends UpdateCompanion<FlexTabDBO> {
  final Value<int> id;
  final Value<String> label;
  final Value<int> order;
  const FlexTabsCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.order = const Value.absent(),
  });
  FlexTabsCompanion.insert({
    this.id = const Value.absent(),
    required String label,
    required int order,
  })  : label = Value(label),
        order = Value(order);
  static Insertable<FlexTabDBO> custom({
    Expression<int>? id,
    Expression<String>? label,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (order != null) 'order': order,
    });
  }

  FlexTabsCompanion copyWith(
      {Value<int>? id, Value<String>? label, Value<int>? order}) {
    return FlexTabsCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlexTabsCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $FlexTabsTable extends FlexTabs
    with TableInfo<$FlexTabsTable, FlexTabDBO> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlexTabsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, label, order];
  @override
  String get aliasedName => _alias ?? 'flex_tabs';
  @override
  String get actualTableName => 'flex_tabs';
  @override
  VerificationContext validateIntegrity(Insertable<FlexTabDBO> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FlexTabDBO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FlexTabDBO(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      label: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      order: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
    );
  }

  @override
  $FlexTabsTable createAlias(String alias) {
    return $FlexTabsTable(attachedDatabase, alias);
  }
}

class FlexCardDBO extends DataClass implements Insertable<FlexCardDBO> {
  final int id;
  final int tabId;
  final String type;
  final int? stateId;
  final int? parentId;
  final int position;
  final int horizontalFlex;
  final int height;
  final int displayLeading;
  final int displayTrailing;
  final int displayTitle;
  final int displaySubtitle;
  const FlexCardDBO(
      {required this.id,
      required this.tabId,
      required this.type,
      this.stateId,
      this.parentId,
      required this.position,
      required this.horizontalFlex,
      required this.height,
      required this.displayLeading,
      required this.displayTrailing,
      required this.displayTitle,
      required this.displaySubtitle});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tab_id'] = Variable<int>(tabId);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || stateId != null) {
      map['state_id'] = Variable<int>(stateId);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
    }
    map['position'] = Variable<int>(position);
    map['horizontal_flex'] = Variable<int>(horizontalFlex);
    map['height'] = Variable<int>(height);
    map['display_leading'] = Variable<int>(displayLeading);
    map['display_trailing'] = Variable<int>(displayTrailing);
    map['display_title'] = Variable<int>(displayTitle);
    map['display_subtitle'] = Variable<int>(displaySubtitle);
    return map;
  }

  FlexCardsCompanion toCompanion(bool nullToAbsent) {
    return FlexCardsCompanion(
      id: Value(id),
      tabId: Value(tabId),
      type: Value(type),
      stateId: stateId == null && nullToAbsent
          ? const Value.absent()
          : Value(stateId),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      position: Value(position),
      horizontalFlex: Value(horizontalFlex),
      height: Value(height),
      displayLeading: Value(displayLeading),
      displayTrailing: Value(displayTrailing),
      displayTitle: Value(displayTitle),
      displaySubtitle: Value(displaySubtitle),
    );
  }

  factory FlexCardDBO.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FlexCardDBO(
      id: serializer.fromJson<int>(json['id']),
      tabId: serializer.fromJson<int>(json['tabId']),
      type: serializer.fromJson<String>(json['type']),
      stateId: serializer.fromJson<int?>(json['stateId']),
      parentId: serializer.fromJson<int?>(json['parentId']),
      position: serializer.fromJson<int>(json['position']),
      horizontalFlex: serializer.fromJson<int>(json['horizontalFlex']),
      height: serializer.fromJson<int>(json['height']),
      displayLeading: serializer.fromJson<int>(json['displayLeading']),
      displayTrailing: serializer.fromJson<int>(json['displayTrailing']),
      displayTitle: serializer.fromJson<int>(json['displayTitle']),
      displaySubtitle: serializer.fromJson<int>(json['displaySubtitle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tabId': serializer.toJson<int>(tabId),
      'type': serializer.toJson<String>(type),
      'stateId': serializer.toJson<int?>(stateId),
      'parentId': serializer.toJson<int?>(parentId),
      'position': serializer.toJson<int>(position),
      'horizontalFlex': serializer.toJson<int>(horizontalFlex),
      'height': serializer.toJson<int>(height),
      'displayLeading': serializer.toJson<int>(displayLeading),
      'displayTrailing': serializer.toJson<int>(displayTrailing),
      'displayTitle': serializer.toJson<int>(displayTitle),
      'displaySubtitle': serializer.toJson<int>(displaySubtitle),
    };
  }

  FlexCardDBO copyWith(
          {int? id,
          int? tabId,
          String? type,
          Value<int?> stateId = const Value.absent(),
          Value<int?> parentId = const Value.absent(),
          int? position,
          int? horizontalFlex,
          int? height,
          int? displayLeading,
          int? displayTrailing,
          int? displayTitle,
          int? displaySubtitle}) =>
      FlexCardDBO(
        id: id ?? this.id,
        tabId: tabId ?? this.tabId,
        type: type ?? this.type,
        stateId: stateId.present ? stateId.value : this.stateId,
        parentId: parentId.present ? parentId.value : this.parentId,
        position: position ?? this.position,
        horizontalFlex: horizontalFlex ?? this.horizontalFlex,
        height: height ?? this.height,
        displayLeading: displayLeading ?? this.displayLeading,
        displayTrailing: displayTrailing ?? this.displayTrailing,
        displayTitle: displayTitle ?? this.displayTitle,
        displaySubtitle: displaySubtitle ?? this.displaySubtitle,
      );
  @override
  String toString() {
    return (StringBuffer('FlexCardDBO(')
          ..write('id: $id, ')
          ..write('tabId: $tabId, ')
          ..write('type: $type, ')
          ..write('stateId: $stateId, ')
          ..write('parentId: $parentId, ')
          ..write('position: $position, ')
          ..write('horizontalFlex: $horizontalFlex, ')
          ..write('height: $height, ')
          ..write('displayLeading: $displayLeading, ')
          ..write('displayTrailing: $displayTrailing, ')
          ..write('displayTitle: $displayTitle, ')
          ..write('displaySubtitle: $displaySubtitle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      tabId,
      type,
      stateId,
      parentId,
      position,
      horizontalFlex,
      height,
      displayLeading,
      displayTrailing,
      displayTitle,
      displaySubtitle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FlexCardDBO &&
          other.id == this.id &&
          other.tabId == this.tabId &&
          other.type == this.type &&
          other.stateId == this.stateId &&
          other.parentId == this.parentId &&
          other.position == this.position &&
          other.horizontalFlex == this.horizontalFlex &&
          other.height == this.height &&
          other.displayLeading == this.displayLeading &&
          other.displayTrailing == this.displayTrailing &&
          other.displayTitle == this.displayTitle &&
          other.displaySubtitle == this.displaySubtitle);
}

class FlexCardsCompanion extends UpdateCompanion<FlexCardDBO> {
  final Value<int> id;
  final Value<int> tabId;
  final Value<String> type;
  final Value<int?> stateId;
  final Value<int?> parentId;
  final Value<int> position;
  final Value<int> horizontalFlex;
  final Value<int> height;
  final Value<int> displayLeading;
  final Value<int> displayTrailing;
  final Value<int> displayTitle;
  final Value<int> displaySubtitle;
  const FlexCardsCompanion({
    this.id = const Value.absent(),
    this.tabId = const Value.absent(),
    this.type = const Value.absent(),
    this.stateId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.position = const Value.absent(),
    this.horizontalFlex = const Value.absent(),
    this.height = const Value.absent(),
    this.displayLeading = const Value.absent(),
    this.displayTrailing = const Value.absent(),
    this.displayTitle = const Value.absent(),
    this.displaySubtitle = const Value.absent(),
  });
  FlexCardsCompanion.insert({
    this.id = const Value.absent(),
    required int tabId,
    required String type,
    this.stateId = const Value.absent(),
    this.parentId = const Value.absent(),
    required int position,
    required int horizontalFlex,
    required int height,
    required int displayLeading,
    required int displayTrailing,
    required int displayTitle,
    required int displaySubtitle,
  })  : tabId = Value(tabId),
        type = Value(type),
        position = Value(position),
        horizontalFlex = Value(horizontalFlex),
        height = Value(height),
        displayLeading = Value(displayLeading),
        displayTrailing = Value(displayTrailing),
        displayTitle = Value(displayTitle),
        displaySubtitle = Value(displaySubtitle);
  static Insertable<FlexCardDBO> custom({
    Expression<int>? id,
    Expression<int>? tabId,
    Expression<String>? type,
    Expression<int>? stateId,
    Expression<int>? parentId,
    Expression<int>? position,
    Expression<int>? horizontalFlex,
    Expression<int>? height,
    Expression<int>? displayLeading,
    Expression<int>? displayTrailing,
    Expression<int>? displayTitle,
    Expression<int>? displaySubtitle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tabId != null) 'tab_id': tabId,
      if (type != null) 'type': type,
      if (stateId != null) 'state_id': stateId,
      if (parentId != null) 'parent_id': parentId,
      if (position != null) 'position': position,
      if (horizontalFlex != null) 'horizontal_flex': horizontalFlex,
      if (height != null) 'height': height,
      if (displayLeading != null) 'display_leading': displayLeading,
      if (displayTrailing != null) 'display_trailing': displayTrailing,
      if (displayTitle != null) 'display_title': displayTitle,
      if (displaySubtitle != null) 'display_subtitle': displaySubtitle,
    });
  }

  FlexCardsCompanion copyWith(
      {Value<int>? id,
      Value<int>? tabId,
      Value<String>? type,
      Value<int?>? stateId,
      Value<int?>? parentId,
      Value<int>? position,
      Value<int>? horizontalFlex,
      Value<int>? height,
      Value<int>? displayLeading,
      Value<int>? displayTrailing,
      Value<int>? displayTitle,
      Value<int>? displaySubtitle}) {
    return FlexCardsCompanion(
      id: id ?? this.id,
      tabId: tabId ?? this.tabId,
      type: type ?? this.type,
      stateId: stateId ?? this.stateId,
      parentId: parentId ?? this.parentId,
      position: position ?? this.position,
      horizontalFlex: horizontalFlex ?? this.horizontalFlex,
      height: height ?? this.height,
      displayLeading: displayLeading ?? this.displayLeading,
      displayTrailing: displayTrailing ?? this.displayTrailing,
      displayTitle: displayTitle ?? this.displayTitle,
      displaySubtitle: displaySubtitle ?? this.displaySubtitle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tabId.present) {
      map['tab_id'] = Variable<int>(tabId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (stateId.present) {
      map['state_id'] = Variable<int>(stateId.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (horizontalFlex.present) {
      map['horizontal_flex'] = Variable<int>(horizontalFlex.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (displayLeading.present) {
      map['display_leading'] = Variable<int>(displayLeading.value);
    }
    if (displayTrailing.present) {
      map['display_trailing'] = Variable<int>(displayTrailing.value);
    }
    if (displayTitle.present) {
      map['display_title'] = Variable<int>(displayTitle.value);
    }
    if (displaySubtitle.present) {
      map['display_subtitle'] = Variable<int>(displaySubtitle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlexCardsCompanion(')
          ..write('id: $id, ')
          ..write('tabId: $tabId, ')
          ..write('type: $type, ')
          ..write('stateId: $stateId, ')
          ..write('parentId: $parentId, ')
          ..write('position: $position, ')
          ..write('horizontalFlex: $horizontalFlex, ')
          ..write('height: $height, ')
          ..write('displayLeading: $displayLeading, ')
          ..write('displayTrailing: $displayTrailing, ')
          ..write('displayTitle: $displayTitle, ')
          ..write('displaySubtitle: $displaySubtitle')
          ..write(')'))
        .toString();
  }
}

class $FlexCardsTable extends FlexCards
    with TableInfo<$FlexCardsTable, FlexCardDBO> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlexCardsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _tabIdMeta = const VerificationMeta('tabId');
  @override
  late final GeneratedColumn<int> tabId = GeneratedColumn<int>(
      'tab_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _stateIdMeta = const VerificationMeta('stateId');
  @override
  late final GeneratedColumn<int> stateId = GeneratedColumn<int>(
      'state_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _parentIdMeta = const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _horizontalFlexMeta =
      const VerificationMeta('horizontalFlex');
  @override
  late final GeneratedColumn<int> horizontalFlex = GeneratedColumn<int>(
      'horizontal_flex', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
      'height', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _displayLeadingMeta =
      const VerificationMeta('displayLeading');
  @override
  late final GeneratedColumn<int> displayLeading = GeneratedColumn<int>(
      'display_leading', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _displayTrailingMeta =
      const VerificationMeta('displayTrailing');
  @override
  late final GeneratedColumn<int> displayTrailing = GeneratedColumn<int>(
      'display_trailing', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _displayTitleMeta =
      const VerificationMeta('displayTitle');
  @override
  late final GeneratedColumn<int> displayTitle = GeneratedColumn<int>(
      'display_title', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _displaySubtitleMeta =
      const VerificationMeta('displaySubtitle');
  @override
  late final GeneratedColumn<int> displaySubtitle = GeneratedColumn<int>(
      'display_subtitle', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        tabId,
        type,
        stateId,
        parentId,
        position,
        horizontalFlex,
        height,
        displayLeading,
        displayTrailing,
        displayTitle,
        displaySubtitle
      ];
  @override
  String get aliasedName => _alias ?? 'flex_cards';
  @override
  String get actualTableName => 'flex_cards';
  @override
  VerificationContext validateIntegrity(Insertable<FlexCardDBO> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tab_id')) {
      context.handle(
          _tabIdMeta, tabId.isAcceptableOrUnknown(data['tab_id']!, _tabIdMeta));
    } else if (isInserting) {
      context.missing(_tabIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('state_id')) {
      context.handle(_stateIdMeta,
          stateId.isAcceptableOrUnknown(data['state_id']!, _stateIdMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('horizontal_flex')) {
      context.handle(
          _horizontalFlexMeta,
          horizontalFlex.isAcceptableOrUnknown(
              data['horizontal_flex']!, _horizontalFlexMeta));
    } else if (isInserting) {
      context.missing(_horizontalFlexMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('display_leading')) {
      context.handle(
          _displayLeadingMeta,
          displayLeading.isAcceptableOrUnknown(
              data['display_leading']!, _displayLeadingMeta));
    } else if (isInserting) {
      context.missing(_displayLeadingMeta);
    }
    if (data.containsKey('display_trailing')) {
      context.handle(
          _displayTrailingMeta,
          displayTrailing.isAcceptableOrUnknown(
              data['display_trailing']!, _displayTrailingMeta));
    } else if (isInserting) {
      context.missing(_displayTrailingMeta);
    }
    if (data.containsKey('display_title')) {
      context.handle(
          _displayTitleMeta,
          displayTitle.isAcceptableOrUnknown(
              data['display_title']!, _displayTitleMeta));
    } else if (isInserting) {
      context.missing(_displayTitleMeta);
    }
    if (data.containsKey('display_subtitle')) {
      context.handle(
          _displaySubtitleMeta,
          displaySubtitle.isAcceptableOrUnknown(
              data['display_subtitle']!, _displaySubtitleMeta));
    } else if (isInserting) {
      context.missing(_displaySubtitleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FlexCardDBO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FlexCardDBO(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tabId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}tab_id'])!,
      type: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      stateId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}state_id']),
      parentId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id']),
      position: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      horizontalFlex: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}horizontal_flex'])!,
      height: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}height'])!,
      displayLeading: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}display_leading'])!,
      displayTrailing: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}display_trailing'])!,
      displayTitle: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}display_title'])!,
      displaySubtitle: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}display_subtitle'])!,
    );
  }

  @override
  $FlexCardsTable createAlias(String alias) {
    return $FlexCardsTable(attachedDatabase, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $FlexTabsTable flexTabs = $FlexTabsTable(this);
  late final $FlexCardsTable flexCards = $FlexCardsTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [flexTabs, flexCards];
}
