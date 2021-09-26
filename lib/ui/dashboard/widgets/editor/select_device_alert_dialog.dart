import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/core/themes/app_theme.dart';
import 'package:haponk/data/devices/blocs/device_types_bloc.dart';
import 'package:haponk/data/devices/blocs/devices_bloc.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';
import 'package:haponk/data/devices/states/device_types_state.dart';
import 'package:haponk/data/devices/states/devices_state.dart';
import 'package:haponk/ui/dashboard/providers/device_selection_notifier.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SelectDeviceAlertDialog extends StatelessWidget {
  final int maxItem;

  const SelectDeviceAlertDialog({Key? key, this.maxItem = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => DevicesRepository(
            db: context.read(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ValueNotifier<int>(0),
        ),
        ChangeNotifierProvider(
          create: (context) => DeviceSelectionNotifier(maxItem),
        ),
        BlocProvider(
          create: (context) => DevicesBloc(
            repository: context.read(),
            fetchAllDevicesAllowed: false,
          ),
        ),
        BlocProvider(
          create: (context) => DeviceTypesBloc(
            repository: context.read(),
          ),
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

class _DeviceTypeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);

    return Center(
      heightFactor: 1,
      child: SingleChildScrollView(
        child: BlocBuilder<DeviceTypesBloc, DeviceTypesState>(
            builder: (context, state) {
          final List<DeviceType> types =
              state is DeviceTypesLoaded ? state.types : [];
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
                      context.read<DevicesBloc>().selectedType = deviceType;
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
        child: BlocBuilder<DevicesBloc, DevicesState>(
          builder: (context, state) {
            final List<Device> devices =
                state is DevicesLoaded ? state.devices : [];
            final children = <Widget>[];

            if (devices.length == 0) {
              children.add(CircularProgressIndicator());
            } else {
              for (Device device in devices) {
                children.add(
                  Container(
                    color: Colors.white12,
                    height: 48,
                    child: InkWell(
                      onTap: () => context
                          .read<DeviceSelectionNotifier>()
                          .toggle(device.id),
                      child: Consumer<DeviceSelectionNotifier>(
                        builder: (context, selection, child) {
                          return Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16),
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

            return Column(
              children: children,
            );
          },
        ),
      ),
    );
  }
}
