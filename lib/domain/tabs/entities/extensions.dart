import 'dart:math';

import 'package:collection/collection.dart';

import 'flex_card.dart';

extension FlexCardOperations on FlexCard {
  ///
  /// If this is a row, add a new child at the specified index
  /// If not, transform this to a row and create children
  ///
  FlexCard copyWithNewChild({
    required FlexCard child,
    int? newId,
  }) {
    ///
    /// Build children
    ///

    final List<FlexCard> beforeItems = [];
    final List<FlexCard> afterItems = [];

    if (type == CardType.deft) {
      /// Transform current item to a child
      if (child.position == 0) {
        afterItems.add(
          copyWith(position: 1),
        );
      } else {
        beforeItems.add(
          copyWith(position: 0),
        );
      }
    }

    children?.asMap().forEach(
      (index, card) {
        if (card.position < child.position) {
          beforeItems.add(card);
        } else {
          afterItems.add(
            card.copyWith(
              position: card.position + 1,
            ),
          );
        }
      },
    );

    ///
    /// Build row item
    ///

    return copyWith(
      id: newId ?? id,
      type: CardType.row,
      children: [
        ...beforeItems,
        child,
        ...afterItems,
      ],
    );
  }

  FlexCard copyWithoutChildren({
    required List<int> cardIdsToDelete,
  }) {
    if (hasChildren) {
      int position = 0;
      return copyWith(
        children: children
            ?.where(
              (card) => !cardIdsToDelete.contains(card.id),
            )
            .map(
              (card) => card.copyWith(position: position++),
            )
            .toList(),
      );
    }

    return this;
  }

  FlexCard copyRowToItem() {
    if (hasChildren) {
      return children!.first.copyWith(
        position: position,
      );
    }

    return this;
  }
}

extension FlexCardListOperations on FlexCardList {
  FlexCard? parentOf(FlexCard child) {
    return items.firstWhereOrNull(
      (card) => card.id == child.parentId,
    );
  }

  FlexCardList copyWithDeleteItems({
    required List<int> cardIdsToDelete,
  }) {
    int position = 0;
    final List<FlexCard> nextCardList = items
        .where(
          /// Remove specified items
          (card) => !cardIdsToDelete.contains(card.id),
        )
        .map(
          /// Remove specified items in row children
          (card) {
            if (card.hasChildren) {
              final next = card.copyWithoutChildren(
                cardIdsToDelete: cardIdsToDelete,
              );
              if (next.children?.length == 1) {
                /// Replace row by item
                return next.copyRowToItem();
              }
            }
            return card;
          },
        )
        .where(
          (card) => card.children?.length != 0,
        )
        .map(
          (card) => card.copyWith(position: position++),
        )
        .toList();

    return copyWith(
      items: nextCardList,
    );
  }

  ///
  /// Create new card items with the specified device list
  /// The beforeItem or afterItem parameter define the item where insert
  /// the new ones
  /// If the beforeItem and afterItem parameters are null the new items
  /// are added to the end of the list
  ///
  FlexCardList copyWithNewItems({
    required List<String> deviceIds,
    FlexCard? beforeItem,
    FlexCard? afterItem,
  }) {
    int newId = 1;
    int position = 0;

    items.forEach(
      (item) {
        newId = max(newId, item.id + 1);
        position = max(position, item.position + 1);
      },
    );

    if (beforeItem != null) {
      position = beforeItem.position;
    }
    if (afterItem != null) {
      position = afterItem.position + 1;
    }

    final List<FlexCard> beforeItems = [];
    final List<FlexCard> newItems = [];
    final List<FlexCard> afterItems = [];

    items.forEach(
      (card) {
        if (card.position < position) {
          beforeItems.add(card);
        } else {
          afterItems.add(
            card.copyWith(
              position: card.position + deviceIds.length,
            ),
          );
        }
      },
    );

    deviceIds.forEach((id) {
      newItems.add(
        FlexCard(
          id: newId,
          tabId: tabId,
          position: position,
          stateId: id,
        ),
      );
      newId++;
      position++;
    });

    final List<FlexCard> nextCardList = [
      ...beforeItems,
      ...newItems,
      ...afterItems,
    ];

    return copyWith(
      items: nextCardList,
    );
  }

  FlexCardList copyWithNewItemToTheLeft({
    required List<String> deviceIds,
    required FlexCard targetItem,
  }) {
    int newId = 1;
    int position = 0;

    items.forEach(
      (item) {
        newId = max(newId, item.id + 1);
        position = max(position, item.position + 1);
      },
    );

    final List<FlexCard> nextCardList = [];

    final FlexCard? targetParentCard = parentOf(
      targetItem,
    )?.copyWithNewChild(
      newId: newId++,
      child: FlexCard(
        id: newId++,
        tabId: tabId,
        position: targetItem.position,
        stateId: deviceIds.first,
      ),
    );

    if (targetParentCard != null) {
      /// targetItem is a child
      items.forEach(
        (card) {
          if (card.id == targetParentCard.id) {
            nextCardList.add(targetParentCard);
          } else {
            nextCardList.add(card);
          }
        },
      );
    } else {
      /// Transform targetItem to a row
      items.forEach(
        (card) {
          if (card.id == targetItem.id) {
            nextCardList.add(
              targetItem.copyWithNewChild(
                newId: newId++,
                child: FlexCard(
                  id: newId++,
                  tabId: tabId,
                  position: 0,
                  stateId: deviceIds.first,
                ),
              ),
            );
          } else {
            nextCardList.add(card);
          }
        },
      );
    }

    return copyWith(
      items: nextCardList,
    );
  }

  FlexCardList copyWithNewItemToTheRight({
    required List<String> deviceIds,
    required FlexCard targetItem,
  }) {
    int newId = 1;
    int position = 0;

    items.forEach(
      (item) {
        newId = max(newId, item.id + 1);
        position = max(position, item.position + 1);
      },
    );

    final List<FlexCard> nextCardList = [];

    final FlexCard? targetParentCard = parentOf(
      targetItem,
    )?.copyWithNewChild(
      newId: newId++,
      child: FlexCard(
        id: newId++,
        tabId: tabId,
        position: targetItem.position + 1,
        stateId: deviceIds.first,
      ),
    );

    if (targetParentCard != null) {
      /// targetItem is a child
      items.forEach(
        (card) {
          if (card.id == targetParentCard.id) {
            nextCardList.add(targetParentCard);
          } else {
            nextCardList.add(card);
          }
        },
      );
    } else {
      /// Transform targetItem to a row
      items.forEach(
        (card) {
          if (card.id == targetItem.id) {
            nextCardList.add(
              targetItem.copyWithNewChild(
                newId: newId++,
                child: FlexCard(
                  id: newId++,
                  tabId: tabId,
                  position: 1,
                  stateId: deviceIds.first,
                ),
              ),
            );
          } else {
            nextCardList.add(card);
          }
        },
      );
    }

    return copyWith(
      items: nextCardList,
    );
  }

  FlexCardList copyWithAddItems({
    required List<FlexCard> newItems,
  }) {
    final List<FlexCard> beforeItems = [];
    final List<FlexCard> afterItems = [];

    final int position = newItems.firstOrNull?.position ?? 0;

    items.forEach(
      (card) {
        if (card.position < position) {
          beforeItems.add(card);
        } else {
          afterItems.add(
            card.copyWith(
              position: card.position + newItems.length,
            ),
          );
        }
      },
    );

    final List<FlexCard> nextCardList = [
      ...beforeItems,
      ...newItems,
      ...afterItems,
    ];

    return copyWith(
      items: nextCardList,
    );
  }

  FlexCardList copyWithUpdatedItem({
    required int targetCardId,
    required FlexCard updatedItem,
  }) {
    final List<FlexCard> nextCardList = items
        .asMap()
        .map(
          (index, card) => MapEntry(
            index,
            (card.id == targetCardId ? updatedItem : card).copyWith(
              position: index,
            ),
          ),
        )
        .values
        .toList();

    return copyWith(
      items: nextCardList,
    );
  }

  FlexCardList copyWithMoveItem({
    required int sourceItemIndex,
    required int targetItemIndex,
  }) {
    /// 2 use cases
    ///
    /// Source is before target
    /// $sourceItemIndex  => $targetRowIndex,
    /// ex: 1 => 5
    ///
    /// Source is after target
    /// $sourceItemIndex  => $targetRowIndex,
    /// ex: 4 => 2
    ///
    final List<FlexCard> previousCardList = [...items];

    /// offset depends on source and target positions
    final int offset = sourceItemIndex < targetItemIndex ? 1 : 0;

    /// Move the item
    final FlexCard item = previousCardList.removeAt(sourceItemIndex);
    previousCardList.insert(targetItemIndex - offset, item);

    /// Re-order the list
    final List<FlexCard> nextCardList = previousCardList
        .asMap()
        .map((index, card) => MapEntry(
              index,
              card.copyWith(position: index),
            ))
        .values
        .toList();

    return copyWith(
      items: nextCardList,
    );
  }
}
