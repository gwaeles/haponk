part of 'launcher_bloc.dart';

abstract class LauncherEvent {
  const LauncherEvent();
}

class LauncherStart extends LauncherEvent {
  const LauncherStart();
}

class LauncherConfigLoaded extends LauncherEvent {
  final Config data;
  
  const LauncherConfigLoaded(this.data);
}
