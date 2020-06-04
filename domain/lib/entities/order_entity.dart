import 'dart:convert';

import 'package:domain/entities/item_entity.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:domain/entities/user_entity.dart';

import 'order_status.dart';

class OrderEntity {
  String id;
  String code;
  int deliveryCost;
  int totalAmount;
  DateTime createdAt;
  String deliveryStartedAt;
  String deliveryEndedAt;
  int cashPayment;
  String additionalRequests;
  String deliveryAddress;
  String buyerName;
  String buyerId;
  String scheduledDeliveryDate;
  OrderStatus orderStatus;
  StoreEntity storeEntity;
  UserEntity customer;
  Map<ItemEntity, int> products;

  double getCartTotal() {
    return products.isEmpty ? 0 : products.entries.map((entry) => (entry.key.price * entry.value.toDouble())).reduce((a, b) => a + b);
  }

  static OrderEntity fromJsonMap(Map<String, dynamic> jsonFile) {
    return OrderEntity()
      ..id = jsonFile['id']
      ..code = jsonFile['code']
      ..totalAmount = jsonFile['totalAmount']
      ..createdAt = DateTime.parse(jsonFile['createdAt'])
      ..storeEntity = jsonFile['store'] != null ? StoreEntity.fromJsonMap(json.decode(jsonFile['store'])) : null
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
      ..orderStatus = OrderStatus.findOrderStatus(jsonFile['status']);
  }

  static Map<String, dynamic> toJsonObject(OrderEntity orderEntity) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = orderEntity.id;
    if (orderEntity.storeEntity != null) {
      data['store'] = json.encode(StoreEntity.toJsonObject(orderEntity.storeEntity));
    }
    data['code'] = orderEntity.code;
    data['createdAt'] = orderEntity.createdAt.toIso8601String();
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
    data['status'] = orderEntity.orderStatus.toString();
    return data;
  }
}
