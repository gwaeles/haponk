import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBottomNavigationBar extends StatefulWidget {
  final ScrollController controller;
  final Widget child;

  const AnimatedBottomNavigationBar({Key key, this.controller, this.child})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AnimatedBottomNavigationBarState();
}

class AnimatedBottomNavigationBarState
    extends State<AnimatedBottomNavigationBar> {
  double bottomOffset = 0.0;
  double scrollOffset = 0.0;
  GlobalKey globalKey;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);

    globalKey = GlobalKey();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final widgetHeight = globalKey?.currentContext?.size?.height ?? 57.0;
    double gap = 0.0;
    if (widget.controller.offset > scrollOffset) {
      scrollOffset = widget.controller.offset;
    } else {
      gap = scrollOffset - widget.controller.offset;
    }
    if (gap > widgetHeight) {
      scrollOffset -= gap - widgetHeight;
      gap = widgetHeight;
    }
    var offset = min(0.0, max(gap - widgetHeight, -scrollOffset));
    if (offset != bottomOffset) {
      setState(() {
        bottomOffset = offset;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: globalKey,
      left: 0,
      right: 0,
      bottom: bottomOffset,
      child: widget.child,
    );
  }
}
