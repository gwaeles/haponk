import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haponk/ui/app_navigation/providers/bottom_navigation_bar_controller.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({
    Key? key,
    required this.pageIndex,
    required this.child,
    required this.pageIndexController,
  }) : super(key: key);

  final int pageIndex;
  final Widget child;
  final BottomNavigationBarController pageIndexController;

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomNavigationBarPage>
    with SingleTickerProviderStateMixin {
  Widget? _child;
  late Duration _duration;
  late double _opacity;
  late Matrix4 _matrix;

  ///
  /// Lifecycle
  ///

  @override
  void initState() {
    super.initState();
    widget.pageIndexController.addListener(_onPageIndexChange);

    _duration = const Duration(milliseconds: 450);
    _opacity = 0;
    _matrix = Matrix4.identity();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _onPageIndexChange(),
    );
  }

  @override
  void dispose() {
    widget.pageIndexController.removeListener(_onPageIndexChange);
    super.dispose();
  }

  ///
  /// Layout
  ///

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: _duration,
      opacity: _opacity,
      curve: Curves.easeIn,
      child: AnimatedContainer(
        duration: _duration,
        transform: _matrix,
        curve: Curves.easeIn,
        child: _child,
      ),
    );
  }

  ///
  /// Events
  ///

  _onPageIndexChange() {
    if (_child == null &&
        widget.pageIndexController.value == widget.pageIndex) {
      setState(() {
        _child = widget.child;
        _opacity = 1;
        _matrix = Matrix4.identity();
      });
    } else if (_child != null &&
        widget.pageIndexController.value != widget.pageIndex) {
      setState(() {
        _duration = const Duration(milliseconds: 250);
        _opacity = 0;
        _matrix = Matrix4.identity()..translate(0.0, 20.0);
      });
    } else if (widget.pageIndexController.value == widget.pageIndex) {
      setState(() {
        _duration = const Duration(milliseconds: 250);
        _opacity = 1;
        _matrix = Matrix4.identity();
      });
    }
  }
}
