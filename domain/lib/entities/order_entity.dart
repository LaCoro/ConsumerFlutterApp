import 'package:domain/entities/item_entity.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:domain/entities/user_entity.dart';

class OrderEntity {
  String code;
  int deliveryCost;
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

  static OrderEntity fromJsonMap(Map<String, dynamic> json) {
    return OrderEntity()
      ..code = json['code']
      ..store = json['store'] != null ? StoreEntity.fromJsonMap(json['store']) : null
      ..deliveryCost = json['deliveryCost']
      ..deliveryStartedAt = json['deliveryStartedAt']
      ..deliveryEndedAt = json['deliveryEndedAt']
      ..cashPayment = json['cashPayment']
      ..additionalRequests = json['additionalRequests']
      ..deliveryAddress = json['deliveryAddress']
      ..customer = json['customer'] != null ? UserEntity.fromJsonMap(json['customer']) : null
      ..buyerName = json['buyerName']
      ..buyerId = json['buyerId']
      ..scheduledDeliveryDate = json['scheduledDeliveryDate']
      ..status = json['status'];
  }

  static Map<String, dynamic> toJsonObject(OrderEntity orderEntity) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = orderEntity.code;
    if (orderEntity.store != null) {
      data['store'] = StoreEntity.toJsonObject(orderEntity.store);
    }
    data['deliveryCost'] = orderEntity.deliveryCost;
    data['deliveryStartedAt'] = orderEntity.deliveryStartedAt;
    data['deliveryEndedAt'] = orderEntity.deliveryEndedAt;
    data['cashPayment'] = orderEntity.cashPayment;
    data['additionalRequests'] = orderEntity.additionalRequests;
    data['deliveryAddress'] = orderEntity.deliveryAddress;
    if (orderEntity.customer != null) {
      data['customer'] = UserEntity.toJsonObject(orderEntity.customer);
    }
    data['buyerName'] = orderEntity.buyerName;
    data['buyerId'] = orderEntity.buyerId;
    data['scheduledDeliveryDate'] = orderEntity.scheduledDeliveryDate;
    data['status'] = orderEntity.status;
    return data;
  }
}
