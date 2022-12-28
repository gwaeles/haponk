import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haponk/data/tabs/repositories/flex_tabs_repository.dart';
import 'package:haponk/domain/config/states/config_state.dart';
import 'package:haponk/domain/tabs/entities/flex_tab.dart';
import 'package:haponk/domain/tabs/states/flex_tabs_state.dart';

final flexTabsStateProvider = StateProvider.autoDispose<FlexTabsState>(
  (ref) {
    final List<FlexTab>? tabList = ref.watch(tabListProvider);

    return FlexTabsState(
      status: Status.loaded,
      data: tabList,
    );
  },
);

final flexTabsControllerProvider = Provider.autoDispose<TabsController>(
  TabsController.new,
);

class TabsController {
  final Ref ref;

  TabsController(this.ref);

  Future<void> createItem({
    required String label,
  }) async {
    final FlexTabsRepository repository = await ref.read(
      flexTabsRepositoryProvider,
    );
    repository.insert(
      label: label,
    );
  }

  Future<void> deleteItemByIndex(int index) async {
    // Fetch current list value
    final List<FlexTab>? data = (await ref.read(
      tabListProvider.notifier,
    ))
        .state;

    // Remove the item
    if (data != null && index >= 0 && index < data.length) {
      int tabId = data.elementAt(index).id ?? 0;

      final FlexTabsRepository repository = await ref.read(
        flexTabsRepositoryProvider,
      );
      repository.delete(id: tabId);
    }
  }

  Future<void> updateItemByIndex({
    required String label,
    required int index,
  }) async {
    // Fetch current list value
    final List<FlexTab>? data = (await ref.read(
      tabListProvider.notifier,
    ))
        .state;

    // Update the item
    if (data != null && index >= 0 && index < data.length) {
      final FlexTab tab = data.elementAt(index);

      final FlexTabsRepository repository = await ref.read(
        flexTabsRepositoryProvider,
      );
      repository.update(
        tab: tab.copyWith(
          label: label,
        ),
      );
    }
  }
}
