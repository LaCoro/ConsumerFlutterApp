import 'package:domain/entities/store_entity.dart';
import 'package:domain/entities/user_entity.dart';

abstract class OrderEntity {
  String code;
  StoreEntity store;
  int deliveryCost;
  String deliveryStartedAt;
  String deliveryEndedAt;
  int cashPayment;
  String additionalRequests;
  String deliveryAddress;
  String buyerName;
  String buyerId;
  String scheduledDeliveryDate;
  String state;
  UserEntity customer;
  UserEntity deliveryBoy;
}
