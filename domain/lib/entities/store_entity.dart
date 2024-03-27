import 'package:domain/entities/ciity_entity.dart';
import 'package:domain/entities/location.dart';

class StoreEntity {
  String? id;
  String? name;
  List<String>? searchTags;
  String? address;
  String? city;
  String? country;
  String? mobile;
  String? openAt;
  String? closeAt;
  String? logo;
  String? state;
  List<int>? daysOpen;
  bool? hasDeliveryService;
  bool? active;
  int? deliveryCost;
  int? position;
  Location? location;
  CityEntity? cityInfo;

  static StoreEntity fromJsonMap(Map<String, dynamic> json) {
    return StoreEntity()
      ..id = json['id']
      ..name = json['name']
      ..searchTags = json['searchTags']?.cast<String>()
      ..address = json['address']
      ..city = json['city']
      ..country = json['country']
      ..mobile = json['mobile']
      ..openAt = json['openAt']
      ..closeAt = json['closeAt']
      ..daysOpen = json['daysOpen']?.cast<int>()
      ..logo = json['logo']
      ..hasDeliveryService = json['hasDeliveryService']
      ..active = json['active']
      ..deliveryCost = json['deliveryCost']
      ..state = json['state']
      ..position = json['Position'];
  }

  static Map<String, dynamic> toJsonObject(StoreEntity storeEntity) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = storeEntity.id;
    data['name'] = storeEntity.name;
    data['searchTags'] = storeEntity.searchTags;
    data['address'] = storeEntity.address;
    data['city'] = storeEntity.city;
    data['country'] = storeEntity.country;
    data['mobile'] = storeEntity.mobile;
    data['openAt'] = storeEntity.openAt;
    data['closeAt'] = storeEntity.closeAt;
    data['daysOpen'] = storeEntity.daysOpen;
    data['logo'] = storeEntity.logo;
    data['hasDeliveryService'] = storeEntity.hasDeliveryService;
    data['active'] = storeEntity.active;
    data['deliveryCost'] = storeEntity.deliveryCost;
    data['state'] = storeEntity.state;
    data['Position'] = storeEntity.position;
    return data;
  }
}
