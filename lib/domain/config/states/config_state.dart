import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haponk/domain/config/entities/config.dart';

part 'config_state.freezed.dart';

enum Status {
  initial,
  loading,
  loaded,
  subscribing,
  listening,
  failure,
}

enum ConnexionStatus {
  initial,
  connecting,
  success,
  failure,
}

@freezed
class ConfigState with _$ConfigState {
  factory ConfigState({
    @Default(Status.initial) Status status,
    @Default(ConnexionStatus.initial) ConnexionStatus connexionStatus,
    Config? data,
    Exception? failure,
  }) = _ConfigState;
}
