import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final bool displayButton;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final IconData icon;
  final VoidCallback? onPressed;

  const ActionButton({
    Key? key,
    this.displayButton = false,
    this.left,
    this.top,
    this.right,
    this.bottom,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: AnimatedOpacity(
        opacity: displayButton ? 1 : 0,
        duration: const Duration(milliseconds: 2500),
        child: IgnorePointer(
          ignoring: !displayButton,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              IconButton(
                color: Colors.white,
                splashColor: Colors.lightBlue.shade200,
                icon: Icon(icon),
                splashRadius: 24,
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
