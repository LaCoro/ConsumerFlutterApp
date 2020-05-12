
import 'package:LaCoro/core/ui_utils/mappers/store_ui_mapper.dart';
import 'package:LaCoro/core/ui_utils/model/item_ui.dart';
import 'package:domain/entities/item_entity.dart';
import 'dart:developer' as developer;

class ItemUIMapper extends UIModelMapper<ItemUI, ItemEntity> {

  @override
  List<ItemUI> process(List<ItemEntity> items) {
    List<ItemUI> itemsUI = List();
    items.forEach((store) {
      processSingleElement(store, itemsUI);
    });
    return itemsUI;
  }

  void processSingleElement(ItemEntity item, List<ItemUI> itemsUI) {
    var itemUI = ItemUI.fromEntity(item);
    developer.log("$item");

    itemUI.name = item.name;
    itemUI.description = item.description;
    itemUI.price = item.price;
    itemUI.store = item.store;

  }

}