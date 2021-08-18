import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:haponk/data/tabs/entities/positioned_flex_card.dart';
import 'package:haponk/data/tabs/repositories/cards_repository.dart';

class CardsProvider {
  final CardsRepository repository;

  CardsProvider(this.repository);

  StreamController<List<FlexCard>>? _controller;
  StreamSubscription? _repoSubscription;
  List<FlexCard>? _data;

  ///
  /// --- DATA STREAM --- ///
  ///

  Stream<List<FlexCard>> get cardsStream {
    _controller = StreamController<List<FlexCard>>();
    _controller!.onCancel = () => _onControllerCancelled(_controller!);

    // Repo stream subscription
    _repoSubscription?.cancel();
    _repoSubscription = repository.watch().listen(_onData);

    return _controller!.stream;
  }

  void _onControllerCancelled(StreamController<List<FlexCard>> controller) {
    print("[CARDS] Provider _controller.onCancel");
    dispose();
  }

  void dispose() {
    print("[CARDS] Provider dispose");
    _controller?.close();
    _controller = null;

    _repoSubscription?.cancel();
    _repoSubscription = null;
  }

  Future<void> _onData(List<FlexCard> data) async {
    _data = data;
    _controller?.sink.add(data);
  }

  ///
  /// --- ACTIONS --- ///
  ///

  void createItem() {
    int position = 1;

    _data?.forEach((element) => position = max(position, element.position + 1));

    repository.insert(
        type: "deft",
        position: position,
        horizontalFlex: 1,
        verticalFlex: 0,
        width: 0,
        height: 0);
  }

  Future<void> addChildItemAbove(FlexCard item) async {
    final dady = _data?.firstWhere(
      (element) => element.id == item.parentId,
      orElse: () => FlexCard(
        id: 0,
        position: 0,
        tabId: 0,
      ),
    );

    int position = dady == null || dady.id == 0 ? item.position : dady.position;

    final List<FlexCard> updatedItems = [];

    _data?.forEach((element) {
      if (position <= (element.position)) {
        updatedItems.add(element.copyWith(
          position: element.position + 1,
        ));
      }
    });

    final newItem = FlexCard(
      id: 0,
      tabId: item.tabId,
      type: "deft",
      position: position,
      horizontalFlex: 1,
      verticalFlex: 0,
      width: 0,
      height: 0,
    );

    repository.updateList(
      itemsToUpdate: updatedItems,
      itemToCreate: newItem,
    );
  }

  Future<void> addChildItemBelow(FlexCard item) async {
    final dady = _data?.firstWhere(
      (element) => element.id == item.parentId,
      orElse: () => FlexCard(
        id: 0,
        position: 0,
        tabId: 0,
      ),
    );

    int position =
        dady == null || dady.id == 0 ? item.position + 1 : dady.position + 1;

    final List<FlexCard> updatedItems = [];

    _data?.forEach((element) {
      if (position <= element.position) {
        updatedItems.add(element.copyWith(
          position: element.position + 1,
        ));
      }
    });

    final newItem = FlexCard(
      id: 0,
      tabId: item.tabId,
      type: "deft",
      position: position,
      horizontalFlex: 1,
      verticalFlex: 0,
      width: 0,
      height: 0,
    );

    repository.updateList(
      itemsToUpdate: updatedItems,
      itemToCreate: newItem,
    );
  }

  Future<void> addChildItemToTheLeft(FlexCard item) async {
    final dady = _data?.firstWhere(
      (element) => element.id == item.parentId,
      orElse: () => FlexCard(
        id: 0,
        position: 0,
        tabId: 0,
      ),
    );

    if (dady == null || dady.id == 0) {
      FlexCard newRowTargetChild = item;
      int newRowAddedChildIndex = 0;

      // Add new child
      final newRowAddedChild = FlexCard(
        id: 0,
        tabId: item.tabId,
        type: "deft",
        position: 0,
        horizontalFlex: 1,
        verticalFlex: 0,
        width: 0,
        height: 0,
      );

      repository.updateList(
        newRowTargetChild: newRowTargetChild,
        newRowAddedChild: newRowAddedChild,
        newRowAddedChildIndex: newRowAddedChildIndex,
      );
    } else {
      _createChildItem(dady, item.position);
    }
  }

  Future<void> addChildItemToTheRight(FlexCard item) async {
    final dady = _data?.firstWhere(
      (element) => element.id == item.parentId,
      orElse: () => FlexCard(
        id: 0,
        position: 0,
        tabId: 0,
      ),
    );

    if (dady == null || dady.id == 0) {
      FlexCard newRowTargetChild = item;
      int newRowAddedChildIndex = 1;

      // Add new child
      final newRowAddedChild = FlexCard(
        id: 0,
        tabId: item.tabId,
        type: "deft",
        position: 1,
        horizontalFlex: 1,
        verticalFlex: 0,
        width: 0,
        height: 0,
      );

      repository.updateList(
        newRowTargetChild: newRowTargetChild,
        newRowAddedChild: newRowAddedChild,
        newRowAddedChildIndex: newRowAddedChildIndex,
      );
    } else {
      _createChildItem(dady, item.position + 1);
    }
  }

  void _createChildItem(FlexCard _parentItem, int position) {
    final List<FlexCard> updatedItems = [];

    _parentItem.children?.forEach((element) {
      if (position <= element.position) {
        updatedItems.add(element.copyWith(
          position: element.position + 1,
        ));
      }
    });

    final newItem = FlexCard(
      id: 0,
      tabId: _parentItem.tabId,
      parentId: _parentItem.id,
      type: "deft",
      position: position,
      horizontalFlex: 1,
      verticalFlex: 0,
      width: 0,
      height: 0,
    );

    repository.updateList(
      itemsToUpdate: updatedItems,
      itemToCreate: newItem,
    );
  }

  void deleteItem(FlexCard item) {
    if (item.parentId == null || item.parentId! <= 0) {
      repository.delete(id: item.id);
    } else {
      final dady = _data?.firstWhere(
        (element) => element.id == item.parentId,
        orElse: () => FlexCard(
          id: 0,
          position: 0,
          tabId: 0,
        ),
      );

      if (dady == null || dady.id == 0) {
        repository.delete(id: item.id);
      } else {
        if ((dady.children?.length ?? 0) <= 2) {
          repository.deleteList(
            cardIdsToDelete: [item.id, dady.id],
          );
        } else {
          repository.delete(id: item.id);
        }
      }
    }
  }

  void moveItem({
    required PositionedFlexCard item,
    required int rowIndex,
    required int itemIndex,
  }) {
    // Procceed case by case
    debugPrint(
        '[CARDS] moveItem rowIndex: ${item.rowIndex} => $rowIndex, itemIndex: ${item.itemIndex} => $itemIndex');

    if (_data == null || _data!.length < rowIndex) {
      return;
    }

    final List<FlexCard> updatedItems = [];
    final List<FlexCard> toDeleteItems = [];
    FlexCard? newRowTargetChild;
    FlexCard? newRowAddedChild;
    int newRowAddedChildIndex = 0;

    final _mainRows = _data!;
    final FlexCard? _parentItem = item.isChild
        ? _mainRows.firstWhere(
            (element) => element.id == item.card.parentId,
            orElse: () => FlexCard(
              id: 0,
              position: 0,
              tabId: 0,
            ),
          )
        : null;
    final sourceChildren = _parentItem?.children ?? [];
    final _targetItem = _mainRows[rowIndex];

    // Target is a full row
    if (itemIndex == -1) {
      // Source is a full row
      if (_parentItem == null || _parentItem.id == 0) {
        if (item.rowIndex < rowIndex) {
          // rowIndex: ${item.rowIndex} => $rowIndex, itemIndex: ${item.itemIndex} => $itemIndex');
          // rowIndex: 1 => 5, itemIndex: 0 => -1
          for (int index = 0; index < _mainRows.length; index++) {
            FlexCard card = _mainRows[index];
            if (index == item.rowIndex) {
              updatedItems.add(
                card.copyWith(
                  position: rowIndex - 1,
                ),
              );
            } else if (index > item.rowIndex && index < rowIndex) {
              updatedItems.add(
                card.copyWith(
                  position: index - 1,
                ),
              );
            } else if (card.position != index) {
              updatedItems.add(
                card.copyWith(
                  position: index,
                ),
              );
            }
          }
        } else if (item.rowIndex > rowIndex) {
          // rowIndex: ${item.rowIndex} => $rowIndex, itemIndex: ${item.itemIndex} => $itemIndex');
          // rowIndex: 4 => 2, itemIndex: 0 => -1
          for (int index = 0; index < _mainRows.length; index++) {
            FlexCard card = _mainRows[index];
            if (index == item.rowIndex) {
              updatedItems.add(
                card.copyWith(
                  position: rowIndex,
                ),
              );
            } else if (index >= rowIndex && index < item.rowIndex) {
              updatedItems.add(
                card.copyWith(
                  position: index + 1,
                ),
              );
            } else if (card.position != index) {
              updatedItems.add(
                card.copyWith(
                  position: index,
                ),
              );
            }
          }
        }
      } else {
        // Source is a child of a row
        // rowIndex: ${item.rowIndex} => $rowIndex, itemIndex: ${item.itemIndex} => $itemIndex');
        // 5 => 4, itemIndex: 4 => -1
        updatedItems.add(
          item.card.copyWith(
            parentId: null,
            position: rowIndex,
          ),
        );
        for (int index = 0; index < _mainRows.length; index++) {
          FlexCard card = _mainRows[index];
          if (index == item.rowIndex && sourceChildren.length == 2) {
            // Delete source row
            toDeleteItems.add(_parentItem);
            // Source row kepps only one child => change to item
            FlexCard lastChildItem = sourceChildren[0];
            updatedItems.add(
              lastChildItem.copyWith(
                parentId: null,
                position: index >= rowIndex ? index + 1 : index,
              ),
            );
          } else if (index >= rowIndex) {
            updatedItems.add(
              card.copyWith(
                position: index + 1,
              ),
            );
          } else if (card.position != index) {
            updatedItems.add(
              card.copyWith(
                position: index,
              ),
            );
          }
        }
      }
    } else {
      // Target is a child of an existing row
      // rowIndex: ${item.rowIndex} => $rowIndex, itemIndex: ${item.itemIndex} => $itemIndex');
      if (item.rowIndex == rowIndex) {
        // From the same parent row
        // 6 => 6, itemIndex: 2 => 1
        for (int index = 0; index < sourceChildren.length; index++) {
          FlexCard card = sourceChildren[index];
          if (index == item.itemIndex) {
            updatedItems.add(
              card.copyWith(
                position: itemIndex,
              ),
            );
          } else {
            updatedItems.add(
              card.copyWith(
                position: index >= itemIndex ? index + 1 : index,
              ),
            );
          }
        }
      } else if (_targetItem.hasChildren) {
        // From another row
        // 7 => 6, itemIndex: 2 => 2
        if (_parentItem != null) {
          if (sourceChildren.length == 2) {
            // Delete source row
            toDeleteItems.add(_parentItem);
            for (int index = 0; index < sourceChildren.length; index++) {
              FlexCard card = sourceChildren[index];
              if (index != item.itemIndex) {
                updatedItems.add(
                  card.copyWith(
                    parentId: null,
                    position: item.rowIndex,
                  ),
                );
              }
            }
          } else {
            // Keep source row
            for (int index = 0; index < sourceChildren.length; index++) {
              FlexCard card = sourceChildren[index];
              if (index != item.itemIndex) {
                updatedItems.add(
                  card.copyWith(
                    position: index > item.itemIndex ? index - 1 : index,
                  ),
                );
              }
            }
          }
        }
        final _targetChildren = _targetItem.children ?? [];
        for (int index = 0; index < _targetChildren.length; index++) {
          FlexCard card = _targetChildren[index];
          updatedItems.add(
            card.copyWith(
              position: index >= itemIndex ? index + 1 : index,
            ),
          );
        }
        updatedItems.add(
          item.card.copyWith(
            parentId: _targetItem.id,
            position: itemIndex,
          ),
        );
      } else {
        // Target is a 'no child' item to a row
        newRowTargetChild = _targetItem;
        newRowAddedChild = item.card;
        newRowAddedChildIndex = itemIndex;

        if (item.isChild && sourceChildren.length == 2) {
          // Delete source row
          toDeleteItems.add(_parentItem!);
          // Source row kepps only one child => change to item
          FlexCard lastChildItem = sourceChildren[0];
          updatedItems.add(
            lastChildItem.copyWith(
              parentId: null,
              position: _parentItem.position,
            ),
          );
        }
      }
    }

    if (updatedItems.isNotEmpty || newRowTargetChild != null) {
      repository.updateList(
        itemsToUpdate: updatedItems,
        itemsToDelete: toDeleteItems,
        newRowTargetChild: newRowTargetChild,
        newRowAddedChild: newRowAddedChild,
        newRowAddedChildIndex: newRowAddedChildIndex,
      );
    }
  }
}
