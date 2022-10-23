import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/config/repositories/discover_repository.dart';
import 'package:haponk/data/config/states/discover_state.dart';

part '../events/discover_event.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final DiscoverRepository repository;

  DiscoverBloc({
    required this.repository,
  }) : super(DiscoverState()) {
    on<DiscoverStart>(_onDiscoverStart);
    on<DiscoverDiscovered>(_onDiscoverDiscovered);
    on<DiscoverStop>(_onDiscoverStop);
  }

  StreamSubscription? _subscription;

  ///
  /// --- Events --- ///
  ///

  Future<void> _onDiscoverStart(
    DiscoverStart event,
    Emitter<DiscoverState> emit,
  ) async {
    if (state.status == Status.subscribing || state.status == Status.listening) {
      return;
    }

    emit(
      state.copyWith(status: Status.subscribing),
    );

    _subscription?.cancel();
    _subscription = repository.watch().listen(_onData);

    emit(
      state.copyWith(status: Status.listening),
    );

    repository.start();
  }

  Future<void> _onDiscoverDiscovered(
    DiscoverDiscovered event,
    Emitter<DiscoverState> emit,
  ) async {
    emit(
      DiscoverState(
        status: Status.discovered,
        data: event.data,
      ),
    );
  }

  Future<void> _onDiscoverStop(
    DiscoverStop event,
    Emitter<DiscoverState> emit,
  ) async {
    _subscription?.cancel();
    _subscription = null;
    repository.stop();

    if (state.status != Status.discovered) {
      emit(
        state.copyWith(status: Status.initial),
      );
    }
  }

  void _onData(String data) {
    add(
      DiscoverDiscovered(data),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
