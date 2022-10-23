import 'package:freezed_annotation/freezed_annotation.dart';

part 'discover_state.freezed.dart';

enum Status {
  initial,
  subscribing,
  listening,
  discovered,
}

@freezed
class DiscoverState with _$DiscoverState {
  factory DiscoverState({
    @Default(Status.initial) Status status,
    String? data,
  }) = _DiscoverState;
}
