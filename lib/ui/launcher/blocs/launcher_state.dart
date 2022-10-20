part of 'launcher_bloc.dart';

class LauncherState {
  final bool delayElapsed;
  final Config? lastConfig;

  const LauncherState({
    this.delayElapsed = false,
    this.lastConfig,
  });
}
