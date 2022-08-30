import 'package:flutter/material.dart';

enum EditorMode { OFF, IDLE, CUSTOM, REMOVE }

class EditorController extends ChangeNotifier {
  ///
  /// --- Selected item --- ///
  ///

  int _selectedItemId = 0;

  int get selectedItemId => _selectedItemId;

  set selectedItemId(int itemId) {
    _selectedItemId = _selectedItemId == itemId ? 0 : itemId;
    _editorMode = EditorMode.IDLE;
    notifyListeners();
  }

  ///
  /// --- Editor functions --- ///
  ///

  EditorMode _editorMode = EditorMode.OFF;

  EditorMode get editorMode => _editorMode;

  bool get isOn => _editorMode != EditorMode.OFF;

  void toggle() {
    _selectedItemId = 0;
    if (_editorMode == EditorMode.OFF) {
      _editorMode = EditorMode.IDLE;
    } else {
      _editorMode = EditorMode.OFF;
    }
    notifyListeners();
  }
}
