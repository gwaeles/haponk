import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haponk/domain/config/states/config_state.dart';
import 'package:haponk/domain/tabs/entities/flex_tab.dart';

part 'flex_tabs_state.freezed.dart';

@freezed
class FlexTabsState with _$FlexTabsState {
  factory FlexTabsState({
    @Default(Status.initial) Status status,
    List<FlexTab>? data,
    Exception? failure,
  }) = _FlexTabsState;
}
