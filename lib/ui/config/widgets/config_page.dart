import 'package:flutter/material.dart';

import 'url_text_field.dart';
import 'token_text_field.dart';
import 'valid_button.dart';

class ConfigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome", style: Theme.of(context).textTheme.headline3),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Type your Home Assistant Server url",
                    style: Theme.of(context).textTheme.subtitle1),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                  child: UrlTextField(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 48),
                  child: TokenTextField(),
                ),
                ValidButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
