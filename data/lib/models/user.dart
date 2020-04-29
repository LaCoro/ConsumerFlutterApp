import 'package:domain/entities/store_entity.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class User extends ParseObject with UserEntity implements ParseCloneable {
  User() : super(_keyTableName);

  User.clone() : this();

  @override
  clone(Map map) => User.clone()..fromJson(map);

  static const String _keyTableName = 'User';

  static const String keyUsername = 'username';
  static const String keyEmail = 'email';
  static const String keyFullname = 'fullname';
  static const String keyIdentification = 'identification';
  static const String keyTypeId = 'typeId';
  static const String keyMobile = 'mobile';
  static const String keyAddress = 'address';
  static const String keyCity = 'city';
  static const String keyCountry = 'country';
  static const String keyPhone = 'phone';
  static const String keyBirthday = 'birthday';
  static const String keyIMEI = 'iMEI';
  static const String keyManagedStore = 'managedStore';

  String get username => get<String>(keyUsername);

  set username(String username) => set<String>(keyUsername, username);

  String get email => get<String>(keyEmail);

  set email(String email) => set<String>(keyEmail, email);

  String get fullname => get<String>(keyFullname);

  set fullname(String fullname) => set<String>(keyFullname, fullname);

  String get identification => get<String>(keyIdentification);

  set identification(String identification) => set<String>(keyIdentification, identification);

  String get typeId => get<String>(keyTypeId);

  set typeId(String typeId) => set<String>(keyTypeId, typeId);

  String get mobile => get<String>(keyMobile);

  set mobile(String mobile) => set<String>(keyMobile, mobile);

  String get address => get<String>(keyAddress);

  set address(String address) => set<String>(keyAddress, address);

  String get city => get<String>(keyCity);

  set city(String city) => set<String>(keyCity, city);

  String get country => get<String>(keyCountry);

  set country(String country) => set<String>(keyCountry, country);

  String get phone => get<String>(keyPhone);

  set phone(String phone) => set<String>(keyPhone, phone);

  String get birthday => get<String>(keyBirthday);

  set birthday(String birthday) => set<String>(keyBirthday, birthday);

  String get iMEI => get<String>(keyIMEI);

  set iMEI(String iMEI) => set<String>(keyIMEI, iMEI);

  StoreEntity get managedStore => get<StoreEntity>(keyManagedStore);

  set managedStore(StoreEntity managedStore) => set<StoreEntity>(keyManagedStore, managedStore);




}