import 'dart:convert';

import 'package:domain/entities/item_entity.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:domain/entities/user_entity.dart';

class OrderEntity {
  String id;
  String code;
  int deliveryCost;
  double totalAmount;
  String deliveryStartedAt;
  String deliveryEndedAt;
  int cashPayment;
  String additionalRequests;
  String deliveryAddress;
  String buyerName;
  String buyerId;
  String scheduledDeliveryDate;
  String status;
  StoreEntity store;
  UserEntity customer;
  Map<ItemEntity, int> products;

  double getCartTotal() {
    return products.isEmpty ? 0 : products.entries.map((entry) => (entry.key.price * entry.value.toDouble())).reduce((a, b) => a + b);
  }

  static OrderEntity fromJsonMap(Map<String, dynamic> jsonFile) {
    return OrderEntity()
      ..code = jsonFile['code']
      ..totalAmount = jsonFile['totalAmount']
      ..store = jsonFile['store'] != null ? StoreEntity.fromJsonMap(json.decode(jsonFile['store'])) : null
      ..deliveryCost = jsonFile['deliveryCost']
      ..deliveryStartedAt = jsonFile['deliveryStartedAt']
      ..deliveryEndedAt = jsonFile['deliveryEndedAt']
      ..cashPayment = jsonFile['cashPayment']
      ..additionalRequests = jsonFile['additionalRequests']
      ..deliveryAddress = jsonFile['deliveryAddress']
      ..customer = jsonFile['customer'] != null ? UserEntity.fromJsonMap(json.decode(jsonFile['customer'])) : null
      ..buyerName = jsonFile['buyerName']
      ..buyerId = jsonFile['buyerId']
      ..scheduledDeliveryDate = jsonFile['scheduledDeliveryDate']
      ..status = jsonFile['status'];
  }

  static Map<String, dynamic> toJsonObject(OrderEntity orderEntity) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (orderEntity.store != null) {
      data['store'] = json.encode(StoreEntity.toJsonObject(orderEntity.store));
    }
    data['code'] = orderEntity.code;
    data['totalAmount'] = orderEntity.totalAmount;
    data['deliveryCost'] = orderEntity.deliveryCost;
    data['deliveryStartedAt'] = orderEntity.deliveryStartedAt;
    data['deliveryEndedAt'] = orderEntity.deliveryEndedAt;
    data['cashPayment'] = orderEntity.cashPayment;
    data['additionalRequests'] = orderEntity.additionalRequests;
    data['deliveryAddress'] = orderEntity.deliveryAddress;
    if (orderEntity.customer != null) {
      data['customer'] = json.encode(UserEntity.toJsonObject(orderEntity.customer));
    }
    data['buyerName'] = orderEntity.buyerName;
    data['buyerId'] = orderEntity.buyerId;
    data['scheduledDeliveryDate'] = orderEntity.scheduledDeliveryDate;
    data['status'] = orderEntity.status;
    return data;
  }
}
