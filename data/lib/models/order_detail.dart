// @dart=2.9
import 'dart:core';

import 'package:domain/entities/order_detail_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class OrderDetail extends ParseObject with OrderDetailEntity implements ParseCloneable {
  OrderDetail() : super(_keyTableName);

  OrderDetail.clone() : this();

  @override
  clone(Map map) => OrderDetail.clone()..fromJson(map);

  static const String _keyTableName = 'OrderDetail';

  static const String keyQuantity = 'quantity';
  static const String keyNotes = 'notes';
  static const String keyProduct = 'product';
  static const String keyOrder = 'order';

  int get quantity => get<int>(keyQuantity);

  set quantity(int quantity) => set<int>(keyQuantity, quantity);

  String get notes => get<String>(keyNotes);

  set notes(String notes) => set<String>(keyNotes, notes);

  ParseObject get product => get<ParseObject>(keyProduct);

}
