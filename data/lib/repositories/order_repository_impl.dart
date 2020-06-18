import 'package:data/remote_datasource/api/order_api.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:domain/repositories/order_repository.dart';
import 'package:domain/result.dart';

class OrderRepositoryImpl extends OrderRepository {
  final OrderApi _remoteDataSource;

  OrderRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result> getUserOrders(int page, int size) async {
    try {
      final orders = await _remoteDataSource.getUserOrders(page, size);
      return Success(orders);
    } catch (e) {
      return Failure(e);
    }
  }

  @override
  Future<Result> submitOrder(OrderEntity orderEntity, UserEntity userEntity) async {
    try {
      final order = await _remoteDataSource.submitOrder(orderEntity, userEntity);
      return Success(order);
    } catch (e) {
      return Failure(e);
    }
  }

  @override
  Future<Result> getOrderById(String id) async {
    try {
      final order = await _remoteDataSource.getOrderById(id);
      return Success(order);
    } catch (e) {
      return Failure(e);
    }
  }
}
