import 'package:hapoc/features/discovery/domain/repositories/discovery_repository.dart';

class StartDiscoverUseCase {
  final DiscoveryRepository _discoverRepository;
  StartDiscoverUseCase(this._discoverRepository);

  Future<bool> call() {
    return _discoverRepository.startDiscover();
  }
}
