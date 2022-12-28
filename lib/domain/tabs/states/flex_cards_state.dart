import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haponk/domain/config/states/config_state.dart';
import 'package:haponk/domain/tabs/entities/flex_card.dart';

part 'flex_cards_state.freezed.dart';

@freezed
class FlexCardsState with _$FlexCardsState {
  factory FlexCardsState({
    @Default(Status.initial) Status status,
    required int tabId,
    List<FlexCard>? data,
    Exception? failure,
  }) = _FlexCardsState;
}
