import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable(explicitToJson: true)
class Store {
  String name;
  List<int> searchTags;
  String address;
  String city;
  String country;
  String mobile;
  String openAt;
  String closeAt;
  List<int> daysOpen;
  String logo;
  bool hasDeliveryService;
  bool active;
  int deliveryCost;
  String state;
  int position;

  Store(
      {this.name,
      this.searchTags,
      this.address,
      this.city,
      this.country,
      this.mobile,
      this.openAt,
      this.closeAt,
      this.daysOpen,
//    this.location,
      this.logo,
      this.hasDeliveryService,
      this.active,
      this.deliveryCost,
      this.state,
      this.position});
}
