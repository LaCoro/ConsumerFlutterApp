import 'package:domain/entities/store_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

abstract class ItemEntity {
  late String name;
  late String description;
  late int price;
  late ParseObject parent;
  late int position;
  late String picture;
  late Future<StoreEntity> store;
}
