import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:haponk/core/db/database.dart';
import 'package:haponk/core/hass/models/constants.dart';
import 'package:haponk/data/devices/blocs/device_bloc.dart';
import 'package:haponk/data/devices/entities/device.dart';
import 'package:haponk/data/devices/repositories/devices_repository.dart';
import 'package:haponk/data/devices/states/device_state.dart';
import 'package:moor/ffi.dart';
import 'package:moor_flutter/moor_flutter.dart';

void main() {
  late DevicesRepository devicesRepository;
  late Device device;
  late Database db;
  late DeviceBloc bloc;
  final entityId = 'light.room';

  setUp(() async {
    // Mocks
    db = Database(VmDatabase.memory());
    devicesRepository = DevicesRepository(
      db: db,
    );

    final StatesCompanion newState = StatesCompanion(
      entityId: Value<String>(entityId),
    );

    final deviceId = await db.insertState(newState);
    device = Device(
      id: deviceId,
      entityId: entityId,
      deviceType: DeviceType.LIGHT,
    );

    bloc = DeviceBloc(
      repository: devicesRepository,
      deviceId: deviceId,
    );
  });

  tearDown(() async {
    bloc.close();
    await db.close();
  });

  blocTest<DeviceBloc, DeviceState>(
    'should initial state be DeviceState.idle',
    build: () => bloc,
    verify: (DeviceBloc cubit) {
      expect(cubit.state, DeviceState.idle());
    },
  );

  blocTest<DeviceBloc, DeviceState>(
    'should emit [HomeState.loading, HomeState.errorPostProduct] when product is get unsuccessfully',
    build: () => bloc,
    act: (bloc) => bloc.init(),
    expect: () => [
      DeviceState.loaded(
        device: device,
      ),
    ],
  );

  test('stream emits a new user when the name updates', () async {
    bloc.init();

    await expectLater(
      bloc.stream,
      emitsInOrder(
        <DeviceState>[
          DeviceState.loaded(
            device: device,
          ),
        ],
      ),
    );
  });
}
