import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/data/config/repositories/discover_repository.dart';
import 'package:haponk/domain/config/states/discover_state.dart';

part 'discover_event.dart';

final discoverBlocProvider = Provider(DiscoverBloc.new);

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final Ref ref;

  DiscoverBloc(this.ref) : super(DiscoverState()) {
    on<DiscoverStart>(_onDiscoverStart);
    on<DiscoverDiscovered>(_onDiscoverDiscovered);
    on<DiscoverStop>(_onDiscoverStop);
  }

  RemoveListener? _subscription;

  ///
  /// --- Events --- ///
  ///

  Future<void> _onDiscoverStart(
    DiscoverStart event,
    Emitter<DiscoverState> emit,
  ) async {
    if (state.status == Status.subscribing ||
        state.status == Status.listening) {
      return;
    }

    emit(
      state.copyWith(status: Status.subscribing),
    );

    final StateController<String?> notifier = ref.read(
      discoveredProvider.notifier,
    );
    _subscription?.call();
    _subscription = notifier.addListener(_onData);

    emit(
      state.copyWith(status: Status.listening),
    );

    final DiscoverRepository repository = ref.read(
      discoverRepositoryProvider,
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
    _subscription?.call();
    _subscription = null;
    final DiscoverRepository repository = ref.read(
      discoverRepositoryProvider,
    );
    repository.stop();

    if (state.status != Status.discovered) {
      emit(
        state.copyWith(status: Status.initial),
      );
    }
  }

  void _onData(String? data) {
    if (data != null) {
      add(
        DiscoverDiscovered(data),
      );
    }
  }

  @override
  Future<void> close() {
    _subscription?.call();
    _subscription = null;
    return super.close();
  }
}
