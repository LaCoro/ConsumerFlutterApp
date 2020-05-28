import 'package:data/remote_datasource/api/order_api.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:domain/repositories/order_repository.dart';
import 'package:domain/result.dart';

class OrderRepositoryImpl extends OrderRepository {
  final OrderApi _remoteDataSource;

  OrderRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result> submitOrder(OrderEntity orderEntity, UserEntity userEntity) async {
    try {
      final order = await _remoteDataSource.submitOrder(orderEntity, userEntity);
      return Success(order);
    } catch (e) {
      return Failure(e);
    }
  }
}
