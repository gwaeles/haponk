import 'package:hapoc/features/devices/entities/device.dart';

abstract class DevicesRepository {
  Stream<List<Device>> addListener();
  void dispose();
}
