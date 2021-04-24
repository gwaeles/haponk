import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'tables/flex_cards.dart';
import 'tables/configs.dart';
import 'tables/states.dart';
import 'tables/flex_tabs.dart';

part 'database.g.dart';

@UseMoor(
  tables: [Configs, States, FlexTabs, FlexCards],
)
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        debugPrint("[MOOR] onCreate");
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        debugPrint("[MOOR] onUpgrade from: $from, to: $to");
        if (from == 1) {
          await m.addColumn(states, states.displayLabel);
          await m.addColumn(states, states.displayType);
          await m.createTable(flexTabs);
          await m.createTable(flexCards);

          // Update config
          String internalUrl;
          try {
            final String json =
                await rootBundle.loadString("assets/config/config.json");
            final defaultConfig = jsonDecode(json) as Map<String, dynamic>;
            internalUrl = defaultConfig.containsKey("internalUrl")
                ? defaultConfig["internalUrl"]
                : null;
          } catch (e) {
            debugPrint("[MOOR] No config file");
          }
          if (internalUrl != null) {
            Config config = await getConfig();
            if (config == null) {
              final Config newConfig = Config(
                id: 1,
                internalUrl: internalUrl,
                requiresApiPassword: null,
              );
              await insertConfig(newConfig);
            }
            else {
              final Config updatedConfig = config.copyWith(
                internalUrl: internalUrl,
              );
              await updateConfig(updatedConfig);
            }
          }

          // Tabs data
          for (int i = 1 ; i < 50 ; i++) {
            await insertFlexTab(FlexTabsCompanion.insert(
              label: "Flex Tab $i",
              order: i,
            ));
          }
        }
      },
      beforeOpen: (details) async {
        if (details.wasCreated) {
          // Initiale config
          String internalUrl;
          try {
            final String json =
                await rootBundle.loadString("assets/config/config.json");
            final defaultConfig = jsonDecode(json) as Map<String, dynamic>;
            internalUrl = defaultConfig.containsKey("internalUrl")
                ? defaultConfig["internalUrl"]
                : null;
          } catch (e) {
            debugPrint("[MOOR] No config file");
          }
          if (internalUrl != null) {
            final Config newConfig = Config(
              id: 1,
              internalUrl: internalUrl,
              requiresApiPassword: null,
            );
            await insertConfig(newConfig);
          }
        }
      },
    );
  }

  // CONFIG
  Future<Config> getConfig() =>
      (select(configs)..where((item) => item.id.equals(1))).getSingle();
  Stream<Config> watchConfig() =>
      (select(configs)..where((item) => item.id.equals(1))).watchSingle();

  Future insertConfig(Config config) =>
      into(configs).insert(config, mode: InsertMode.insertOrReplace);
  Future updateConfig(Config config) => update(configs).replace(config);
  Future updateConfigDate(String uuid) =>
      (update(configs)..where((item) => item.uuid.equals(uuid)))
          .write(ConfigsCompanion(lastConnection: Value(DateTime.now())));
  Future deleteConfig(Config config) => delete(configs).delete(config);

  // STATES
  Future<State> getState(String entityId) =>
      (select(states)..where((item) => item.entityId.equals(entityId)))
          .getSingle();
  Future insertState(StatesCompanion state) =>
      into(states).insert(state, mode: InsertMode.insertOrReplace);
  Future updateState(State state) => update(states).replace(state);

  Stream<List<State>> watchStates() => select(states).watch();

  Stream<List<FlexTab>> watchTabs() => select(flexTabs).watch();
  Future insertFlexTab(FlexTabsCompanion flexTab) =>
      into(flexTabs).insert(flexTab);
}
