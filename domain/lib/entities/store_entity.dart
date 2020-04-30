import 'package:domain/entities/ciity_configuration.dart';
import 'package:domain/entities/item_entity.dart';
import 'package:domain/entities/location.dart';

abstract class StoreEntity {
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
  Future<List<ItemEntity>> items;
  Location location;
  CityConfiguration cityInfo;

  Future<Map<ItemEntity, List<ItemEntity>>> getSortedItems();
}
