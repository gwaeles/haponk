import 'package:flutter/material.dart';
import 'package:haponk/features/devices/entities/device.dart';
import 'package:haponk/ui/devices/widgets/device_list_item.dart';
import 'package:provider/provider.dart';

class DevicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final devices = context.watch<List<Device>>();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              if (index == 0) SizedBox(height: 8),
              if (index != 0) Divider(
                height: 1,
                color: Colors.grey,
              ),
              DeviceListItem.fromDevice(devices[index]),
              if (index == (devices.length - 1)) SizedBox(height: 16),
            ],
          );
        },
        childCount: devices?.length ?? 0,
      ),
    );
  }
}
