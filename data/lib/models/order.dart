// @dart=2.9
import 'dart:core';

import 'package:domain/entities/order_entity.dart';
import 'package:domain/entities/order_status.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Order extends ParseObject with OrderEntity implements ParseCloneable {
  Order() : super(_keyTableName);

  Order.clone() : this();

  @override
  clone(Map<String, dynamic> map) => Order.clone()..fromJson(map);

  static const String _keyTableName = 'Order';

  static const String keyCode = 'code';
  static const String keyStore = 'store';
  static const String keyTotalAmount = 'totalAmount';
  static const String keyDeliveryCost = 'deliveryCost';
  static const String keyDeliveryStartedAt = 'deliveryStartedAt';
  static const String keyDeliveryEndedAt = 'deliveryEndedAt';
  static const String keyCashPayment = 'cashPayment';
  static const String keyAdditionalRequests = 'additionalRequests';
  static const String keyDeliveryAddress = 'deliveryAddress';
  static const String keyBuyerName = 'buyerName';
  static const String keyBuyerId = 'buyerId';
  static const String keyScheduledDeliveryDate = 'scheduledDeliveryDate';
  static const String keyStatus = 'status';
  static const String keyCustomer = 'customer';
  static const String keyDeliveryBoy = 'deliveryBoy';
  static const String keyCreatedAt = 'createdAt';

  String get id => this.objectId;

  String get code => get<String>(keyCode);

  set code(String code) => set<String>(keyCode, code);

  int get deliveryCost => get<int>(keyDeliveryCost);

  set deliveryCost(int deliveryCost) => set<int>(keyDeliveryCost, deliveryCost);

  int get totalAmount => get<int>(keyTotalAmount);

  DateTime get createdAt => get<DateTime>(keyCreatedAt);

  set totalAmount(int totalAmount) => set<int>(keyTotalAmount, totalAmount);

  String get deliveryStartedAt => get<String>(keyDeliveryStartedAt);

  set deliveryStartedAt(String deliveryStartedAt) => set<String>(keyDeliveryStartedAt, deliveryStartedAt);

  String get deliveryEndedAt => get<String>(keyDeliveryEndedAt);

  set deliveryEndedAt(String deliveryEndedAt) => set<String>(keyDeliveryEndedAt, deliveryEndedAt);

  int get cashPayment => get<int>(keyCashPayment);

  set cashPayment(int cashPayment) => set<int>(keyCashPayment, cashPayment);

  String get additionalRequests => get<String>(keyAdditionalRequests);

  set additionalRequests(String additionalRequests) => set<String>(keyAdditionalRequests, additionalRequests);

  String get deliveryAddress => get<String>(keyDeliveryAddress);

  set deliveryAddress(String deliveryAddress) => set<String>(keyDeliveryAddress, deliveryAddress);

  String get buyerName => get<String>(keyBuyerName);

  set buyerName(String buyerName) => set<String>(keyBuyerName, buyerName);

  String get buyerId => get<String>(keyBuyerId);

  set buyerId(String buyerId) => set<String>(keyBuyerId, buyerId);

  String get scheduledDeliveryDate => get<String>(keyScheduledDeliveryDate);

  set scheduledDeliveryDate(String scheduledDeliveryDate) => set<String>(keyScheduledDeliveryDate, scheduledDeliveryDate);

  OrderStatus get orderStatus => OrderStatus.findOrderStatus(get<String>(keyStatus));

  ParseObject get store => get<ParseObject>(keyStore);
}
