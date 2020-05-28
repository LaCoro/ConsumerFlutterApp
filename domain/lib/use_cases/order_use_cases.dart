import 'package:domain/entities/order_entity.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:domain/repositories/order_repository.dart';
import 'package:domain/repositories/profile_repository.dart';

import '../result.dart';

class OrderUseCases {
  final OrderRepository _repository;

  OrderUseCases(this._repository);

  Future<Result> submitOrder(OrderEntity orderEntity) async {
    return _repository.submitOrder(orderEntity);
  }
}
