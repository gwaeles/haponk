import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haponk/domain/connection/entities/constants.dart';

part 'connection_state.freezed.dart';

@freezed
class ConnectionState with _$ConnectionState {
  factory ConnectionState({
    @Default(ConnectionType.idle) ConnectionType type,
  }) = _ConnectionState;
  ConnectionState._();

  bool get isConnected => type != ConnectionType.idle;
  bool get isNotConnected => type == ConnectionType.idle;
}
