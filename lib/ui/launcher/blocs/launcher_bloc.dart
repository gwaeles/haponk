import 'package:flutter_bloc/flutter_bloc.dart';

///
/// Responsability : emit an event after a time of 250ms
///
class LauncherBloc extends Cubit<bool> {
  LauncherBloc() : super(false);

  Future<void> start() async {
    await Future.delayed(Duration(milliseconds: 250));

    emit(true);
  }
}
