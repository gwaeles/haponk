// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:haponk/core/blocs/constants.dart';

// import 'package:haponk/domain/tabs/entities/flex_tab.dart';
// import 'package:haponk/data/tabs/repositories/flex_tabs_repository.dart';
// import 'package:haponk/domain/tabs/states/flex_tabs_state.dart';

// part 'flex_tabs_event.dart';

// final flexTabsBlocProvider = Provider.autoDispose(FlexTabsBloc.new);

// class FlexTabsBloc extends Bloc<FlexTabsEvent, FlexTabsState> {
//   // final FlexTabsRepository repository;
//   final Ref ref;

//   FlexTabsBloc(
//     this.ref,
//   ) : super(FlexTabsState()) {
//     on<FlexTabsWatch>(_onFlexTabsWatch);
//     on<FlexTabsOnDataEvent>(_onFlexTabsOnDataEvent);
//     on<FlexTabsOnErrorEvent>(_onFlexTabsOnErrorEvent);
//     on<FlexTabsAdd>(_onFlexTabsAdd);
//     on<FlexTabsDeleteItemByIndex>(_onFlexTabsDeleteItemByIndex);
//   }

//   RemoveListener? _subscription;
//   bool _isClosing = false;

//   ///
//   /// --- Events --- ///
//   ///

//   Future<void> _onFlexTabsWatch(
//     FlexTabsWatch event,
//     Emitter<FlexTabsState> emit,
//   ) async {
//     if (_isClosing ||
//         state.status == StreamStatus.subscribing ||
//         state.status == StreamStatus.listening) {
//       return;
//     }

//     emit(
//       state.copyWith(
//         status: StreamStatus.subscribing,
//       ),
//     );

//     final StateController<List<FlexTab>?> notifier = ref.read(
//       tabListProvider.notifier,
//     );
//     _subscription?.call();
//     _subscription = notifier.addListener(_onData);
//   }

//   void _onData(List<FlexTab>? data) {
//     if (data != null) {
//       add(
//         FlexTabsOnDataEvent(
//           data: data,
//         ),
//       );
//     }
//   }

//   void _onError([dynamic error]) {
//     if (_subscription != null) {
//       add(
//         FlexTabsOnErrorEvent(error: error is Exception ? error : null),
//       );
//     }
//   }

//   Future<void> _onFlexTabsOnDataEvent(
//     FlexTabsOnDataEvent event,
//     Emitter<FlexTabsState> emit,
//   ) async {
//     emit(
//       state.copyWith(
//         status: StreamStatus.listening,
//         data: event.data,
//       ),
//     );
//   }

//   Future<void> _onFlexTabsOnErrorEvent(
//     FlexTabsOnErrorEvent event,
//     Emitter<FlexTabsState> emit,
//   ) async {
//     emit(
//       state.copyWith(
//         status: StreamStatus.failure,
//         failure: event.error,
//       ),
//     );
//   }

//   Future<void> _onFlexTabsAdd(
//     FlexTabsAdd event,
//     Emitter<FlexTabsState> emit,
//   ) async {
//     final FlexTabsRepository repository = ref.read(
//       flexTabsRepositoryProvider,
//     );
//     repository.insert(label: event.label);
//   }

//   Future<void> _onFlexTabsDeleteItemByIndex(
//     FlexTabsDeleteItemByIndex event,
//     Emitter<FlexTabsState> emit,
//   ) async {
//     final FlexTabsRepository repository = ref.read(
//       flexTabsRepositoryProvider,
//     );
//     repository.deleteByIndex(index: event.index);
//   }

//   @override
//   Future<void> close() {
//     _subscription?.call();
//     _subscription = null;
//     return super.close();
//   }
// }
