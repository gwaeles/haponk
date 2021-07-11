import 'dart:async';

import 'package:bonsoir/bonsoir.dart';

class DiscoveryService {
  // This is the type of service we're looking for :
  final String _serviceType = '_home-assistant._tcp.local';

  /// The current Bonsoir discovery object instance.
  BonsoirDiscovery? _bonsoirDiscovery;

  Function(ResolvedBonsoirService service)? onResolvedCallback;

  /// The subscription object.
  StreamSubscription<BonsoirDiscoveryEvent>? _subscription;

  /// Creates a new Bonsoir discovery model instance.
  DiscoveryService();

  /// Starts the Bonsoir discovery.
  Future<bool> start() async {
    if (_bonsoirDiscovery == null || _bonsoirDiscovery!.isStopped) {
      _bonsoirDiscovery = BonsoirDiscovery(type: _serviceType);
      await _bonsoirDiscovery!.ready;
    }

    if (_bonsoirDiscovery!.isReady) {
      await _bonsoirDiscovery!.start();
      _subscription = _bonsoirDiscovery!.eventStream?.listen(_onEventOccurred);
      return true;
    }

    return false;
  }

  /// Stops the Bonsoir discovery.
  void stop() {
    _subscription?.cancel();
    _subscription = null;
    _bonsoirDiscovery?.stop();
  }

  /// Triggered when a Bonsoir discovery event occurred.
  void _onEventOccurred(BonsoirDiscoveryEvent event) {
    if (event.service == null || !event.isServiceResolved) {
      return;
    }

    if (event.type == BonsoirDiscoveryEventType.DISCOVERY_SERVICE_RESOLVED && event.service != null) {
      onResolvedCallback?.call(event.service as ResolvedBonsoirService);
    }
  }
}
