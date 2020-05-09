import 'package:LaCoro/core/ui_utils/model/store_ui.dart';
import 'package:domain/entities/store_entity.dart';
import 'dart:developer' as developer;

abstract class UIModelMapper<T, J> {
  List<T> process(List<J> items);
}


class StoreUIMapper extends UIModelMapper<StoreUI, StoreEntity> {


  List<StoreUI> process(List<StoreEntity> stores) {
    List<StoreUI> storesUI = List();
    stores.forEach((store) {
      processSingleElement(store, storesUI);
    });
    return storesUI;
  }

  void processSingleElement(StoreEntity store, List<StoreUI> storesUI) {
    var storeUI = StoreUI.fromEntity(store);
    developer.log("$store");

    // var hasAPromo = false;
    storeUI.id = store.id;
    storeUI.deliveryCost = store.deliveryCost;
    storeUI.isDeliveryFree = store.deliveryCost == null || store.deliveryCost == 0 ? true : false;
    storeUI.isStoreClosed = store.state == "closed" || !isInOperatingHours(store.openAt, store.closeAt, store.daysOpen);
    storeUI.hasAPromo = false;


    var randomTag = "";
    if (store.searchTags.isNotEmpty) {
      store.searchTags.shuffle();
    }
    randomTag = store.searchTags.last.toString();
    storeUI.tag = randomTag.toUpperCase();

    storesUI.add(storeUI);
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

  if (hourNow >= hourOpenTime && minNow >= minOpenTime &&
      hourNow <= hourCloseTime && minNow <= minCloseTime
  ) {
    return true;
  }


  return false;
}