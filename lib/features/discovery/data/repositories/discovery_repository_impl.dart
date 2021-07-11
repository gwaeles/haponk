import 'dart:async';

import 'package:bonsoir/bonsoir.dart';
import 'package:haponk/features/discovery/data/datasources/discovery_service.dart';
import 'package:haponk/features/discovery/domain/entities/service_entity.dart';
import 'package:haponk/features/discovery/domain/repositories/discovery_repository.dart';

class DiscoveryRepositoryImpl extends DiscoveryRepository {
  final DiscoveryService _bonsoirService;

  DiscoveryRepositoryImpl(this._bonsoirService);

  List<ServiceEntity> _items = [];

  StreamController<List<ServiceEntity>>? _controller;

  @override
  Stream<List<ServiceEntity>> listenDiscover() {
    _controller?.close();
    _controller = StreamController();
    _bonsoirService.onResolvedCallback = _onDiscover;
    return _controller!.stream;
  }

  @override
  Future<bool> startDiscover() async {
    _items.clear();
    return await _bonsoirService.start();
  }

  @override
  void stopDiscover() {
    _bonsoirService.onResolvedCallback = null;
    _controller?.close();
    _bonsoirService.stop();
    _controller = null;
  }

  void _onDiscover(ResolvedBonsoirService service) {
    if (service.ip != null) {
      _items.add(ServiceEntity(
        name: service.name,
        type: service.type,
        address: service.ip!,
        port: service.port,
      ));
      _controller?.sink.add(_items);
    }
  }
}
