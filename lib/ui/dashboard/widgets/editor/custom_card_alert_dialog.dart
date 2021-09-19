import 'package:flutter/material.dart';
import 'package:haponk/data/tabs/providers/card_provider.dart';
import 'package:haponk/data/tabs/repositories/cards_repository.dart';
import 'package:provider/provider.dart';

class CustomCardAlertDialog extends StatelessWidget {
  final int cardId;
  final int tabId;

  const CustomCardAlertDialog({
    Key? key,
    required this.cardId,
    required this.tabId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CardsRepository(
            db: context.read(),
            tabId: tabId,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CardProvider(
            repository: context.read(),
          )..cardId = cardId,
        ),
      ],
      child: _AlertDialogWidget(),
    );
  }
}

class _AlertDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Custom'),
      content: _ParameterListView(),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('OK'),
        ),
      ],
    );
  }
}

class _ParameterListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(
      builder: (context, value, child) {
        return value.card == null ? CircularProgressIndicator() : child!;
      },
      child: Center(
        heightFactor: 1,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Row height"),
              SizedBox(
                height: 8,
              ),
              _CardHeightField(),
              SizedBox(
                height: 8,
              ),
              _CardDisplayTitleField(),
              Container(
                height: 1,
                color: Colors.white12,
              ),
              _CardDisplaySubtitleField(),
              Container(
                height: 1,
                color: Colors.white12,
              ),
              _CardDisplayLeadingField(),
              Container(
                height: 1,
                color: Colors.white12,
              ),
              _CardDisplayTrailingField(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardHeightField extends StatelessWidget {
  final enabledSize = [48, 56, 72, 96, 112, 144];

  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(
      builder: (context, provider, child) {
        if (provider.card == null) {
          return CircularProgressIndicator();
        }

        final card = provider.card!;
        final parentCard = provider.parentCard;
        final item = parentCard ?? card;
        final sizeIndex = enabledSize.indexOf(item.height);

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                provider.updateCard(
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
                provider.updateCard(
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
      },
    );
  }
}

class _CardDisplayTitleField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(
      builder: (context, provider, child) {
        if (provider.card == null) {
          return Container();
        }

        final card = provider.card!;

        return _CardBooleanParamField(
          label: 'Display Title',
          value: card.displayTitle,
          onChanged: (value) => provider.updateCard(
            item: card.copyWith(
              displayTitle: value == true,
            ),
          ),
        );
      },
    );
  }
}

class _CardDisplaySubtitleField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(
      builder: (context, provider, child) {
        if (provider.card == null) {
          return Container();
        }

        final card = provider.card!;

        return _CardBooleanParamField(
          label: 'Display Subtitle',
          value: card.displaySubtitle,
          onChanged: (value) => provider.updateCard(
            item: card.copyWith(
              displaySubtitle: value == true,
            ),
          ),
        );
      },
    );
  }
}

class _CardDisplayLeadingField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(
      builder: (context, provider, child) {
        if (provider.card == null) {
          return Container();
        }

        final card = provider.card!;

        return _CardBooleanParamField(
          label: 'Display main icon',
          value: card.displayLeading,
          onChanged: (value) => provider.updateCard(
            item: card.copyWith(
              displayLeading: value == true,
            ),
          ),
        );
      },
    );
  }
}

class _CardDisplayTrailingField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(
      builder: (context, provider, child) {
        if (provider.card == null) {
          return Container();
        }

        final card = provider.card!;

        return _CardBooleanParamField(
          label: 'Display action icons',
          value: card.displayTrailing,
          onChanged: (value) => provider.updateCard(
            item: card.copyWith(
              displayTrailing: value == true,
            ),
          ),
        );
      },
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
