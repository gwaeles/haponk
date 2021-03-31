import 'package:flutter/material.dart';
import 'package:hapoc/features/devices/entities/device.dart';
import 'package:provider/provider.dart';

class DevicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final devices = context.watch<List<Device>>();

    return ListView.separated(
        itemBuilder: (_, index) => DevicesItem(device: devices[index]),
        separatorBuilder: (_, index) => Divider(
              color: Colors.grey,
            ),
        itemCount: devices?.length ?? 0);
  }
}

class DevicesItem extends StatelessWidget {
  final Device device;

  const DevicesItem({Key key, this.device}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(device.friendlyName),
      subtitle: Text("${device.entityId}\n${device.state}"),
      isThreeLine: true,
      onTap: () => Navigator.of(context).pushReplacementNamed("/devices"),
    );
  }
}
