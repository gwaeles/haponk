import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hapoc/features/config/entities/config_entity.dart';
import 'package:hapoc/features/config/providers/config_provider.dart';
import 'package:hapoc/features/connection/entities/message.dart';
import 'package:hapoc/features/connection/providers/connection_provider.dart';
import 'package:provider/provider.dart';
import 'package:hapoc/dependency_injection.dart';

class LauncherScreen extends StatelessWidget {
  final ConfigProvider configProvider = ConfigProvider(getIt());

  ///
  /// --- WIDGET --- ///
  ///

  @override
  Widget build(BuildContext context) {
    final connexionProvider = context.read<ConnectionProvider>();

    return MultiProvider(
      providers: [
        ListenableProvider.value(value: configProvider),
        StreamProvider<Message>(
            initialData: Message("Initiale"),
            create: (context) => connexionProvider.messageStream),
        StreamProvider<ConfigEntity>(
            initialData: null,
            create: (context) => configProvider.messageStream),
      ],
      child: LauncherPage(),
    );
  }
}

class LauncherPage extends StatelessWidget {
  ///
  /// --- WIDGET --- ///
  ///

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ConfigProvider>();
    final connexionProvider = context.read<ConnectionProvider>();

    return Scaffold(
      body: Container(
        color: Colors.grey.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MessageText(),
            StateText(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: UrlTextField(),
            ),
            Consumer<ConfigEntity>(builder: (context, config, _) {
              return Text(config?.externalUrl ?? "");
            }),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TokenTextField(),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () => connexionProvider.disconnect(),
                    child: Text("Disconnect")),
                TextButton(
                    onPressed: () => connexionProvider.subscribe(),
                    child: Text("Subscribe")),
                TextButton(
                    onPressed: () => connexionProvider.unsubscribe(),
                    child: Text("Unsubscribe")),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () => connexionProvider.getStates(),
                    child: Text("Get States")),
                TextButton(
                    onPressed: () => connexionProvider.getServices(),
                    child: Text("Get services")),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => provider.tryConnect(),
                    child: Text("Test")),
                Consumer<ConfigEntity>(builder: (context, config, _) {
                  return ElevatedButton(
                      onPressed: () => connexionProvider.connect(config),
                      child: Text("Connect"));
                }),
                ElevatedButton(
                    onPressed: () async {
                      String barcodeScanRes =
                          await FlutterBarcodeScanner.scanBarcode(
                              "#ff6666", "Cancel", true, ScanMode.BARCODE);
                      print(barcodeScanRes);
                    },
                    child: Text("FAB")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StateText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final message = context.watch<Message>();

    // Todo: Manage with ConnectionState
    if (message.text == "Authenticated") {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.of(context).pushReplacementNamed("/devices");
      });
    }

    return Text(message.text);
  }
}

class MessageText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConfigProvider>();

    return Text("${provider.state}");
  }
}

class UrlTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<ConfigProvider>();
    final config = context.watch<ConfigEntity>();

    // Init values
    provider.typedUrl = config?.internalUrl;
    provider.typedToken = config?.accessToken;

    return TextField(
      decoration: new InputDecoration(labelText: "Url"),
      controller: TextEditingController(text: config?.internalUrl),
      onChanged: (value) => provider.typedUrl = value,
    );
  }
}

class TokenTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<ConfigProvider>();
    final config = context.watch<ConfigEntity>();

    return TextField(
      decoration: new InputDecoration(
        labelText: "Long lived access token",
      ),
      obscureText: true,
      controller: TextEditingController(text: config?.accessToken),
      onChanged: (value) => provider.typedToken = value,
    );
  }
}
