import 'dart:core';

import 'package:data/models/store.dart';
import 'package:data/models/user.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Order extends ParseObject with OrderEntity implements ParseCloneable {
  Order() : super(_keyTableName);

  Order.clone() : this();

  @override
  clone(Map map) => Order.clone()..fromJson(map);

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

  String get code => get<String>(keyCode);

  set code(String code) => set<String>(keyCode, code);

  int get deliveryCost => get<int>(keyDeliveryCost);

  set deliveryCost(int deliveryCost) => set<int>(keyDeliveryCost, deliveryCost);

  double get totalAmount => get<double>(keyTotalAmount);

  DateTime get createdAt => get<DateTime>(keyCreatedAt);

  set totalAmount(double totalAmount) => set<double>(keyTotalAmount, totalAmount);

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

  String get status => get<String>(keyStatus);

  set status(String status) => set<String>(keyStatus, status);

  // TODO move these methods to the  API class
  Future<User> getCustomer() async {
    final response = await this.getObject(keyCustomer);
    return response.result as User;
  }

  Future<User> getDeliveryBoy() async {
    final response = await this.getObject(keyDeliveryBoy);
    return response.result as User;
  }

  Future<StoreEntity> getStore() async {
    final response = await this.getObject(keyStore);
    return response.result as Store;
  }
}
