import 'package:flutter/material.dart';
import 'package:haponk/data/config/blocs/config_bloc.dart';
import 'package:haponk/data/config/states/config_state.dart';
import 'package:provider/provider.dart';

import 'config_providers.dart';
import 'widgets/url_text_field.dart';

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
            _FormWidget(),
          ],
        ),
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  String? typedUrl;
  String? typedToken;

  @override
  void initState() {
    super.initState();
    final configBloc = context.read<ConfigBloc>();

    typedUrl = configBloc.state.config?.internalUrl;
    typedToken = configBloc.state.config?.accessToken;
  }

  @override
  Widget build(BuildContext context) {
    final configBloc = context.watch<ConfigBloc>();

    if (typedUrl == null) {
      typedUrl = configBloc.state.config?.internalUrl;
    }
    if (typedToken == null) {
      typedToken = configBloc.state.config?.accessToken;
    }

    return Column(
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
          child: UrlTextField(
            label: 'Url',
            checked: configBloc.state is ConfigStateValidated,
            error: configBloc.state is ConfigStateError,
            value: typedUrl,
            onChanged: (value) {
              typedUrl = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 48),
          child: UrlTextField(
            label: 'Long lived access token',
            obscureText: true,
            value: typedToken,
            onChanged: (value) {
              typedToken = value;
            },
          ),
        ),
        (configBloc.state is ConfigStateValidated)
            ? ElevatedButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed(
                  "/supervisor",
                  arguments: configBloc.state.config,
                ),
                child: Text("Go home"),
              )
            : ElevatedButton(
                onPressed: () => context.read<ConfigBloc>().tryConnect(
                      url: typedUrl,
                      accessTocken: typedToken,
                    ),
                child: Text("Test connection"),
              ),
      ],
    );
  }
}
