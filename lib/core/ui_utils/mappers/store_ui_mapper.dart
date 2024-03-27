import 'dart:developer' as developer;

import 'package:LaCoro/core/ui_utils/model/store_ui.dart';
import 'package:domain/entities/store_entity.dart';

abstract class UIModelMapper<T, J> {
  List<T> processList(List<J> items);

  T processSingleElement(J item);
}

class StoreUIMapper extends UIModelMapper<StoreUI, StoreEntity> {
  @override
  List<StoreUI> processList(List<StoreEntity> items) {
    List<StoreUI> storesUI = List.empty();
    items.forEach((store) {
      storesUI.add(processSingleElement(store));
    });
    return storesUI;
  }

  @override
  StoreUI processSingleElement(StoreEntity item) {
    var storeUI = StoreUI.fromEntity(item);
    developer.log("$item");

    // var hasAPromo = false;
    storeUI.id = item.id;
    storeUI.deliveryCost = item.deliveryCost;
    storeUI.isDeliveryFree = item.deliveryCost == null || item.deliveryCost == 0 ? true : false;
    storeUI.isStoreClosed = item.state == "closed" || !isInOperatingHours(item.openAt, item.closeAt, item.daysOpen);
    storeUI.hasAPromo = false;

    var randomTag = "";
    if (item.searchTags.isNotEmpty) {
      item.searchTags.shuffle();
    }
    randomTag = item.searchTags.last.toString();
    storeUI.tag = randomTag;

    return storeUI;
  }
}

bool isInOperatingHours(String openAt, String closeAt, List<int> daysOpen) {
  var now = DateTime.now();
  var hourNow = now.hour;
  var minNow = now.minute;
  var openTime = openAt.split(":");
  var closeTime = closeAt.split(":");

  var hourOpenTime = int.parse(openTime[0]);
  var minOpenTime = int.parse(openTime[1]);

  var hourCloseTime = int.parse(closeTime[0]);
  var minCloseTime = int.parse(closeTime[1]);

  if (hourNow >= hourOpenTime && minNow >= minOpenTime && hourNow <= hourCloseTime && minNow <= minCloseTime) {
    return true;
  }

  return false;
}
