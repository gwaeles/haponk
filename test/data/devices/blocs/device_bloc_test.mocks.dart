// Mocks generated by Mockito 5.0.15 from annotations
// in haponk/test/data/devices/blocs/device_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:haponk/core/db/database.dart' as _i2;
import 'package:haponk/core/hass/models/constants.dart' as _i6;
import 'package:haponk/data/devices/entities/device.dart' as _i5;
import 'package:haponk/data/devices/repositories/devices_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeDatabase_0 extends _i1.Fake implements _i2.Database {}

/// A class which mocks [DevicesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockDevicesRepository extends _i1.Mock implements _i3.DevicesRepository {
  MockDevicesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Database get db => (super.noSuchMethod(Invocation.getter(#db),
      returnValue: _FakeDatabase_0()) as _i2.Database);
  @override
  _i4.Stream<List<_i5.Device>> watchDevices() =>
      (super.noSuchMethod(Invocation.method(#watchDevices, []),
              returnValue: Stream<List<_i5.Device>>.empty())
          as _i4.Stream<List<_i5.Device>>);
  @override
  _i4.Stream<List<_i6.DeviceType>> watchDeviceTypes() =>
      (super.noSuchMethod(Invocation.method(#watchDeviceTypes, []),
              returnValue: Stream<List<_i6.DeviceType>>.empty())
          as _i4.Stream<List<_i6.DeviceType>>);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
