import 'package:domain/entities/item_entity.dart';

class ItemUI {
  int id;
  String name;
  String description;
  int price;
  String image;
  ItemEntity item;

  ItemUI.fromEntity(ItemEntity item)
      : name = item.name,
        description = item.description,
        price = item.price,
        item = item;
}
