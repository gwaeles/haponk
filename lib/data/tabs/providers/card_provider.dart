import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haponk/data/tabs/entities/flex_card.dart';
import 'package:haponk/data/tabs/repositories/cards_repository.dart';

class CardProvider extends ChangeNotifier {
  final CardsRepository repository;

  CardProvider({
    required this.repository,
  });

  int? _cardId;
  FlexCard? _card;
  FlexCard? _parentCard;

  FlexCard? get card => _card;
  FlexCard? get parentCard => _parentCard;
  int get cardId => _cardId ?? 0;

  set cardId(int value) {
    _cardId = value;
    _init();
  }

  StreamSubscription? _repoSubscription;

  ///
  /// --- DATA STREAM --- ///
  ///

  Future<void> _init() async {
    print("[CARD] Provider load card id:$_cardId");
    // Repo stream subscription
    _repoSubscription?.cancel();
    _repoSubscription = repository.watch().listen(_onData);
  }

  @override
  void dispose() {
    print("[CARD] Provider dispose");
    _repoSubscription?.cancel();
    _repoSubscription = null;
    super.dispose();
  }

  Future<void> _onData(List<FlexCard> data) async {
    for (FlexCard item in data) {
      if (item.id == cardId) {
        _card = item;
        _parentCard = null;
        notifyListeners();
      } else if (item.hasChildren) {
        for (FlexCard childItem in item.children!) {
          if (childItem.id == cardId) {
            _card = childItem;
            _parentCard = item;
            notifyListeners();
          }
        }
      }
    }
  }

  ///
  /// --- ACTIONS --- ///
  ///

  void updateCard({
    required FlexCard item,
  }) {
    print("[CARD] Provider updateCard id:${item.id}");
    repository.update(item);
  }
}
