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
  String state;
  StoreEntity store;
  UserEntity customer;
  Map<ItemEntity, int> products;

  double getCartTotal() {
    return products.isEmpty ? 0 : products.entries.map((entry) => (entry.key.price * entry.value.toDouble())).reduce((a, b) => a + b);
  }
}
