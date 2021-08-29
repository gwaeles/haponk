import 'package:flutter/material.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/devices/providers/device_types_provider.dart';
import 'package:haponk/data/devices/providers/devices_provider.dart';
import 'package:haponk/dependency_injection.dart';
import 'package:provider/provider.dart';

class SelectDeviceAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ValueNotifier<int>(0),
        ),
        Provider(
          create: (_) => DeviceTypesProvider(getIt()),
        ),
        Provider(
          create: (_) => DevicesProvider(
            repository: getIt(),
            fetchAllDevicesAllowed: false,
          ),
        ),
        StreamProvider<List<DeviceType>?>(
          initialData: null,
          create: (context) =>
              context.read<DeviceTypesProvider>().deviceTypeStream,
        ),
        StreamProvider<List<Device>?>(
          initialData: null,
          create: (context) => context.read<DevicesProvider>().deviceStream,
        ),
      ],
      child: _IndexedAlertDialog(),
    );
  }
}

class _IndexedAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _index = context.watch<ValueNotifier<int>>();

    return AlertDialog(
      title: Text(_index.value == 1 ? 'Devices' : 'Device categories'),
      content: IndexedStack(
        index: _index.value,
        children: [
          _DeviceTypeListView(),
          _DeviceListView(),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
      ],
    );
  }
}

class _DeviceTypeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: SingleChildScrollView(
        child: Consumer<List<DeviceType>?>(builder: (context, value, child) {
          final children = <Widget>[];

          if (value == null || value.length == 0) {
            children.add(CircularProgressIndicator());
          } else {
            for (DeviceType deviceType in value) {
              children.add(
                Container(
                  color: Colors.white12,
                  width: 115,
                  height: 80,
                  child: InkWell(
                    onTap: () {
                      context.read<DevicesProvider>().selectedType = deviceType;
                      context.read<ValueNotifier<int>>().value = 1;
                    },
                    child: Center(
                      child: Text(
                        deviceType.toShortString(),
                      ),
                    ),
                  ),
                ),
              );
            }
          }

          return Wrap(
            spacing: 5,
            runSpacing: 5,
            alignment: WrapAlignment.center,
            children: children,
          );
        }),
      ),
    );
  }
}

class _DeviceListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: SingleChildScrollView(
        child: Consumer<List<Device>?>(builder: (context, value, child) {
          final children = <Widget>[];

          if (value == null || value.length == 0) {
            children.add(CircularProgressIndicator());
          } else {
            for (Device device in value) {
              children.add(
                Container(
                  color: Colors.white12,
                  width: 115,
                  height: 80,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(device.id),
                    child: Center(
                      child: Text(device.friendlyName ?? ''),
                    ),
                  ),
                ),
              );
            }
          }

          return Wrap(
            spacing: 5,
            runSpacing: 5,
            alignment: WrapAlignment.center,
            children: children,
          );
        }),
      ),
    );
  }
}
