import 'package:data/models/item.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Store extends ParseObject with StoreEntity implements ParseCloneable {
  Store() : super(_keyTableName);

  Store.clone() : this();

  @override
  clone(Map map) => Store.clone()..fromJson(map);

  static const String _keyTableName = 'Store';

  static const String keyName = 'name';
  static const String keySearchTags = 'searchTags';
  static const String keyAddress = 'address';
  static const String keyCity = 'city';
  static const String keyCountry = 'country';
  static const String keyMobile = 'mobile';
  static const String keyOpenAt = 'openAt';
  static const String keyCloseAt = 'closeAt';
  static const String keyLogo = 'logo';
  static const String keyState = 'state';
  static const String keyDaysOpen = 'daysOpen';
  static const String keyHasDeliveryService = 'hasDeliveryService';
  static const String keyActive = 'active';
  static const String keyDeliveryCost = 'deliveryCost';
  static const String keyPosition = 'Position';
  static const String keyItems = 'items';

  String get id => this.objectId;

  String get name => get<String>(keyName);

  set name(String name) => set<String>(keyName, name);

  List<String> get searchTags => List<String>.from(get<List<dynamic>>(keySearchTags));

  set searchTags(List<String> searchTags) => set<List<String>>(keySearchTags, searchTags);

  String get address => get<String>(keyAddress);

  set address(String address) => set<String>(keyAddress, address);

  String get city => get<String>(keyCity);

  set city(String city) => set<String>(keyCity, city);

  String get country => get<String>(keyCountry);

  set country(String country) => set<String>(keyCountry, country);

  String get mobile => get<String>(keyMobile);

  set mobile(String mobile) => set<String>(keyMobile, mobile);

  String get openAt => get<String>(keyOpenAt);

  set openAt(String openAt) => set<String>(keyOpenAt, openAt);

  String get closeAt => get<String>(keyCloseAt);

  set closeAt(String closeAt) => set<String>(keyCloseAt, closeAt);

  String get logo => get<String>(keyLogo);

  set logo(String logo) => set<String>(keyLogo, logo);

  String get state => get<String>(keyState);

  set state(String state) => set<String>(keyState, state);

  List<int> get daysOpen => List<int>.from(get<List<dynamic>>(keyDaysOpen));

  set daysOpen(List<int> daysOpen) => set<List<int>>(keyDaysOpen, daysOpen);

  bool get hasDeliveryService => get<bool>(keyHasDeliveryService);

  set hasDeliveryService(bool hasDeliveryService) => set<bool>(keyHasDeliveryService, hasDeliveryService);

  bool get active => get<bool>(keyActive);

  set active(bool active) => set<bool>(keyActive, active);

  int get deliveryCost => get<int>(keyDeliveryCost);

  set deliveryCost(int deliveryCost) => set<int>(keyDeliveryCost, deliveryCost);

  int get position => get<int>(keyPosition);

  set position(int position) => set<int>(keyPosition, position);

  Future<List<Item>> get items async {
    final QueryBuilder query = QueryBuilder<Item>(Item())..whereEqualTo('store', this.toPointer());
    final response = await query.query();
    return response.results.map((e) => e as Item).toList();
  }
}
