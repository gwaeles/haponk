// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:haponk/core/blocs/constants.dart';
// import 'package:haponk/data/tabs/repositories/flex_cards_repository.dart';
// import 'package:haponk/domain/tabs/entities/flex_card.dart';
// import 'package:haponk/domain/tabs/states/flex_cards_state.dart';

// part 'flex_cards_event.dart';

// final flexCardsBlocProvider = Provider.autoDispose.family<FlexCardsBloc, int>(
//   (ref, tabId) => FlexCardsBloc(
//     ref,
//     tabId,
//   ),
// );

// class FlexCardsBloc extends Bloc<FlexCardsEvent, FlexCardsState> {
//   final Ref ref;
//   final int tabId;

//   FlexCardsBloc(
//     this.ref,
//     this.tabId,
//   ) : super(FlexCardsState(tabId: tabId)) {
//     on<FlexCardsWatch>(_onFlexCardsWatch);
//     on<FlexCardsOnDataEvent>(_onFlexCardsOnDataEvent);
//     on<FlexCardsOnErrorEvent>(_onFlexCardsOnErrorEvent);
//   }

//   RemoveListener? _subscription;
//   bool _isClosing = false;

//   ///
//   /// --- Events --- ///
//   ///

//   Future<void> _onFlexCardsWatch(
//     FlexCardsWatch event,
//     Emitter<FlexCardsState> emit,
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

//     final StateController<List<FlexCard>?> notifier = ref.read(
//       cardListProvider(tabId).notifier,
//     );
//     _subscription?.call();
//     _subscription = notifier.addListener(_onData);
//   }

//   void _onData(List<FlexCard>? data) {
//     if (data != null) {
//       add(
//         FlexCardsOnDataEvent(
//           data: data,
//         ),
//       );
//     }
//   }

//   void _onError([dynamic error]) {
//     if (_subscription != null) {
//       add(
//         FlexCardsOnErrorEvent(error: error is Exception ? error : null),
//       );
//     }
//   }

//   Future<void> _onFlexCardsOnDataEvent(
//     FlexCardsOnDataEvent event,
//     Emitter<FlexCardsState> emit,
//   ) async {
//     emit(
//       state.copyWith(
//         status: StreamStatus.listening,
//         data: event.data,
//       ),
//     );
//   }

//   Future<void> _onFlexCardsOnErrorEvent(
//     FlexCardsOnErrorEvent event,
//     Emitter<FlexCardsState> emit,
//   ) async {
//     emit(
//       state.copyWith(
//         status: StreamStatus.failure,
//         failure: event.error,
//       ),
//     );
//   }

//   @override
//   Future<void> close() {
//     _isClosing = true;
//     _subscription?.call();
//     _subscription = null;
//     return super.close();
//   }
// }
