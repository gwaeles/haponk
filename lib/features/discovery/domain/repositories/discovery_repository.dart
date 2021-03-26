import 'package:hapoc/features/discovery/domain/entities/service_entity.dart';

abstract class DiscoveryRepository {
  Future<bool> startDiscover();
  void stopDiscover();
  Stream<List<ServiceEntity>> listenDiscover();
}
