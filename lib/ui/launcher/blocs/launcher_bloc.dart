import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/config/entities/config.dart';


part 'launcher_event.dart';
part 'launcher_state.dart';

///
/// Responsability : emit an event after a time of 250ms
///
class LauncherBloc extends Bloc<LauncherEvent, LauncherState> {
  LauncherBloc() : super(LauncherState()) {
    on<LauncherStart>((event, emit) async {
      await Future.delayed(Duration(milliseconds: 250));

      emit(
        LauncherState(
          delayElapsed: true,
          lastConfig: state.lastConfig,
        ),
      );
    });

    on<LauncherConfigLoaded>((event, emit) {
      emit(
        LauncherState(
          delayElapsed: state.delayElapsed,
          lastConfig: event.data,
        ),
      );
    });
  }
}
