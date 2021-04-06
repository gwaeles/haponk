import 'package:flutter/material.dart';
import 'package:hapoc/features/devices/entities/device.dart';
import 'package:hapoc/ui/devices/widgets/device_list_item.dart';
import 'package:provider/provider.dart';

class DevicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final devices = context.watch<List<Device>>();

    return ListView.separated(
        padding: EdgeInsets.only(top: 8, bottom: 16),
        itemBuilder: (_, index) => DeviceListItem.fromDevice(devices[index]),
        separatorBuilder: (_, index) => Divider(
              height: 1,
              color: Colors.grey,
            ),
        itemCount: devices?.length ?? 0);
  }
}
