import 'package:domain/entities/ciity_entity.dart';
import 'package:domain/entities/item_entity.dart';
import 'package:domain/entities/location.dart';

abstract class StoreEntity {
  String id;
  String name;
  List<String> searchTags;
  String address;
  String city;
  String country;
  String mobile;
  String openAt;
  String closeAt;
  String logo;
  String state;
  List<int> daysOpen;
  bool hasDeliveryService;
  bool active;
  int deliveryCost;
  int position;
  Location location;
  CityEntity cityInfo;
  Future<List<ItemEntity>> items;
//  Future<Map<ItemEntity, List<ItemEntity>>> getSortedItems();
}
