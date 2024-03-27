import 'package:LaCoro/core/ui_utils/mappers/store_ui_mapper.dart';
import 'package:LaCoro/core/ui_utils/model/item_ui.dart';
import 'package:domain/entities/item_entity.dart';
import 'dart:developer' as developer;

class ItemUIMapper extends UIModelMapper<ItemUI, ItemEntity> {
  @override
  List<ItemUI> processList(List<ItemEntity> items) {
    List<ItemUI> itemsUI = List.empty();
    items.forEach((item) {
      itemsUI.add(processSingleElement(item));
    });
    return itemsUI;
  }

  @override
  ItemUI processSingleElement(ItemEntity item) {
    var itemUI = ItemUI.fromEntity(item);
    developer.log("$item");

    itemUI.name = item.name;
    itemUI.description = item.description;
    itemUI.price = item.price;
    itemUI.itemEntity = item;

    return itemUI;
  }
}