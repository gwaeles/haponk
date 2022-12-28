// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:haponk/data/connection/models/constants.dart';
// import 'package:haponk/domain/devices/entities/device.dart';
// import 'package:haponk/data/devices/repositories/devices_repository.dart';
// import 'package:haponk/domain/devices/states/devices_state.dart';

// final devicesBlocProvider = Provider.autoDispose.family<DevicesBloc, bool>(
//   (
//     ref,
//     fetchAllDevicesAllowed,
//   ) =>
//       DevicesBloc(
//     ref,
//     fetchAllDevicesAllowed,
//   ),
// );

// class DevicesBloc extends Cubit<DevicesState> {
//   //final DevicesRepository repository;
//   // If fetchAllDevicesAllowed is false you have to set a _selectedType or a
//   // _searchText to fetch devices
//   final bool fetchAllDevicesAllowed;
//   final Ref ref;

//   DevicesBloc(
//     this.ref,
//     this.fetchAllDevicesAllowed,
//   ) : super(DevicesState.idle()) {
//     _init();
//   }

//   List<ComparableDevice> _data = [];
//   RemoveListener? _subscription;
//   String? _searchText;
//   DeviceType? _selectedType;

//   DeviceType? get selectedType => _selectedType;
//   set selectedType(DeviceType? value) {
//     _selectedType = value;
//     if (state is DevicesLoaded) {
//       _onFilterData();
//     }
//   }

//   ///
//   /// --- SUBSCRIBTION --- ///
//   ///

//   void _init() {
//     // Repo stream subscription
//     final StateController<List<ComparableDevice>?> notifier = ref.read(
//       deviceListProvider.notifier,
//     );
//     _subscription?.call();
//     _subscription = notifier.addListener(_onData);
//   }

//   @override
//   Future<void> close() {
//     _subscription?.call();
//     _subscription = null;
//     return super.close();
//   }

//   void _onData(List<ComparableDevice>? data) {
//     if (data != null) {
//       _data = data;
//       _onFilterData();
//     }
//   }

//   ///
//   /// --- FILTERING --- ///
//   ///

//   void search(String value) {
//     _searchText = value;
//     final request = value;
//     Future.delayed(const Duration(milliseconds: 300)).then((value) {
//       if (request == _searchText && state is DevicesLoaded) {
//         _onFilterData();
//       }
//     });
//   }

//   void _onFilterData() {
//     final result = _data
//         .where((element) =>
//             (_selectedType == null ||
//                 _selectedType == null && fetchAllDevicesAllowed) ||
//             (_selectedType != null && element.deviceType == _selectedType))
//         .where((element) =>
//             (_searchText?.isNotEmpty != true && fetchAllDevicesAllowed) ||
//             (_searchText?.isNotEmpty != true && _selectedType != null) ||
//             (_searchText?.isNotEmpty == true &&
//                 element.friendlyName?.contains(_searchText!) == true))
//         .toList();

//     emit(
//       DevicesState.loaded(
//         devices: result,
//       ),
//     );
//   }
// }
