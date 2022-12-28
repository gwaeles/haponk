import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/data/tabs/repositories/flex_cards_repository.dart';
import 'package:haponk/domain/config/states/config_state.dart';
import 'package:haponk/domain/tabs/entities/flex_card.dart';
import 'package:haponk/domain/tabs/entities/positioned_flex_card.dart';
import 'package:haponk/domain/tabs/states/flex_cards_state.dart';

final flexCardsStateProvider =
    StateProvider.autoDispose.family<FlexCardsState, int>(
  (ref, tabId) {
    final FlexCardList? cardList = ref.watch(cardListProvider(tabId));

    if (cardList != null) {
      debugPrint('[GARY] ---START---tabId: ${cardList.tabId}----------');
      cardList.items.forEach(
        (card) => debugPrint('[GARY] ${card.toString()}'),
      );
      debugPrint('[GARY] ---END-----------------------');
    }

    return FlexCardsState(
      tabId: tabId,
      status: Status.loaded,
      data: cardList?.items,
    );
  },
);

final cardsControllerProvider =
    Provider.autoDispose.family<CardsController, int>(
  (ref, tabId) => CardsController(ref, tabId),
);

class CardsController {
  final Ref ref;
  final int tabId;

  CardsController(this.ref, this.tabId);

  Future<void> createItems({
    required List<String> deviceIds,
  }) async {
    final FlexCardsRepository repository = await ref.read(
      flexCardsRepositoryProvider(tabId),
    );
    repository.createItems(
      deviceIds: deviceIds,
    );
  }

  Future<void> updateCard({
    required FlexCard item,
  }) async {
    final FlexCardsRepository repository = await ref.read(
      flexCardsRepositoryProvider(tabId),
    );
    repository.update(
      item,
    );
  }

  Future<void> addChildItemAbove({
    required List<String> deviceIds,
    required FlexCard item,
  }) async {
    final FlexCardsRepository repository = await ref.read(
      flexCardsRepositoryProvider(tabId),
    );
    repository.createItems(
      deviceIds: deviceIds,
      beforeItem: item,
    );
  }

  Future<void> addChildItemBelow({
    required List<String> deviceIds,
    required FlexCard item,
  }) async {
    final FlexCardsRepository repository = await ref.read(
      flexCardsRepositoryProvider(tabId),
    );
    repository.createItems(
      deviceIds: deviceIds,
      afterItem: item,
    );
  }

  Future<void> addChildItemToTheLeft({
    required List<String> deviceIds,
    required FlexCard item,
  }) async {
    final FlexCardsRepository repository = await ref.read(
      flexCardsRepositoryProvider(tabId),
    );
    repository.addChildItemToTheLeft(
      deviceIds: deviceIds,
      item: item,
    );
  }

  Future<void> addChildItemToTheRight({
    required List<String> deviceIds,
    required FlexCard item,
  }) async {
    final FlexCardsRepository repository = await ref.read(
      flexCardsRepositoryProvider(tabId),
    );
    repository.addChildItemToTheRight(
      deviceIds: deviceIds,
      item: item,
    );
  }

  Future<void> deleteItem(FlexCard item) async {
    final FlexCardsRepository repository = await ref.read(
      flexCardsRepositoryProvider(tabId),
    );
    repository.delete(id: item.id);
  }

  Future<void> moveItem({
    required PositionedFlexCard item,
    required int rowIndex,
    required int itemIndex,
  }) async {
    final FlexCardsRepository repository = await ref.read(
      flexCardsRepositoryProvider(tabId),
    );
    repository.moveItem(
      sourceItem: item.card,
      targetRowIndex: rowIndex,
      targetItemIndex: itemIndex,
    );
  }
}
