import 'dart:async';

import 'package:flutter/material.dart';

class AutoScrollTimer {
  Timer? _timer;
  // https://github.com/flutter/flutter/issues/62363
  // final GlobalKey<NestedScrollViewState> nestedScrollViewGlobalKey;
  final ScrollController? primaryScrollController;

  AutoScrollTimer({
    this.primaryScrollController,
  });

  double get currentPosition {
    try {
      if (primaryScrollController?.hasClients == true) {
        return primaryScrollController?.position.pixels ?? 0.0;
      }
    } catch (e) {
      debugPrint('AutoScrollTimer error catched on currentPosition');
    }

    return 0.0;
  }

  startUp() {
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(milliseconds: 300),
      (timer) {
        try {
          primaryScrollController?.animateTo(
            primaryScrollController!.position.pixels - 100,
            duration: Duration(milliseconds: 400),
            curve: Curves.linear,
          );
        } catch (e) {
          debugPrint('AutoScrollTimer error catched on animateTo');
        }
      },
    );
  }

  startDown() {
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(milliseconds: 300),
      (timer) {
        try {
          primaryScrollController?.animateTo(
            primaryScrollController!.position.pixels + 100,
            duration: Duration(milliseconds: 400),
            curve: Curves.linear,
          );
        } catch (e) {
          debugPrint('AutoScrollTimer error catched on animateTo');
        }
      },
    );
  }

  stop() {
    _timer?.cancel();
  }
}
