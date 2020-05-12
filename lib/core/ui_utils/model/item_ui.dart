import 'package:domain/entities/item_entity.dart';
import 'package:domain/entities/store_entity.dart';

class ItemUI {

  int id;
  String name;
  String description;
  int price;
  String image;
  Future<StoreEntity> store;

  ItemUI.fromEntity(ItemEntity item): name = item.name,
        description = item.description,
        price = item.price,
        store = item.store;

  ItemUI(
      this.name,
      this.description,
      this.price,
      this.store
      );
}