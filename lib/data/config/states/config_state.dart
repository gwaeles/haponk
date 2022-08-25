import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haponk/data/config/entities/config.dart';

part 'config_state.freezed.dart';

@freezed
class ConfigState with _$ConfigState {
  factory ConfigState.idle({
    Config? config,
  }) = ConfigStateIdle;

  factory ConfigState.requesting({
    Config? config,
  }) = ConfigStateRequesting;

  factory ConfigState.validated({
    Config? config,
  }) = ConfigStateValidated;

  factory ConfigState.error({
    Config? config,
  }) = ConfigStateError;
}
