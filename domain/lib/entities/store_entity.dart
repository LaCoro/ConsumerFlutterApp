import 'package:json_annotation/json_annotation.dart';

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
}
