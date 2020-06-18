import 'package:domain/entities/order_entity.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:domain/repositories/order_repository.dart';

import '../result.dart';

class OrderUseCases {
  static const int PAGE_SIZE = 10;

  final OrderRepository _repository;

  OrderUseCases(this._repository);

  Future<Result> submitOrder(OrderEntity orderEntity, UserEntity userEntity) async {
    return _repository.submitOrder(orderEntity, userEntity);
  }

  Future<Result> getUserOrders(int page, {int size = PAGE_SIZE}) async {
    return _repository.getUserOrders(page, size);
  }

  Future<Result> getOrderById(String id) async {
    return _repository.getOrderById(id);
  }
}
