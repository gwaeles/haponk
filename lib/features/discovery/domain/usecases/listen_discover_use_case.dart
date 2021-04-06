import 'package:haponk/features/discovery/domain/entities/service_entity.dart';
import 'package:haponk/features/discovery/domain/repositories/discovery_repository.dart';

class ListenDiscoverUseCase {
  final DiscoveryRepository _discoverRepository;
  ListenDiscoverUseCase(this._discoverRepository);

  Stream<List<ServiceEntity>> call() {
    return _discoverRepository.listenDiscover();
  }
}
