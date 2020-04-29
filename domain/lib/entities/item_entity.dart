import 'package:domain/entities/store_entity.dart';

abstract class ItemEntity {
  String name;
  String description;
  int price;
  ItemEntity parent;
  int position;
  Future<StoreEntity> store;
}
