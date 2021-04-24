import 'package:haponk/features/tabs/entities/flex_tab.dart';

abstract class TabsRepository {
  Stream<List<FlexTab>> watch();
  Future<int> insert({
    String label,
    int order,
  });
  void dispose();
}
