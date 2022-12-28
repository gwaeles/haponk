import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/data/connection/models/constants.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/domain/devices/entities/device.dart';
import 'package:haponk/domain/devices/states/device_types_state.dart';
import 'package:haponk/domain/devices/states/devices_state.dart';
import 'package:haponk/ui/dashboard/providers/device_selection_notifier.dart';
import 'package:provider/provider.dart' as provider;
import 'package:easy_localization/easy_localization.dart';

class SelectDeviceAlertDialog extends ConsumerWidget {
  final int maxItem;

  const SelectDeviceAlertDialog({Key? key, this.maxItem = 0}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider(
          create: (context) => ValueNotifier<int>(0),
        ),
        provider.ChangeNotifierProvider(
          create: (context) => DeviceSelectionNotifier(maxItem),
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
      contentPadding: const EdgeInsets.fromLTRB(0, 20.0, 0, 24.0),
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
          child: Text('common_cancel'.tr()),
        ),
        TextButton(
          onPressed: _index.value == 0
              ? null
              : () => Navigator.of(context)
                  .pop(context.read<DeviceSelectionNotifier>().ids),
          child: Text('common_validate'.tr()),
        ),
      ],
    );
  }
}

class _DeviceTypeListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    final DeviceTypesState deviceTypesState =
        ref.watch(deviceTypesStateProvider);

    final List<DeviceType> types =
        deviceTypesState is DeviceTypesLoaded ? deviceTypesState.types : [];
    final children = <Widget>[];

    if (types.length == 0) {
      children.add(CircularProgressIndicator());
    } else {
      for (DeviceType deviceType in types) {
        children.add(
          Container(
            color: Colors.white12,
            width: 115,
            height: 80,
            child: InkWell(
              onTap: () {
                ref.read(deviceTypeProvider.notifier).state = deviceType;
                context.read<ValueNotifier<int>>().value = 1;
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    appTheme.assetNameOf(deviceType),
                    width: 48,
                    height: 48,
                  ),
                  Text(
                    deviceType.label(),
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  )
                ],
              ),
            ),
          ),
        );
      }
    }
    ;

    return Center(
      heightFactor: 1,
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          alignment: WrapAlignment.center,
          children: children,
        ),
      ),
    );
  }
}

class _DeviceListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DevicesState state = ref.watch(devicesStateProvider);

    final List<ComparableDevice> devices =
        state is DevicesLoaded ? state.devices : [];
    final children = <Widget>[];

    if (devices.length == 0) {
      children.add(CircularProgressIndicator());
    } else {
      for (ComparableDevice device in devices) {
        children.add(
          Container(
            color: Colors.white12,
            height: 48,
            child: InkWell(
              onTap: () =>
                  context.read<DeviceSelectionNotifier>().toggle(device.id),
              child: provider.Consumer<DeviceSelectionNotifier>(
                builder: (context, selection, child) {
                  return Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16),
                          child: Text(device.friendlyName ?? ''),
                        ),
                      ),
                      if (selection.ids.contains(device.id))
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(Icons.check),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
        children.add(
          Container(
            height: 2,
          ),
        );
      }
    }

    return Center(
      heightFactor: 1,
      child: SingleChildScrollView(
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
