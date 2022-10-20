import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/config/entities/config.dart';
import 'package:haponk/data/config/repositories/config_repository.dart';
import 'package:haponk/data/config/states/config_state.dart';

part '../events/config_event.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  final ConfigRepository repository;

  ConfigBloc({
    required this.repository,
  }) : super(ConfigState()) {
    on<ConfigGetLast>(_onConfigGetLast);
    on<ConfigWatch>(_onConfigWatchLast);
    on<ConfigChanged>(_onConfigChanged);
    on<ConfigUpdate>(_onConfigUpdate);
    on<ConfigTryConnect>(_onConfigTryConnect);
  }

  StreamSubscription? _subscription;

  ///
  /// --- Events --- ///
  ///

  Future<void> _onConfigGetLast(
    ConfigGetLast event,
    Emitter<ConfigState> emit,
  ) async {
    if (state.status == Status.loading) {
      return;
    }

    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );

    final config = await repository.getLastConfig();

    emit(
      state.copyWith(
        status: Status.loaded,
        data: config,
      ),
    );
  }

  Future<void> _onConfigWatchLast(
    ConfigWatch event,
    Emitter<ConfigState> emit,
  ) async {
    if (state.status == Status.subscribing) {
      return;
    }

    emit(
      state.copyWith(
        status: Status.subscribing,
      ),
    );

    _subscription?.cancel();
    _subscription = repository.configStream(key: event.key).listen(_onData);

    emit(
      state.copyWith(
        status: Status.listening,
      ),
    );
  }

  Future<void> _onConfigChanged(
    ConfigChanged event,
    Emitter<ConfigState> emit,
  ) async {
    emit(
      state.copyWith(
        status: state.status == Status.subscribing ? Status.listening : state.status,
        data: event.data,
      ),
    );
  }

  Future<void> _onConfigUpdate(
    ConfigUpdate event,
    Emitter<ConfigState> emit,
  ) async {
    if (state.data == null) {
      return;
    }

    final config = state.data!.copyWith(
      internalUrl: event.internalUrl ?? state.data!.internalUrl,
      accessToken: event.accessTocken ?? state.data!.accessToken,
      lastConnection: event.accessTocken != null ? null : state.data!.lastConnection,
    );

    await repository.update(config);

    emit(
      state.copyWith(
        data: config,
        connexionStatus:
            event.internalUrl != null || event.internalUrl != null ? ConnexionStatus.initial : state.connexionStatus,
      ),
    );
  }

  Future<void> _onConfigTryConnect(
    ConfigTryConnect event,
    Emitter<ConfigState> emit,
  ) async {
    if (state.data == null || state.connexionStatus == ConnexionStatus.connecting) {
      return;
    }

    emit(
      state.copyWith(
        connexionStatus: ConnexionStatus.connecting,
      ),
    );

    final config = await repository.tryConnect(state.data!);

    if (config == null) {
      emit(
        state.copyWith(
          connexionStatus: ConnexionStatus.failure,
        ),
      );
    } else {
      emit(
        state.copyWith(
          connexionStatus: ConnexionStatus.success,
          data: config,
        ),
      );
      add(ConfigUpdate());
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  ///
  /// --- Request --- ///
  ///

  void _onData(Config event) {
    add(
      ConfigChanged(
        data: event,
      ),
    );
  }
}
