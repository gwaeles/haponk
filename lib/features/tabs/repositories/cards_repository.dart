import 'package:haponk/features/tabs/entities/flex_card.dart';

abstract class CardsRepository {
  Stream<List<FlexCard>> watch();
  Future<int> insert({
    String type,
    int stateId,
    int parentId,
    int position,
    int horizontalFlex,
    int verticalFlex,
    int width,
    int height,
  });
  Future<bool> update(FlexCard item);
  Future<int> delete({int id});
  void dispose();
}
