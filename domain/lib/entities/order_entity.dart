import 'package:domain/entities/store_entity.dart';

abstract class OrderEntity {
  String code;
//  DeliveryBoy deliveryBoy;
  StoreEntity store;
  int deliveryCost;
  String deliveryStartedAt;
  String deliveryEndedAt;
  int cashPayment;
  String additionalRequests;
  String deliveryAddress;
//  DeliveryBoy customer;
  String buyerName;
  String buyerId;
  String scheduledDeliveryDate;
  String state;
}
