import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/data/tabs/datasources/flex_tabs_hive_source.dart';
import 'package:haponk/domain/tabs/entities/extensions.dart';
import 'package:haponk/domain/tabs/entities/flex_card.dart';
import 'package:hive_flutter/hive_flutter.dart';

final flexCardsRepositoryProvider = Provider.family<FlexCardsRepository, int>(
  (ref, tabId) => FlexCardsRepository(ref, tabId),
);
final cardListProvider = StateProvider.autoDispose.family<FlexCardList?, int>(
  (ref, tabId) {
    final AsyncValue<Box<FlexCardList>> asyncBox =
        ref.watch(flexCardListBoxProvider);
    StreamSubscription? _hiveSubscription;

    // On dispose
    ref.onDispose(
      () {
        // Closes the StreamController when the state of this provider is destroyed.
        _hiveSubscription?.cancel();
      },
    );

    return asyncBox.when(
      loading: () => null,
      error: (error, stack) => null,
      data: (Box<FlexCardList> box) {
        FlexCardList? currentValue =
            box.containsKey(tabId) ? box.get(tabId) : null;

        // Hive subscription
        _hiveSubscription?.cancel();
        _hiveSubscription = box.watch(key: tabId).listen(
              (BoxEvent event) =>
                  ref.controller.state = event.value as FlexCardList?,
            );

        return currentValue;
      },
    );
  },
);

class FlexCardsRepository {
  final int tabId;
  final Ref ref;

  FlexCardsRepository(
    this.ref,
    this.tabId,
  );

  Future<int> insert({
    required String type,
    String? stateId,
    int? parentId,
    required int position,
    int horizontalFlex = 1,
    int height = 56,
    bool displayLeading = true,
    bool displayTrailing = true,
    bool displayTitle = true,
    bool displaySubtitle = true,
  }) async {
    // return await db.insertFlexCard(
    //   FlexCardsCompanion.insert(
    //     tabId: tabId,
    //     parentId: parentId == null || parentId <= 0
    //         ? Value.absent()
    //         : Value(parentId),
    //     stateId:
    //         stateId == null || stateId <= 0 ? Value.absent() : Value(stateId),
    //     type: type,
    //     position: position,
    //     horizontalFlex: horizontalFlex,
    //     height: height,
    //     displayLeading: displayLeading ? 1 : 0,
    //     displayTrailing: displayTrailing ? 1 : 0,
    //     displayTitle: displayTitle ? 1 : 0,
    //     displaySubtitle: displaySubtitle ? 1 : 0,
    //   ),
    // );
    return 0;
  }

  Future<void> createItems({
    required List<String> deviceIds,
    FlexCard? beforeItem,
    FlexCard? afterItem,
  }) async {
    final FlexCardList previousTabList = (await ref.read(
          cardListProvider(tabId),
        )) ??
        FlexCardList(
          tabId: tabId,
          items: [],
        );

    final Box<FlexCardList> box = await ref.read(
      flexCardListBoxProvider.future,
    );

    box.put(
      tabId,
      previousTabList.copyWithNewItems(
        deviceIds: deviceIds,
      ),
    );
  }

  Future<bool> update(FlexCard item) async {
    final FlexCardList previousTabList = (await ref.read(
          cardListProvider(tabId),
        )) ??
        FlexCardList(
          tabId: tabId,
          items: [],
        );

    final List<FlexCard> newTabList = previousTabList.items.map(
      (previous) {
        if (item.id == previous.id) {
          return item.copyWith();
        } else {
          return previous;
        }
      },
    ).toList();
    newTabList.sort(
      (a, b) => a.position.compareTo(b.position),
    );

    final Box<FlexCardList> box = await ref.read(
      flexCardListBoxProvider.future,
    );

    box.put(
      tabId,
      FlexCardList(
        tabId: tabId,
        items: newTabList,
      ),
    );
    return true;
  }

  // Future<void> updateList({
  //   List<FlexCard> itemsToUpdate = const [],
  //   List<FlexCard> itemsToDelete = const [],
  //   List<FlexCard> itemsToCreate = const [],
  //   FlexCard? newRowTargetChild,
  //   FlexCard? newRowAddedChild,
  //   int newRowAddedChildIndex = 0,
  // }) async {
  //   // final cardIdsToDelete = itemsToDelete.map((e) => e.id).toList();

  //   // await db.updateFlexCardList(
  //   //   itemsToUpdate,
  //   //   cardIdsToDelete,
  //   //   itemsToCreate,
  //   //   newRowTargetChild,
  //   //   newRowAddedChild,
  //   //   newRowAddedChildIndex,
  //   // );
  // }

  Future<void> addChildItemToTheLeft({
    required List<String> deviceIds,
    required FlexCard item,
  }) async {
    final FlexCardList previousTabList = (await ref.read(
          cardListProvider(tabId),
        )) ??
        FlexCardList(
          tabId: tabId,
          items: [],
        );

    final Box<FlexCardList> box = await ref.read(
      flexCardListBoxProvider.future,
    );

    box.put(
      tabId,
      previousTabList.copyWithNewItemToTheLeft(
        deviceIds: deviceIds,
        targetItem: item,
      ),
    );
  }

  Future<void> addChildItemToTheRight({
    required List<String> deviceIds,
    required FlexCard item,
  }) async {
    final FlexCardList previousTabList = (await ref.read(
          cardListProvider(tabId),
        )) ??
        FlexCardList(
          tabId: tabId,
          items: [],
        );

    final Box<FlexCardList> box = await ref.read(
      flexCardListBoxProvider.future,
    );

    box.put(
      tabId,
      previousTabList.copyWithNewItemToTheRight(
        deviceIds: deviceIds,
        targetItem: item,
      ),
    );
  }

  Future<void> moveItem({
    required FlexCard sourceItem,
    required int targetRowIndex,
    required int targetItemIndex,
  }) async {
    /// Get current value
    final FlexCardList previousTabList = (await ref.read(
          cardListProvider(tabId),
        )) ??
        FlexCardList(
          tabId: tabId,
          items: [],
        );

    /// Update data
    ///
    /// Use cases :
    /// - Target is a full row
    /// -- Source is a full row
    /// --- Source is before target
    /// --- Source is after target
    /// -- Source is a child of a row
    /// - Target is a child of an existing row
    /// -- From the same parent row (just reorder)
    /// -- From another row (update rows)
    /// - Target is a 'no child' item to a row
    ///

    final FlexCard? sourceParentCard = previousTabList.parentOf(
      sourceItem,
    );
    late final FlexCardList nextTabList;

    if (targetItemIndex == -1) {
      /// Target is a full row
      if (sourceParentCard == null) {
        /// Source is a full row
        nextTabList = previousTabList.copyWithMoveItem(
          sourceItemIndex: sourceItem.position,
          targetItemIndex: targetRowIndex,
        );
      } else {
        /// Source is a child of a row
        /// ${item.rowIndex} => $targetRowIndex, itemIndex: ${item.itemIndex} => $targetItemIndex
        /// 5 => 4, itemIndex: 4 => -1
        nextTabList = previousTabList.copyWithDeleteItems(
          cardIdsToDelete: [sourceItem.id],
        ).copyWithAddItems(
          newItems: [
            sourceItem.copyWith(
              position: targetRowIndex,
            )
          ],
        );
      }
    } else {
      /// Target is a child of an existing row
      /// rowIndex: ${item.rowIndex} => $rowIndex, itemIndex: ${item.itemIndex} => $itemIndex');
      final FlexCard targetRowItem = previousTabList.items[targetRowIndex];

      int newId = 1;

      previousTabList.items.forEach(
        (item) {
          newId = max(newId, item.id + 1);
        },
      );

      nextTabList = previousTabList.copyWithDeleteItems(
        /// Remove the source item
        cardIdsToDelete: [sourceItem.id],
      ).copyWithUpdatedItem(
        /// Update the target item
        targetCardId: targetRowItem.id,
        updatedItem: targetRowItem.copyWithNewChild(
          newId: newId++,
          child: sourceItem.copyWith(
            position: targetItemIndex,
          ),
        ),
      );
    }

    /// Store next value
    final Box<FlexCardList> box = await ref.read(
      flexCardListBoxProvider.future,
    );

    box.put(
      tabId,
      nextTabList,
    );
  }

  Future<void> delete({
    required int id,
  }) async =>
      await deleteList(cardIdsToDelete: [id]);

  Future<void> deleteList({
    required List<int> cardIdsToDelete,
  }) async {
    final FlexCardList? previousTabList = await ref.read(
      cardListProvider(tabId),
    );

    if (previousTabList != null) {
      final FlexCardList nextTabList = previousTabList.copyWithDeleteItems(
        cardIdsToDelete: cardIdsToDelete,
      );

      final Box<FlexCardList> box = await ref.read(
        flexCardListBoxProvider.future,
      );

      box.put(
        tabId,
        nextTabList,
      );
    }
  }
}

//   Future<void> _onData(List<FlexCardDBO> dataList) async {
//     final Map<int, List<FlexCard>> children = {};

//     // Children
//     dataList
//         .where((element) => element.parentId != null && element.parentId! > 0)
//         .map((object) => FlexCard(
//               id: object.id,
//               tabId: object.tabId,
//               parentId: object.parentId,
//               stateId: object.stateId,
//               type: object.type,
//               position: object.position,
//               horizontalFlex: object.horizontalFlex,
//               height: object.height,
//               displayLeading: object.displayLeading == 1,
//               displayTrailing: object.displayTrailing == 1,
//               displayTitle: object.displayTitle == 1,
//               displaySubtitle: object.displaySubtitle == 1,
//             ))
//         .forEach((element) {
//       if (element.parentId != null && !children.containsKey(element.parentId)) {
//         children[element.parentId!] = [];
//       }
//       children[element.parentId]!.add(element);
//     });

//     // Parents
//     final result = dataList
//         .where((element) => element.parentId == null || element.parentId! <= 0)
//         .map((object) => FlexCard(
//               id: object.id,
//               tabId: object.tabId,
//               type: object.type,
//               position: object.position,
//               stateId: object.stateId,
//               children: children[object.id],
//               horizontalFlex: object.horizontalFlex,
//               height: object.height,
//               displayLeading: object.displayLeading == 1,
//               displayTrailing: object.displayTrailing == 1,
//               displayTitle: object.displayTitle == 1,
//               displaySubtitle: object.displaySubtitle == 1,
//             ))
//         .toList();

//     for (var _controller in _controllers) {
//       _controller.sink.add(result);
//     }
//   }
// }

// class Database extends _$Database {
//   Database(QueryExecutor e) : super(e);

//   @override
//   int get schemaVersion => 2;

//   @override
//   MigrationStrategy get migration {
//     return MigrationStrategy(
//       onCreate: (Migrator m) {
//         flt.debugPrint("[DRIFT] onCreate");
//         return m.createAll();
//       },
//     );
//   }

//   Stream<List<FlexTabDBO>> watchTabs() => select(flexTabs).watch();
//   Future insertFlexTab(FlexTabsCompanion flexTab) =>
//       into(flexTabs).insert(flexTab);
//   Future<FlexTabDBO?> getFlexTab(int tabId) => (select(flexTabs)
//         ..where(
//           (item) => item.id.equals(tabId),
//         ))
//       .getSingleOrNull();
//   Future deleteFlexTab(int tabId) => (delete(flexTabs)
//         ..where(
//           (item) => item.id.equals(tabId),
//         ))
//       .go();
//   Future updateFlexTabLabel(int tabId, String label) => (update(flexTabs)
//             ..where(
//               (item) => item.id.equals(tabId),
//             ))
//           .write(FlexTabsCompanion(
//         label: Value(label),
//       ));

//   Stream<List<FlexCardDBO>> watchCards(int tabId) => (select(flexCards)
//         ..where((item) => item.tabId.equals(tabId))
//         ..orderBy([
//           (item) => OrderingTerm(expression: item.position),
//           (item) => OrderingTerm(expression: item.id)
//         ]))
//       .watch();
//   Future insertFlexCard(FlexCardsCompanion flexCard) =>
//       into(flexCards).insert(flexCard);
//   Future updateFlexCard(FlexCardDBO flexCard) =>
//       update(flexCards).replace(flexCard);
//   Future updateFlexCardList(
//     List<FlexCard> itemsToUpdate,
//     List<int> cardIdsToDelete,
//     List<FlexCard> itemsToCreate,
//     FlexCard? newRowSourceChild,
//     FlexCard? newRowAddedChild,
//     int newRowAddedChildIndex,
//   ) {
//     return transaction(() async {
//       for (FlexCard card in itemsToUpdate) {
//         await updateFlexCard(card.toDBO());
//       }
//       for (int cardId in cardIdsToDelete) {
//         await deleteFlexCard(cardId);
//       }
//       for (FlexCard itemToCreate in itemsToCreate) {
//         await insertFlexCard(
//           FlexCardsCompanion.insert(
//             tabId: itemToCreate.tabId,
//             parentId: itemToCreate.parentId == null
//                 ? Value.absent()
//                 : Value(itemToCreate.parentId),
//             stateId: itemToCreate.stateId == null || itemToCreate.stateId! <= 0
//                 ? Value.absent()
//                 : Value(itemToCreate.stateId),
//             type: itemToCreate.type,
//             position: itemToCreate.position,
//             horizontalFlex: itemToCreate.horizontalFlex,
//             height: itemToCreate.height,
//             displayLeading: itemToCreate.displayLeading ? 1 : 0,
//             displayTrailing: itemToCreate.displayTrailing ? 1 : 0,
//             displayTitle: itemToCreate.displayTitle ? 1 : 0,
//             displaySubtitle: itemToCreate.displaySubtitle ? 1 : 0,
//           ),
//         );
//       }
//       if (newRowSourceChild != null && newRowAddedChild != null) {
//         final parentId = await insertFlexCard(
//           FlexCardsCompanion.insert(
//             tabId: newRowSourceChild.tabId,
//             parentId: Value.absent(),
//             type: 'row',
//             position: newRowSourceChild.position,
//             horizontalFlex: newRowSourceChild.horizontalFlex,
//             height: newRowSourceChild.height,
//             displayLeading: newRowSourceChild.displayLeading ? 1 : 0,
//             displayTrailing: newRowSourceChild.displayTrailing ? 1 : 0,
//             displayTitle: newRowSourceChild.displayTitle ? 1 : 0,
//             displaySubtitle: newRowSourceChild.displaySubtitle ? 1 : 0,
//           ),
//         );
//         await updateFlexCard(
//           newRowSourceChild
//               .copyWith(
//                 parentId: parentId,
//                 position: newRowAddedChildIndex == 0 ? 1 : 0,
//               )
//               .toDBO(),
//         );
//         if (newRowAddedChild.id > 0) {
//           await updateFlexCard(
//             newRowAddedChild
//                 .copyWith(
//                   parentId: parentId,
//                   position: newRowAddedChildIndex == 0 ? 0 : 1,
//                 )
//                 .toDBO(),
//           );
//         } else {
//           await insertFlexCard(
//             FlexCardsCompanion.insert(
//               tabId: newRowAddedChild.tabId,
//               parentId: Value(parentId),
//               stateId: newRowAddedChild.stateId == null ||
//                       newRowAddedChild.stateId! <= 0
//                   ? Value.absent()
//                   : Value(newRowAddedChild.stateId),
//               type: newRowAddedChild.type,
//               position: newRowAddedChildIndex == 0 ? 0 : 1,
//               horizontalFlex: newRowAddedChild.horizontalFlex,
//               height: newRowAddedChild.height,
//               displayLeading: newRowAddedChild.displayLeading ? 1 : 0,
//               displayTrailing: newRowAddedChild.displayTrailing ? 1 : 0,
//               displayTitle: newRowAddedChild.displayTitle ? 1 : 0,
//               displaySubtitle: newRowAddedChild.displaySubtitle ? 1 : 0,
//             ),
//           );
//         }
//       }
//     });
//   }

//   Future deleteFlexCard(int cardId) => (delete(flexCards)
//         ..where(
//           (item) => item.id.equals(cardId),
//         ))
//       .go();
//   Future removeFlexCardByTab(int tabId) =>
//       (delete(flexCards)..where((item) => item.tabId.equals(tabId))).go();
//   Future removeParentFlexCard(int parentCardId) =>
//       (update(flexCards)..where((item) => item.parentId.equals(parentCardId)))
//           .write(FlexCardsCompanion(
//         parentId: Value(null),
//       ));
// }
