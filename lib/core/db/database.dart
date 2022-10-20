import 'package:drift/drift.dart';
import 'package:flutter/material.dart' as flt;
import 'package:haponk/data/tabs/entities/flex_card.dart';

import 'tables/flex_cards.dart';
import 'tables/states.dart';
import 'tables/flex_tabs.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
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
        flt.debugPrint("[DRIFT] onCreate");
        return m.createAll();
      },
    );
  }

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
  Future updateFlexTabLabel(int tabId, String label) => (update(flexTabs)
            ..where(
              (item) => item.id.equals(tabId),
            ))
          .write(FlexTabsCompanion(
        label: Value(label),
      ));

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
    List<FlexCard> itemsToUpdate,
    List<int> cardIdsToDelete,
    List<FlexCard> itemsToCreate,
    FlexCard? newRowSourceChild,
    FlexCard? newRowAddedChild,
    int newRowAddedChildIndex,
  ) {
    return transaction(() async {
      for (FlexCard card in itemsToUpdate) {
        await updateFlexCard(card.toDBO());
      }
      for (int cardId in cardIdsToDelete) {
        await deleteFlexCard(cardId);
      }
      for (FlexCard itemToCreate in itemsToCreate) {
        await insertFlexCard(
          FlexCardsCompanion.insert(
            tabId: itemToCreate.tabId,
            parentId: itemToCreate.parentId == null
                ? Value.absent()
                : Value(itemToCreate.parentId),
            stateId: itemToCreate.stateId == null || itemToCreate.stateId! <= 0
                ? Value.absent()
                : Value(itemToCreate.stateId),
            type: itemToCreate.type,
            position: itemToCreate.position,
            horizontalFlex: itemToCreate.horizontalFlex,
            height: itemToCreate.height,
            displayLeading: itemToCreate.displayLeading ? 1 : 0,
            displayTrailing: itemToCreate.displayTrailing ? 1 : 0,
            displayTitle: itemToCreate.displayTitle ? 1 : 0,
            displaySubtitle: itemToCreate.displaySubtitle ? 1 : 0,
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
            horizontalFlex: newRowSourceChild.horizontalFlex,
            height: newRowSourceChild.height,
            displayLeading: newRowSourceChild.displayLeading ? 1 : 0,
            displayTrailing: newRowSourceChild.displayTrailing ? 1 : 0,
            displayTitle: newRowSourceChild.displayTitle ? 1 : 0,
            displaySubtitle: newRowSourceChild.displaySubtitle ? 1 : 0,
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
              stateId: newRowAddedChild.stateId == null ||
                      newRowAddedChild.stateId! <= 0
                  ? Value.absent()
                  : Value(newRowAddedChild.stateId),
              type: newRowAddedChild.type,
              position: newRowAddedChildIndex == 0 ? 0 : 1,
              horizontalFlex: newRowAddedChild.horizontalFlex,
              height: newRowAddedChild.height,
              displayLeading: newRowAddedChild.displayLeading ? 1 : 0,
              displayTrailing: newRowAddedChild.displayTrailing ? 1 : 0,
              displayTitle: newRowAddedChild.displayTitle ? 1 : 0,
              displaySubtitle: newRowAddedChild.displaySubtitle ? 1 : 0,
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
