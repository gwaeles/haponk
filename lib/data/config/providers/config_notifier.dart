import 'package:flutter/material.dart';
import 'package:haponk/core/states/request_state.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:haponk/data/config/repositories/config_repository.dart';

class ConfigNotifier with ChangeNotifier implements ListenerRequestState {
  final ConfigRepository repository;

  RequestState _state = RequestState.INITIAL;
  bool? _connectionSucceed;

  ConfigNotifier({
    required this.repository,
  });

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

  Stream<Config> get messageStream => repository.addListener();
  Config? get currentConfig => repository.currentConfig;

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
      _connectionSucceed == true ? RequestState.LOADED : RequestState.ERROR,
    );
  }
}
