//@JsonSerializable(explicitToJson: true)
import 'package:domain/entities/store_entity.dart';

abstract class ItemEntity {
  String name;
  String description;
  int price;
  StoreEntity store;
  ItemEntity parent;
  int position;

//  StoreEntity(
//      {this.name,
//      this.searchTags,
//      this.address,
//      this.city,
//      this.country,
//      this.mobile,
//      this.openAt,
//      this.closeAt,
//      this.daysOpen,
////    this.location,
//      this.logo,
//      this.hasDeliveryService,
//      this.active,
//      this.deliveryCost,
//      this.state,
//      this.position});
}
