import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:haponk/data/config/repositories/config_repository.dart';
import 'package:haponk/data/config/states/config_state.dart';

class ConfigBloc extends Cubit<ConfigState> {
  ConfigBloc({
    required this.repository,
  }) : super(ConfigState.idle()) {
    _init();
  }

  final ConfigRepository repository;
  StreamSubscription? _subscription;

  ///
  /// --- Config --- ///
  ///

  void _init() {
    _subscription = repository.configStream().listen(_onData);
  }

  void _onData(Config event) {
    emit(
      state.copyWith(
        config: event,
      ),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  ///
  /// --- Request --- ///
  ///

  Future<void> tryConnect({
    String? url,
    String? accessTocken,
  }) async {
    if (state is ConfigStateRequesting) {
      return;
    }

    emit(
      ConfigState.requesting(
        config: state.config,
      ),
    );

    if (accessTocken != null) {
      await repository.setAccessToken(accessTocken);
    }

    final config = await repository.tryConnect(
      url ?? '',
      accessTocken,
    );

    if (config == null) {
      emit(
        ConfigState.error(
          config: state.config,
        ),
      );
    } else {
      emit(
        ConfigState.validated(
          config: config,
        ),
      );
    }
  }
}
