import 'package:flutter/material.dart';

import 'config_providers.dart';
import 'widgets/token_text_field.dart';
import 'widgets/url_text_field.dart';
import 'widgets/valid_button.dart';

class ConfigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConfigProviders(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.headline3,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Type your Home Assistant Server url",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
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
