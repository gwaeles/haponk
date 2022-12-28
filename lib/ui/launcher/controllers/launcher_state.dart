
import 'package:haponk/domain/config/entities/config.dart';

class LauncherState {
  final bool delayElapsed;
  final Config? lastConfig;

  const LauncherState({
    this.delayElapsed = false,
    this.lastConfig,
  });
}
