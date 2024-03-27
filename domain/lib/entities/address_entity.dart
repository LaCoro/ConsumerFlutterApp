// @dart=2.9
import 'package:domain/entities/ciity_entity.dart';

/// Class that represents the generic info for an address
class AddressEntity {
  String address;
  CityEntity cityEntity;
  String additionalAddress;

  static AddressEntity fromJsonMap(Map<String, dynamic> json) {
    return AddressEntity()
      ..address = json['address']
      ..cityEntity = CityEntity.fromJsonMap(json['city_entity'])
      ..additionalAddress = json['additional_address'];
  }

  static Map<String, dynamic> toJsonObject(AddressEntity addressEntity) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = addressEntity.address;
    data['city_entity'] = CityEntity.toJsonObject(addressEntity.cityEntity);
    data['additional_address'] = addressEntity.additionalAddress;
    return data;
  }

  String getFullAddress() {
    final addressArray = [address, additionalAddress, cityEntity.name, cityEntity.stateCode]..removeWhere((element) => element == null || element.isEmpty);
    return addressArray.join(', ');
  }
}
