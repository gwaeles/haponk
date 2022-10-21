import 'package:flutter/material.dart';

class DeviceSelectionNotifier extends ChangeNotifier {
  final int maxItem;
  final List<String> _ids = [];

  DeviceSelectionNotifier(this.maxItem);

  List<String> get ids => _ids;

  void toggle(String? id) {
    if (id != null) {
      if (maxItem == 1) {
        _ids.clear();
      }
      if (maxItem < 2 || _ids.length < maxItem) {
        if (_ids.contains(id)) {
          _ids.remove(id);
        } else {
          _ids.add(id);
        }
        notifyListeners();
      }
    }
  }
}
