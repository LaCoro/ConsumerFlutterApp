import 'package:domain/entities/item_entity.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Item extends ParseObject with ItemEntity implements ParseCloneable {
  Item() : super(_keyTableName);

  Item.clone() : this();

  @override
  clone(Map map) => Item.clone()..fromJson(map);

  static const String _keyTableName = 'Item';

  static const String keyName = 'name';
  static const String keyDescription = 'descriptio';
  static const String keyPrice = 'price';
  static const String keyStore = 'store'; //
  static const String keyParent = 'parent'; //
  static const String keyPosition = 'position';

  String get name => get<String>(keyName);

  set name(String name) => set<String>(keyName, name);

  String get description => get<String>(keyDescription);

  set description(String description) => set<String>(keyDescription, description);

  int get price => get<int>(keyPrice);

  set price(int price) => set<int>(keyPrice, price);

  StoreEntity get store => get<StoreEntity>(keyStore);

  set store(StoreEntity parent) => set<StoreEntity>(keyStore, store);

  ItemEntity get parent => get<ItemEntity>(keyParent);

  set parent(ItemEntity parent) => set<ItemEntity>(keyParent, parent);

  int get position => get<int>(keyPosition);

  set poaition(int position) => set<int>(keyPosition, position);

}
