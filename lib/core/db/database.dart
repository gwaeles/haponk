import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'tables/flex_cards.dart';
import 'tables/configs.dart';
import 'tables/states.dart';
import 'tables/flex_tabs.dart';

part 'database.g.dart';

@UseMoor(
  tables: [
    Configs,
    States,
    FlexTabs,
    FlexCards,
  ],
)
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        debugPrint("[MOOR] onCreate");
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        debugPrint("[MOOR] onUpgrade from: $from, to: $to");
        if (from == 1) {
          await m.addColumn(states, states.displayLabel);
          await m.addColumn(states, states.displayType);
          await m.createTable(flexTabs);
          await m.createTable(flexCards);

          // Update config
          String? internalUrl;
          try {
            final String json =
                await rootBundle.loadString("assets/config/config.json");
            final defaultConfig = jsonDecode(json) as Map<String, dynamic>;
            internalUrl = defaultConfig.containsKey("internalUrl")
                ? defaultConfig["internalUrl"]
                : null;
          } catch (e) {
            debugPrint("[MOOR] No config file");
          }
          if (internalUrl != null) {
            ConfigDBO? config = await getConfig();
            if (config == null) {
              final ConfigDBO newConfig = ConfigDBO(
                id: 1,
                internalUrl: internalUrl,
                requiresApiPassword: false,
              );
              await insertConfig(newConfig);
            } else {
              final ConfigDBO updatedConfig = config.copyWith(
                internalUrl: internalUrl,
              );
              await updateConfig(updatedConfig);
            }
          }

          // Tabs data
          await insertFlexTab(FlexTabsCompanion.insert(
            label: "Flex Tab",
            order: 1,
          ));
        }
      },
      beforeOpen: (details) async {
        if (details.wasCreated) {
          // Initiale config
          String? internalUrl;
          try {
            final String json =
                await rootBundle.loadString("assets/config/config.json");
            final defaultConfig = jsonDecode(json) as Map<String, dynamic>;
            internalUrl = defaultConfig.containsKey("internalUrl")
                ? defaultConfig["internalUrl"]
                : null;
          } catch (e) {
            debugPrint("[MOOR] No config file");
          }
          if (internalUrl != null) {
            final ConfigDBO newConfig = ConfigDBO(
              id: 1,
              internalUrl: internalUrl,
              requiresApiPassword: false,
            );
            await insertConfig(newConfig);
          }
        }
      },
    );
  }

  // CONFIG
  Future<ConfigDBO?> getConfig() => (select(configs)
        ..where(
          (item) => item.id.equals(1),
        ))
      .getSingleOrNull();
  Stream<ConfigDBO> watchConfig() => (select(configs)
        ..where(
          (item) => item.id.equals(1),
        ))
      .watchSingle();

  Future insertConfig(ConfigDBO config) => into(configs).insert(
        config,
        mode: InsertMode.insertOrReplace,
      );
  Future updateConfig(ConfigDBO config) => update(configs).replace(config);
  Future updateConfigDate(String uuid) => (update(configs)
            ..where(
              (item) => item.uuid.equals(uuid),
            ))
          .write(ConfigsCompanion(
        lastConnection: Value(DateTime.now()),
      ));
  Future deleteConfig(ConfigDBO config) => delete(configs).delete(config);

  // STATES
  Future<StateDBO?> getState(String entityId) => (select(states)
        ..where(
          (item) => item.entityId.equals(entityId),
        ))
      .getSingleOrNull();
  Future insertState(StatesCompanion state) => into(states).insert(
        state,
        mode: InsertMode.insertOrReplace,
      );
  Future updateState(StateDBO state) => update(states).replace(state);

  Stream<List<StateDBO>> watchStates() => select(states).watch();

  Stream<List<FlexTabDBO>> watchTabs() => select(flexTabs).watch();
  Future insertFlexTab(FlexTabsCompanion flexTab) =>
      into(flexTabs).insert(flexTab);
  Future<FlexTabDBO?> getFlexTab(int tabId) => (select(flexTabs)
        ..where(
          (item) => item.id.equals(tabId),
        ))
      .getSingleOrNull();
  Future deleteFlexTab(int tabId) => (delete(flexTabs)
        ..where(
          (item) => item.id.equals(tabId),
        ))
      .go();

  Stream<List<FlexCardDBO>> watchCards(int tabId) => (select(flexCards)
        ..where((item) => item.tabId.equals(tabId))
        ..orderBy([
          (item) => OrderingTerm(expression: item.position),
          (item) => OrderingTerm(expression: item.id)
        ]))
      .watch();
  Future insertFlexCard(FlexCardsCompanion flexCard) =>
      into(flexCards).insert(flexCard);
  Future updateFlexCard(FlexCardDBO flexCard) =>
      update(flexCards).replace(flexCard);
  Future updateFlexCardList(
    List<FlexCard> cards,
    List<int> cardIdsToDelete,
    FlexCard? itemToCreate,
    FlexCard? newRowSourceChild,
    FlexCard? newRowAddedChild,
    int newRowAddedChildIndex,
  ) {
    return transaction(() async {
      for (FlexCard card in cards) {
        await updateFlexCard(card.toDBO());
      }
      for (int cardId in cardIdsToDelete) {
        await deleteFlexCard(cardId);
      }
      if (itemToCreate != null) {
        await insertFlexCard(
          FlexCardsCompanion.insert(
            tabId: itemToCreate.tabId,
            parentId: itemToCreate.parentId == null
                ? Value.absent()
                : Value(itemToCreate.parentId),
            type: itemToCreate.type,
            position: itemToCreate.position,
            horizontalFlex: itemToCreate.horizontalFlex,
            verticalFlex: itemToCreate.verticalFlex,
            width: itemToCreate.width,
            height: itemToCreate.height,
          ),
        );
      }
      if (newRowSourceChild != null && newRowAddedChild != null) {
        final parentId = await insertFlexCard(
          FlexCardsCompanion.insert(
            tabId: newRowSourceChild.tabId,
            parentId: Value.absent(),
            type: 'row',
            position: newRowSourceChild.position,
            horizontalFlex: 1,
            verticalFlex: 0,
            width: 0,
            height: 0,
          ),
        );
        await updateFlexCard(
          newRowSourceChild
              .copyWith(
                parentId: parentId,
                position: newRowAddedChildIndex == 0 ? 1 : 0,
              )
              .toDBO(),
        );
        if (newRowAddedChild.id > 0) {
          await updateFlexCard(
            newRowAddedChild
                .copyWith(
                  parentId: parentId,
                  position: newRowAddedChildIndex == 0 ? 0 : 1,
                )
                .toDBO(),
          );
        } else {
          await insertFlexCard(
            FlexCardsCompanion.insert(
              tabId: newRowAddedChild.tabId,
              parentId: Value(parentId),
              type: newRowAddedChild.type,
              position: newRowAddedChildIndex == 0 ? 0 : 1,
              horizontalFlex: newRowAddedChild.horizontalFlex,
              verticalFlex: newRowAddedChild.verticalFlex,
              width: newRowAddedChild.width,
              height: newRowAddedChild.height,
            ),
          );
        }
      }
    });
  }

  Future deleteFlexCard(int cardId) => (delete(flexCards)
        ..where(
          (item) => item.id.equals(cardId),
        ))
      .go();
  Future removeFlexCardByTab(int tabId) =>
      (delete(flexCards)..where((item) => item.tabId.equals(tabId))).go();
  Future removeParentFlexCard(int parentCardId) =>
      (update(flexCards)..where((item) => item.parentId.equals(parentCardId)))
          .write(FlexCardsCompanion(
        parentId: Value(null),
      ));
}
