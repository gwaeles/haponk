import 'package:bonsoir/bonsoir.dart';
import 'package:rxdart/rxdart.dart';

class DiscoverRepository {
  BehaviorSubject<String>? _controller;
  BonsoirDiscovery? _discovery;

  String type = '_home-assistant._tcp';

  Stream<String> watch() {
    if (_controller == null) {
      _controller = BehaviorSubject(
        onCancel: () => _onCancel(),
      );
    }

    return _controller!.stream;
  }

  void _onCancel() {
    if (_controller?.hasListener == false) {
      _controller?.close();
      _controller = null;
    }
  }

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
          _controller?.sink.add(internalUrl);
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
