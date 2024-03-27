// @dart=2.9
import 'package:domain/entities/store_entity.dart';

class StoreUI {
  String id;
  bool isDeliveryFree = false;
  bool isStoreClosed = false;
  bool hasAPromo = false;
  String tag;

  String placeHolderAsset;
  String discountPercentage;

  String name;
  String openAt;
  String closeAt;
  bool active;
  String logo;
  int deliveryCost;
  StoreEntity storeEntity;

  StoreUI.fromEntity(StoreEntity store)
      : id = store.id,
        storeEntity = store,
        name = store.name,
        logo = store.logo,
        deliveryCost = store.deliveryCost,
        openAt = store.openAt,
        closeAt = store.closeAt;

  StoreUI(this.name, this.logo, this.openAt, this.closeAt);
}
