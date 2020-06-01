import 'package:domain/entities/store_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

abstract class ItemEntity {
  String name;
  String description;
  int price;
  ParseObject parent;
  int position;
  String picture;
  Future<StoreEntity> store;
}
