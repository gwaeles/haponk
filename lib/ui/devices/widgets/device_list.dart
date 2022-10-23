import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haponk/data/devices/blocs/devices_bloc.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/devices/states/devices_state.dart';
import 'package:haponk/ui/devices/widgets/device_list_item.dart';

class DeviceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicesBloc, DevicesState>(
      builder: (context, state) {
        final List<ComparableDevice> devices =
            state is DevicesLoaded ? state.devices : [];

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  if (index == 0) SizedBox(height: 8),
                  if (index != 0)
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  DeviceListItem.fromDevice(devices[index]),
                  if (index == (devices.length - 1)) SizedBox(height: 16),
                ],
              );
            },
            childCount: devices.length,
          ),
        );
      },
    );
  }
}
