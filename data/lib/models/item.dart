import 'package:domain/entities/item_entity.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Item extends ParseObject with ItemEntity implements ParseCloneable {
  Item() : super(_keyTableName);

  Item.clone() : this();

  @override
  clone(Map map) => Item.clone()..fromJson(map);

  static const String _keyTableName = 'Item';
}
