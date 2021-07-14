import 'package:haponk/data/tabs/entities/flex_tab.dart';

abstract class TabsRepository {
  Stream<List<FlexTab>> watch();
  Future<int> insert({
    required String label,
    required int order,
  });
  void dispose();
}
