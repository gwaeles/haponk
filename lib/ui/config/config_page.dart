import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/config/blocs/config_bloc.dart';
import 'package:haponk/data/config/states/config_state.dart';
import 'package:haponk/ui/app/router/app_router.gr.dart';
import 'package:provider/provider.dart';

import 'config_providers.dart';
import 'widgets/url_text_field.dart';

class ConfigPage extends StatelessWidget {
  final int configId;

  const ConfigPage({
    super.key,
    required this.configId,
  });

  @override
  Widget build(BuildContext context) {
    return ConfigProviders(
      configId: configId,
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

class _FormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigBloc, ConfigState>(
      builder: (context, state) {
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
                checked: state.connexionStatus == ConnexionStatus.success,
                error: state.connexionStatus == ConnexionStatus.failure,
                value: state.data?.internalUrl,
                onChanged: (value) => context.read<ConfigBloc>().add(
                      ConfigUpdate(internalUrl: value),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 48),
              child: UrlTextField(
                label: 'Long lived access token',
                checked: state.connexionStatus == ConnexionStatus.success && state.data?.lastConnection != null,
                obscureText: true,
                value: state.data?.accessToken,
                onChanged: (value) => context.read<ConfigBloc>().add(
                      ConfigUpdate(accessTocken: value),
                    ),
              ),
            ),
            (state.connexionStatus == ConnexionStatus.success && state.data?.lastConnection != null)
                ? ElevatedButton(
                    onPressed: () => context.router.replace(
                      AppNavigationRoute(configId: state.data!.id),
                    ),
                    child: Text("Go home"),
                  )
                : ElevatedButton(
                    onPressed: () => context.read<ConfigBloc>().add(
                          ConfigTryConnect(),
                        ),
                    child: Text("Test connection"),
                  ),
          ],
        );
      },
    );
  }
}
