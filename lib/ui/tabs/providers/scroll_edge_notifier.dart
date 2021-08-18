import 'package:flutter/material.dart';

class ScrollEdgeNotifier extends ChangeNotifier  {
  bool _scrollOnTop = true;
  bool _scrollAtTheEnd = false;

  bool get scrollOnTop => _scrollOnTop;
  bool get scrollAtTheEnd => _scrollAtTheEnd;

  updateScroll(
    double offset,
    double maxScrollExtent,
  ) {
    bool _onTop = offset <= 0.0;
    bool _atTheEnd = offset >= maxScrollExtent;
    if (_onTop != _scrollOnTop || _atTheEnd != _scrollAtTheEnd) {
      _scrollOnTop = _onTop;
      _scrollAtTheEnd = _atTheEnd;
      debugPrint(
          'DragTargetsNotifier _scrollOnTop: $_scrollOnTop, _scrollAtTheEnd: $_scrollAtTheEnd');
      Future.delayed(const Duration(milliseconds: 50))
          .then((value) => notifyListeners());
    }
  }
}