import 'package:hapoc/features/devices/entities/device.dart';

abstract class DevicesRepository {
  Stream<List<Device>> listen();
  void dispose();
}