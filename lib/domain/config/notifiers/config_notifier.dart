import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/data/config/repositories/config_repository.dart';
import 'package:haponk/domain/config/entities/config.dart';

final lastConfigProvider = FutureProvider<Config>((ref) async {
  final ConfigRepository repository = await ref.read(
    configRepositoryProvider,
  );
  final Config lastConfigonfig = await repository.getLastConfig();

  return lastConfigonfig;
});

// final configNotifier = StateNotifierProvider<ConfigNotifier, ConfigState>(
//   (ref) {
//     return ConfigNotifier(ref);
//   },
// );

// class ConfigNotifier extends StateNotifier<ConfigState> {
//   final Ref ref;

//   ConfigNotifier(this.ref) : super(ConfigState());

//   Future<void> getLastConfig() async {
//     if (state.status == Status.loading) {
//       return;
//     }

//     state = state.copyWith(
//       status: Status.loading,
//     );

//     final ConfigRepository repository = await ref.read(
//       configRepositoryProvider,
//     );
//     final config = await repository.getLastConfig();

//     state = state.copyWith(
//       status: Status.loaded,
//       data: config,
//     );
//   }
// }
