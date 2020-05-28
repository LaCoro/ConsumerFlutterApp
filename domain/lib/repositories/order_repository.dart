import 'package:domain/entities/order_entity.dart';
import 'package:domain/result.dart';

abstract class OrderRepository {

  Future<Result> submitOrder(OrderEntity orderEntity);

}
