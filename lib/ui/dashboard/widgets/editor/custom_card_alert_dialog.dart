import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/domain/tabs/controllers/cards_controller.dart';

import 'package:haponk/domain/tabs/entities/flex_card.dart';
import 'package:haponk/domain/tabs/states/flex_cards_state.dart';

class CustomCardAlertDialog extends ConsumerWidget {
  final int cardId;
  final int tabId;

  const CustomCardAlertDialog({
    Key? key,
    required this.cardId,
    required this.tabId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _AlertDialogWidget(
      tabId: tabId,
      cardId: cardId,
    );
  }
}

class _AlertDialogWidget extends StatelessWidget {
  final int tabId;
  final int cardId;

  const _AlertDialogWidget({
    super.key,
    required this.tabId,
    required this.cardId,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Custom'),
      content: _ParameterListView(
        tabId: tabId,
        cardId: cardId,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('OK'),
        ),
      ],
    );
  }
}

class _ParameterListView extends ConsumerWidget {
  final int tabId;
  final int cardId;

  const _ParameterListView({
    super.key,
    required this.tabId,
    required this.cardId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FlexCardsState state = ref.watch(flexCardsStateProvider(tabId));

    FlexCard? card;
    for (int i = 0; i < (state.data?.length ?? 0); i++) {
      if (cardId == state.data![i].id) {
        card = state.data![i];
      }
      if (state.data![i].hasChildren) {
        for (int j = 0; j < (state.data![i].children?.length ?? 0); j++) {
          if (cardId == state.data![i].children![j].id) {
            card = state.data![i].children![j];
          }
        }
      }
    }

    FlexCard? parentCard = state.data?.firstWhereOrNull(
      (parent) => parent.id == card?.parentId,
    );

    if (card == null || (card.parentId != null && parentCard == null)) {
      return CircularProgressIndicator();
    }

    return Center(
      heightFactor: 1,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Row height"),
            SizedBox(
              height: 8,
            ),
            _CardHeightField(
              card: card,
              parentCard: parentCard,
            ),
            SizedBox(
              height: 8,
            ),
            _CardDisplayTitleField(
              card: card,
            ),
            Container(
              height: 1,
              color: Colors.white12,
            ),
            _CardDisplaySubtitleField(
              card: card,
            ),
            Container(
              height: 1,
              color: Colors.white12,
            ),
            _CardDisplayLeadingField(
              card: card,
            ),
            Container(
              height: 1,
              color: Colors.white12,
            ),
            _CardDisplayTrailingField(
              card: card,
            ),
          ],
        ),
      ),
    );
  }
}

class _CardHeightField extends ConsumerWidget {
  final List<int> enabledSize = [48, 56, 72, 96, 112, 144];
  final FlexCard card;
  final FlexCard? parentCard;

  _CardHeightField({
    Key? key,
    required this.card,
    required this.parentCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = parentCard ?? card;
    final sizeIndex = enabledSize.indexOf(item.height);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            ref.read(cardsControllerProvider(item.tabId)).updateCard(
                  item: item.copyWith(
                    height: sizeIndex <= 0
                        ? enabledSize[0]
                        : enabledSize[sizeIndex - 1],
                  ),
                );
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.remove),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: enabledSize[enabledSize.length - 1].toDouble(),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: (parentCard ?? card).height.toDouble(),
                    color: Colors.white12,
                    child: Center(
                      child: Text('${(parentCard ?? card).height}'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            ref.read(cardsControllerProvider(item.tabId)).updateCard(
                  item: item.copyWith(
                    height: sizeIndex < 0 || sizeIndex >= enabledSize.length - 1
                        ? enabledSize[enabledSize.length - 1]
                        : enabledSize[sizeIndex + 1],
                  ),
                );
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

class _CardDisplayTitleField extends ConsumerWidget {
  final FlexCard card;

  const _CardDisplayTitleField({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _CardBooleanParamField(
      label: 'Display Title',
      value: card.displayTitle,
      onChanged: (value) =>
          ref.read(cardsControllerProvider(card.tabId)).updateCard(
                item: card.copyWith(
                  displayTitle: value == true,
                ),
              ),
    );
  }
}

class _CardDisplaySubtitleField extends ConsumerWidget {
  final FlexCard card;

  const _CardDisplaySubtitleField({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _CardBooleanParamField(
      label: 'Display Subtitle',
      value: card.displaySubtitle,
      onChanged: (value) =>
          ref.read(cardsControllerProvider(card.tabId)).updateCard(
                item: card.copyWith(
                  displaySubtitle: value == true,
                ),
              ),
    );
  }
}

class _CardDisplayLeadingField extends ConsumerWidget {
  final FlexCard card;

  const _CardDisplayLeadingField({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _CardBooleanParamField(
      label: 'Display main icon',
      value: card.displayLeading,
      onChanged: (value) =>
          ref.read(cardsControllerProvider(card.tabId)).updateCard(
                item: card.copyWith(
                  displayLeading: value == true,
                ),
              ),
    );
  }
}

class _CardDisplayTrailingField extends ConsumerWidget {
  final FlexCard card;

  const _CardDisplayTrailingField({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _CardBooleanParamField(
      label: 'Display action icons',
      value: card.displayTrailing,
      onChanged: (value) =>
          ref.read(cardsControllerProvider(card.tabId)).updateCard(
                item: card.copyWith(
                  displayTrailing: value == true,
                ),
              ),
    );
  }
}

class _CardBooleanParamField extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const _CardBooleanParamField({
    Key? key,
    required this.label,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(label),
        ),
        SizedBox(
          width: 8,
          height: 56,
        ),
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
