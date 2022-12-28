import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';
import 'package:haponk/domain/connection/controllers/connection_controller.dart';
import 'package:haponk/domain/devices/entities/device.dart';
import 'package:haponk/ui/devices/widgets/device_list_item.dart';

class DeviceList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ComparableDevice>? devices = ref.watch(deviceListProvider);

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
              DeviceListItem.fromDevice(
                devices![index],
                (params) => ref.read(connectionControllerProvider).callService(
                      params,
                    ),
              ),
              if (index == (devices.length - 1)) SizedBox(height: 16),
            ],
          );
        },
        childCount: devices?.length ?? 0,
      ),
    );
  }
}
