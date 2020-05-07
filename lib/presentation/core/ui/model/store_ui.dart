import 'package:domain/entities/store_entity.dart';

class StoreUI {

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



  StoreUI(StoreEntity store){
     this.name = store.name;
     this.logo = store.logo;
     this.openAt = store.openAt;
     this.closeAt = store.closeAt;
  }
  
  
}