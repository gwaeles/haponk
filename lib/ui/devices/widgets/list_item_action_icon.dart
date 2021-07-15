import 'package:flutter/material.dart';
import 'package:haponk/data/connection/providers/connection_notifier.dart';
import 'package:provider/provider.dart';

typedef GestureTapCallback = void Function(ConnectionNotifier provider);

class ListItemActionIcon extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback? onTap;

  const ListItemActionIcon({Key? key, required this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      onTap: onTap == null
          ? null
          : () => onTap!(context.read<ConnectionNotifier>()),
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
