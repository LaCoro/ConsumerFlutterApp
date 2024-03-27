/// Class that represents the generic info for a city
class CityEntity {
  String? id;
  String? name;
  String? countryCode;
  String? cityCode;
  String? stateCode;
  int? deliveryCost;

  static CityEntity fromJsonMap(Map<String, dynamic> json) {
    return CityEntity()
      ..id = json['id']
      ..countryCode = json['country_code']
      ..name = json['name']
      ..cityCode = json['city_code']
      ..stateCode = json['state_code']
      ..deliveryCost = json['delivery_cost'];
  }

  static Map<String, dynamic> toJsonObject(CityEntity cityEntity) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = cityEntity.id;
    data['country_code'] = cityEntity.countryCode;
    data['name'] = cityEntity.name;
    data['city_code'] = cityEntity.cityCode;
    data['state_code'] = cityEntity.stateCode;
    data['delivery_cost'] = cityEntity.deliveryCost;
    return data;
  }
}
