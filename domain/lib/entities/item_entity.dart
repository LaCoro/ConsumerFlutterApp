import 'package:domain/entities/store_entity.dart';

abstract class ItemEntity {
  String name;
  String description;
  int price;
  StoreEntity store;
  ItemEntity parent;
  int position;
}
