import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/core/hive/constants.dart';
import 'package:haponk/data/tabs/datasources/flex_tabs_hive_source.dart';
import 'package:haponk/domain/tabs/entities/flex_tab.dart';
import 'package:hive_flutter/hive_flutter.dart';

final flexTabsRepositoryProvider = Provider(FlexTabsRepository.new);

final tabListProvider = StateProvider.autoDispose<List<FlexTab>?>(
  (ref) {
    final AsyncValue<Box<FlexTabList>> asyncBox =
        ref.watch(flexTabListBoxProvider);
    StreamSubscription? _hiveSubscription;

    // On dispose
    ref.onDispose(
      () {
        // Closes the StreamController when the state of this provider is destroyed.
        _hiveSubscription?.cancel();
      },
    );

    return asyncBox.when(
      loading: () => null,
      error: (error, stack) => null,
      data: (Box<FlexTabList> box) {
        List<FlexTab>? currentValue = box.containsKey(flexTabListHiveKey)
            ? box.get(flexTabListHiveKey)?.items
            : null;

        // Hive subscription
        _hiveSubscription?.cancel();
        _hiveSubscription = box.watch(key: flexTabListHiveKey).listen(
              (BoxEvent event) =>
                  ref.controller.state = (event.value as FlexTabList?)?.items,
            );

        return currentValue;
      },
    );
  },
);

class FlexTabsRepository {
  // final FlexTabListBoxCallback flexTabListBox;
  final Ref ref;

  FlexTabsRepository(this.ref);

  // BehaviorSubject<List<FlexTab>>? _controller;
  // StreamSubscription? _hiveSubscription;

  // Stream<List<FlexTab>> watch() {
  //   if (_controller == null) {
  //     _controller = BehaviorSubject<List<FlexTab>>();
  //     _controller!.onCancel = () => _onControllerCancelled();
  //   }

  //   if (_hiveSubscription == null) {
  //     flexTabListBox().then(
  //       (box) {
  //         _hiveSubscription?.cancel();

  //         // Default list
  //         if (!box.containsKey(flexTabListHiveKey)) {
  //           box.put(
  //             flexTabListHiveKey,
  //             <FlexTab>[],
  //           );
  //         }

  //         _hiveSubscription = box.watch(key: flexTabListHiveKey).listen(
  //               _onBoxEvent,
  //             );
  //         if (_controller?.hasValue != true &&
  //             box.containsKey(flexTabListHiveKey)) {
  //           // Push current value on stream
  //           _onBoxEvent(
  //             BoxEvent(
  //               flexTabListHiveKey,
  //               box.get(flexTabListHiveKey),
  //               false,
  //             ),
  //           );
  //         }
  //       },
  //     );
  //   }

  //   return _controller!.stream;
  // }

  Future<void> insert({
    required String label,
  }) async {
    final List<FlexTab>? curentTabList = await ref.read(
      tabListProvider,
    );

    late final List<FlexTab> result;

    if (curentTabList == null) {
      result = [
        FlexTab(
          id: 0,
          label: label,
        ),
      ];
    } else {
      final int newId = curentTabList.isEmpty
          ? 0
          : (curentTabList
                      .map((tab) => tab.id)
                      .reduce((value, id) => max(value ?? 0, id ?? 0)) ??
                  0) +
              1;
      result = [
        ...curentTabList,
        FlexTab(
          id: newId,
          label: label,
        ),
      ];
      // ..sort(
      //     (a, b) => a.order.compareTo(b.order),
      //   );
    }

    final Box<FlexTabList> box = await ref.read(
      flexTabListBoxProvider.future,
    );

    box.put(
      flexTabListHiveKey,
      FlexTabList(items: result),
    );
  }

  Future<void> delete({
    required int id,
  }) async {
    final List<FlexTab>? curentTabList = await ref.read(
      tabListProvider,
    );

    if (curentTabList != null) {
      final List<FlexTab> result = curentTabList
          .where(
            (tab) => tab.id != id,
          )
          .toList();

      final Box<FlexTabList> box = await ref.read(
        flexTabListBoxProvider.future,
      );

      box.put(
        flexTabListHiveKey,
        FlexTabList(items: result),
      );
    }
  }

  Future<void> deleteByIndex({
    required int index,
  }) async {
    final List<FlexTab>? curentTabList = await ref.read(
      tabListProvider,
    );

    if (curentTabList != null) {
      final List<FlexTab> result = [...curentTabList]..removeAt(index);

      final Box<FlexTabList> box = await ref.read(
        flexTabListBoxProvider.future,
      );

      box.put(
        flexTabListHiveKey,
        FlexTabList(items: result),
      );
    }
  }

  Future<void> update({
    required FlexTab tab,
  }) async {
    final List<FlexTab>? curentTabList = await ref.read(
      tabListProvider,
    );

    if (curentTabList != null) {
      final List<FlexTab> result = curentTabList
          .map(
            (t) => tab.id == t.id ? tab : t,
          )
          .toList();

      final Box<FlexTabList> box = await ref.read(
        flexTabListBoxProvider.future,
      );

      box.put(
        flexTabListHiveKey,
        FlexTabList(items: result),
      );
    }
  }

  // void dispose() {
  //   debugPrint("[TABS] dispose");
  //   _controller?.close();
  //   _controller = null;
  //   _hiveSubscription?.cancel();
  //   _hiveSubscription = null;
  // }

  // void _onControllerCancelled() {
  //   if (_controller?.hasListener != true) {
  //     dispose();
  //   }
  // }

  // Future<void> _onBoxEvent(BoxEvent event) async {
  //   debugPrint("[TABS] _onBoxEvent, key: ${event.key} ");
  //   if (event.value is List<FlexTab>) {
  //     _controller?.sink.add(event.value);
  //   }
  // }
}
