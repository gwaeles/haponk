import 'package:haponk/data/devices/entities/device.dart';

abstract class DevicesRepository {
  Stream<List<Device>> addListener();
  void dispose();
}
