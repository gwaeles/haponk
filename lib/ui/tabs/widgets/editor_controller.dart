import 'package:flutter/material.dart';

enum EditorMode { IDLE, CUSTOM, REMOVE }

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

  EditorMode _editorMode = EditorMode.IDLE;

  EditorMode get editorMode => _editorMode;

  void toggleEditorMode(EditorMode mode) {
    _selectedItemId = 0;
    if (_editorMode == mode) {
      _editorMode = EditorMode.IDLE;
    } else {
      _editorMode = mode;
    }
    notifyListeners();
  }
}
