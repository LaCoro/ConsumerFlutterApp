import 'package:domain/entities/store_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';


class Store extends ParseObject with StoreEntity implements ParseCloneable {
  Store() : super(_keyTableName);

  Store.clone() : this();

  @override
  clone(Map map) => Store.clone()..fromJson(map);

  static const String _keyTableName = 'Store';
  static const String keyName = 'name';

  String get name => get<String>(keyName);
  set name(String name) => set<String>(keyName, name);

}
