class UserEntity {
  String id;
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

  static UserEntity fromJsonMap(Map<String, dynamic> json) {
    return UserEntity()
      ..id = json['id']
      ..email = json['email']
      ..fullname = json['fullname']
      ..identification = json['identification']
      ..address = json['address']
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
    data['email'] = user.email;
    data['fullname'] = user.fullname;
    data['identification'] = user.identification;
    data['address'] = user.address;
    data['city'] = user.city;
    data['country'] = user.country;
    data['mobile'] = user.mobile;
    data['birthday'] = user.birthday;
    data['IMEI'] = user.iMEI;
    data['is_validated'] = user.isValidated;
    return data;
  }
}