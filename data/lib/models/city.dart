import 'package:domain/entities/ciity_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class City extends ParseObject with CityEntity implements ParseCloneable {
  City() : super(_keyTableName);

  City.clone() : this();

  @override
  clone(Map<String, dynamic> map) => City.clone()..fromJson(map);
  
  static const String _keyTableName = 'CityConfiguration';

  static const String keyCountryCode = 'country_code';
  static const String keyName = 'name';
  static const String keyCityCode = 'city_code';
  static const String keyStateCode = 'state_code';
  static const String keyDeliveryCost = 'delivery_cost';

  String? get id => this.objectId;

  String? get name => get<String>(keyName);

  String? get countryCode => get<String>(keyCountryCode);

  String? get cityCode => get<String>(keyCityCode);

  String? get stateCode => get<String>(keyStateCode);

  int? get deliveryCost => get<int>(keyDeliveryCost);
}
