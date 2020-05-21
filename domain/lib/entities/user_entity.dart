

class UserEntity {
  String id;
  String username;
  String email;
  String fullname;
  String identification;
  String typeId;
  String mobile;
  String address;
  String city;
  String country;
  String phone;
  String birthday;
  String iMEI;

  static UserEntity fromJsonMap(Map<String, dynamic> json) {
    return UserEntity()
      ..id = json['id']
      ..username = json['username']
      ..email = json['email']
      ..fullname = json['fullname']
      ..identification = json['identification']
      ..typeId = json['type_id']
      ..mobile = json['mobile']
      ..address = json['address']
      ..city = json['city']
      ..country = json['country']
      ..phone = json['phone']
      ..birthday = json['birthday']
      ..iMEI = json['IMEI'];
  }

  static Map<String, dynamic> toJsonObject(UserEntity user) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = user.id;
    data['username'] = user.username;
    data['email'] = user.email;
    data['fullname'] = user.fullname;
    data['identification'] = user.identification;
    data['type_id'] = user.typeId;
    data['mobile'] = user.mobile;
    data['address'] = user.address;
    data['city'] = user.city;
    data['country'] = user.country;
    data['phone'] = user.phone;
    data['birthday'] = user.birthday;
    data['IMEI'] = user.iMEI;
    return data;
  }
}
