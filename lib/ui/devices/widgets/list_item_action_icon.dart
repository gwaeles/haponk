import 'package:flutter/material.dart';
import 'package:haponk/features/connection/providers/connection_provider.dart';
import 'package:provider/provider.dart';

typedef GestureTapCallback = void Function(ConnectionProvider provider);

class ListItemActionIcon extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback? onTap;

  const ListItemActionIcon({Key? key, required this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      onTap: onTap == null
          ? null
          : () => onTap!(context.read<ConnectionProvider>()),
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
