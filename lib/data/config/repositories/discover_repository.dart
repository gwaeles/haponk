import 'package:bonsoir/bonsoir.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final discoverRepositoryProvider = Provider(DiscoverRepository.new);
final discoveredProvider = StateProvider<String?>((ref) => null);

class DiscoverRepository {
  BonsoirDiscovery? _discovery;
  final Ref ref;

  DiscoverRepository(this.ref);

  String type = '_home-assistant._tcp';

  Future<void> start() async {
    if (_discovery == null) {
      _discovery = BonsoirDiscovery(type: type);
    }
    await _discovery!.ready;

    _discovery!.eventStream!.listen((event) {
      if (event.type == BonsoirDiscoveryEventType.discoveryServiceResolved) {
        final data = event.service?.toJson();
        print('Service found : ${event.service?.toJson()}');
        if (data != null) {
          final ip = data['service.ip'];
          final port = data['service.port'];
          final internalUrl = 'https://$ip:$port';
          ref.read(discoveredProvider.notifier).state = internalUrl;
          stop();
        }
      } else if (event.type == BonsoirDiscoveryEventType.discoveryServiceLost) {
        print('Service lost : ${event.service?.toJson()}');
      }
    });

    await _discovery!.start();
  }

  Future<void> stop() async {
    await _discovery?.stop();
    _discovery = null;
  }
}
