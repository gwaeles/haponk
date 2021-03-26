import 'package:flutter/material.dart';
import 'package:hapoc/features/devices/entities/device.dart';
import 'package:hapoc/features/devices/repositories/devices_repository.dart';

class DevicesProvider with ChangeNotifier {
  final DevicesRepository repository;

  DevicesProvider(this.repository);

  Stream<List<Device>> get messageStream => repository.listen();
  
  @override
  void dispose() {
    repository.dispose();
    super.dispose();
  }

}