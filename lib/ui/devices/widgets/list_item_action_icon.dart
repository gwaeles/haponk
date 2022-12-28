import 'package:flutter/material.dart';

class ListItemActionIcon extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback? onTap;

  const ListItemActionIcon({Key? key, required this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      onTap: onTap,
      child: Ink(
        width: 48,
        height: 48,
        child: Icon(
          icon,
          color: onTap == null
              ? Theme.of(context).disabledColor
              : Theme.of(context).focusColor,
        ),
      ),
    );
  }
}
