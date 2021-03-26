import 'package:flutter/material.dart';
import 'package:hapoc/core/states/request_state.dart';
import 'package:hapoc/features/config/entities/config_entity.dart';
import 'package:hapoc/features/config/repositories/config_repository.dart';

class ConfigProvider with ChangeNotifier implements ListenerRequestState {
  final ConfigRepository repository;

  RequestState _state = RequestState.INITIAL;
  bool _connectionSucceed;

  ConfigProvider(this.repository);

  ///
  /// --- State --- ///
  ///

  @override
  RequestState get state => _state;

  @override
  void setState(RequestState state) {
    _state = state;
    notifyListeners();
  }

  ///
  /// --- Config --- ///
  ///

  Stream<ConfigEntity> get messageStream => repository.listen();

  @override
  void dispose() {
    repository.dispose();
    super.dispose();
  }

  ///
  /// --- Request --- ///
  ///

  bool get connectionSucceed => _connectionSucceed;

  String typedUrl;
  String typedToken;

  Future<void> tryConnect() async {
    setState(RequestState.LOADING);
    if (typedToken != null) {
      await repository.setAccessToken(typedToken);
    }
    _connectionSucceed = await repository.tryConnect(typedUrl);
    setState(RequestState.LOADED);
  }
}
