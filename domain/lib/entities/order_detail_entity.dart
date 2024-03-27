// @dart=2.9
import 'package:domain/entities/item_entity.dart';

import 'order_entity.dart';

abstract class OrderDetailEntity {
  int quantity;
  String notes;
  ItemEntity item;
  OrderEntity order;
}
