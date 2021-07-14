import 'package:haponk/data/tabs/entities/flex_card.dart';

abstract class CardsRepository {
  Stream<List<FlexCard>> watch();
  Future<int> insert({
    required String type,
    int? stateId,
    int? parentId,
    required int position,
    required int horizontalFlex,
    required int verticalFlex,
    required int width,
    required int height,
  });
  Future<bool> update(FlexCard item);
  Future<int> delete({required int id});
  void dispose();
}
