import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBottomNavigationBar extends StatefulWidget {
  final List<ScrollController> controllers;
  final int currentIndex;
  final Widget child;

  const AnimatedBottomNavigationBar(
      {Key key, this.controllers, this.currentIndex, this.child})
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
    for (var controller in widget.controllers) {
      controller.addListener(_onScroll);
    }

    globalKey = GlobalKey();
  }

  @override
  void dispose() {
    for (var controller in widget.controllers) {
      controller.removeListener(_onScroll);
    }
    super.dispose();
  }

  void _onScroll() {
    final widgetHeight = globalKey?.currentContext?.size?.height ?? 57.0;
    double gap = 0.0;
    final controller = widget.controllers[widget.currentIndex];
    if (controller.offset > scrollOffset) {
      scrollOffset = controller.offset;
    } else {
      gap = scrollOffset - controller.offset;
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
