import 'package:domain/entities/store_entity.dart';

class StoreUI {
  String id;
  bool isDeliveryFree = false;
  bool isStoreClosed = false;
  bool hasAPromo = false;
  String tag;

  String placeHolderAsset;
  String discountPercentage;
  int deliveryCost;

  String name;
  String openAt;
  String closeAt;
  bool active;
  String logo;
  StoreEntity store;

  StoreUI.fromEntity(StoreEntity store)
      : store = store,
        name = store.name,
        logo = store.logo,
        openAt = store.openAt,
        closeAt = store.closeAt;

  StoreUI(this.name, this.logo, this.openAt, this.closeAt);
}
