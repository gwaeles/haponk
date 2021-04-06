import 'package:flutter/material.dart';
import 'package:hapoc/features/connection/providers/connection_provider.dart';
import 'package:provider/provider.dart';

typedef GestureTapCallback = void Function(ConnectionProvider provider);

class ListItemActionIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final GestureTapCallback onTap;

  const ListItemActionIcon(
      {Key key, this.icon, this.color = Colors.black54, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      onTap: onTap == null
          ? null
          : () => onTap(context.read<ConnectionProvider>()),
      child: Ink(
        width: 48,
        height: 48,
        child: Icon(
          icon,
          color: onTap == null ? Colors.black26 : color,
        ),
      ),
    );
  }
}
