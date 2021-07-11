import 'package:flutter/material.dart';
import 'package:haponk/core/states/request_state.dart';
import 'package:haponk/features/config/entities/config_entity.dart';
import 'package:haponk/features/config/repositories/config_repository.dart';

class ConfigProvider with ChangeNotifier implements ListenerRequestState {
  final ConfigRepository repository;

  RequestState _state = RequestState.INITIAL;
  bool? _connectionSucceed;

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

  Stream<ConfigEntity> get messageStream => repository.addListener();
  ConfigEntity? get currentConfig => repository.currentConfig;

  ///
  /// --- Request --- ///
  ///

  bool? get connectionSucceed => _connectionSucceed;

  String? typedUrl;
  String? typedToken;

  Future<void> tryConnect() async {
    setState(RequestState.LOADING);
    if (typedToken != null) {
      await repository.setAccessToken(typedToken!);
    }
    _connectionSucceed = await repository.tryConnect(typedUrl ?? '');
    setState(
        _connectionSucceed == true ? RequestState.LOADED : RequestState.ERROR);
  }
}
