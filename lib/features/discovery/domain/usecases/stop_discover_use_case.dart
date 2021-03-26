import 'package:hapoc/features/discovery/domain/repositories/discovery_repository.dart';

class StopDiscoverUseCase {
  final DiscoveryRepository _discoverRepository;
  StopDiscoverUseCase(this._discoverRepository);

  void call() {
    return _discoverRepository.stopDiscover();
  }
}
