import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/data/connection/repositories/connection_repository.dart';
import 'package:haponk/domain/config/entities/config.dart';
import 'package:haponk/domain/devices/entities/service_params.dart';

final connectionControllerProvider = Provider.autoDispose<ConnectionController>(
  (ref) => ConnectionController(ref),
);

class ConnectionController {
  final Ref ref;

  ConnectionController(this.ref);

  Future<void> connect(Config config) async {
    final ConnectionRepository repository = await ref.read(
      connectionRepositoryProvider,
    );
    repository.connect(config);
  }

  Future<void> callService(
    ServiceParams params,
  ) async {
    final ConnectionRepository repository = await ref.read(
      connectionRepositoryProvider,
    );
    repository.callService(
      params.domain,
      params.service,
      params.entityId,
      params.brightness,
    );
  }
}
