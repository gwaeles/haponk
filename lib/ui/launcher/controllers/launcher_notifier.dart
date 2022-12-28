import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/domain/config/entities/config.dart';
import 'package:haponk/domain/config/notifiers/config_notifier.dart';
import 'package:haponk/ui/launcher/controllers/launcher_state.dart';

final launcherNotifier = StateProvider.autoDispose<LauncherState>((ref) {
  final AsyncValue<Config> configState = ref.watch(lastConfigProvider);
  final bool delayElapsed = ref.watch(delayNotifier);

  return configState.when(
    loading: () => LauncherState(
      delayElapsed: delayElapsed,
    ),
    error: (error, stack) => LauncherState(
      delayElapsed: delayElapsed,
    ),
    data: (data) => LauncherState(
      delayElapsed: delayElapsed,
      lastConfig: data,
    ),
  );
});

final delayNotifier = StateNotifierProvider<DelayNotifier, bool>((ref) {
  return DelayNotifier();
});

class DelayNotifier extends StateNotifier<bool> {
  DelayNotifier() : super(false) {
    start();
  }

  void start() => Future.delayed(Duration(milliseconds: 250)).then(
        (value) => state = true,
      );
}
