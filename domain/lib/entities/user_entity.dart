import 'package:domain/entities/store_entity.dart';

abstract class UserEntity {
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
  StoreEntity managedStore;
}
