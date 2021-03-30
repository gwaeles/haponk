import 'package:hapoc/features/devices/entities/device.dart';
import 'package:hapoc/features/devices/repositories/devices_repository.dart';

class DevicesProvider {
  final DevicesRepository repository;

  DevicesProvider(this.repository);

  Stream<List<Device>> get deviceStream => repository.addListener();
}