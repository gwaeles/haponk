import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haponk/ui/supervisor/bottom_navigation/bottom_navigation_bar_controller.dart';

class BottomNavigationBarPage extends StatefulWidget {

  const BottomNavigationBarPage({Key key, @required this.pageIndex, @required this.child, @required this.pageIndexController}) : super(key: key);

  final int pageIndex;
  final Widget child;
  final BottomNavigationBarController pageIndexController;

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomNavigationBarPage>
    with SingleTickerProviderStateMixin {

  Widget _child;

  AnimationController controller;
  Animation<double> fadeAnimation;
  Animation<Offset> slideAnimation;

  ///
  /// Lifecycle
  ///

  @override
  void initState() {
    super.initState();
    widget.pageIndexController?.addListener(_onPageIndexChange);

    // Animation
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    fadeAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeIn);
    // No slide animation on the first display
    slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    ));

    _onPageIndexChange();
  }

  @override
  void dispose() {
    widget.pageIndexController?.removeListener(_onPageIndexChange);
    super.dispose();
  }

  ///
  /// Layout
  ///

  @override
  Widget build(BuildContext context) {

    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: _child
      ),
    );
  }

  ///
  /// Events
  ///

  _onPageIndexChange() {
    if (_child  == null && widget.pageIndexController.value == widget.pageIndex) {
      setState(() {
        _child = widget.child;
      });
    }
    else {
      if (controller.duration.inMilliseconds == 450) {
        //setState(() {
          controller.duration = Duration(milliseconds: 250);
          slideAnimation = Tween<Offset>(
            begin: const Offset(0.0, 0.03),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: controller,
            curve: Curves.easeIn,
          ));
        //});
      }
    }
      if (widget.pageIndexController.value == widget.pageIndex) {
        controller.forward();
      }
      else {
        controller.reverse();
      }
  }
}