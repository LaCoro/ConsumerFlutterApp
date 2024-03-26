// @dart=2.9
import 'package:domain/entities/address_entity.dart';

class UserEntity {
  String id;
  String sessionToken;
  String email;
  String fullname;
  String identification;
  String address;
  String city;
  String country;
  String mobile;
  String birthday;
  String iMEI;
  bool isValidated;
  AddressEntity addressEntity;

  static UserEntity fromJsonMap(Map<String, dynamic> json) {
    return UserEntity()
      ..id = json['id']
      ..sessionToken = json['sessionToken']
      ..email = json['email']
      ..fullname = json['fullname']
      ..identification = json['identification']
      ..address = json['address']
      ..addressEntity = json['addressEntity'] != null ? AddressEntity.fromJsonMap(json['addressEntity']) : null
      ..city = json['city']
      ..country = json['country']
      ..mobile = json['mobile']
      ..birthday = json['birthday']
      ..iMEI = json['IMEI']
      ..isValidated = json['is_validated'];
  }

  static Map<String, dynamic> toJsonObject(UserEntity user) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = user.id;
    data['sessionToken'] = user.sessionToken;
    data['email'] = user.email;
    data['fullname'] = user.fullname;
    data['identification'] = user.identification;
    data['address'] = user.address;
    if (user.addressEntity != null) {
      data['addressEntity'] = AddressEntity.toJsonObject(user.addressEntity);
    }
    data['city'] = user.city;
    data['country'] = user.country;
    data['mobile'] = user.mobile;
    data['birthday'] = user.birthday;
    data['IMEI'] = user.iMEI;
    data['is_validated'] = user.isValidated;
    return data;
  }
}
