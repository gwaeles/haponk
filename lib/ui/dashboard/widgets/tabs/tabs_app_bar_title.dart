import 'package:flutter/material.dart';

class TabsAppBarTitle extends StatelessWidget {
  final VoidCallback? onPressed;

  const TabsAppBarTitle({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: Text('Smart board'),
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
