// @dart=2.9
import 'package:data/models/item.dart';
import 'package:data/models/order.dart';
import 'package:data/models/order_detail.dart';
import 'package:data/models/store.dart';
import 'package:data/remote_datasource/api/parse/api_service.dart';
import 'package:data/remote_datasource/errors/service_error.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:uuid/uuid.dart';

/// Class to handle all related to the Order API request using the Parse SDK Manager
class OrderApi {
  final ApiService apiService;

  OrderApi(this.apiService);

  Future<List<Order>> getUserOrders(int page, int size) async {
    final response = await apiService.getUserOrders(page, size);
    if (response.success) {
      final orders = response.results.map((e) => e as Order).toList();
      for (var order in orders) {
        order.storeEntity = (await apiService.getStore(order.store.objectId)).result as Store;
      }
      return orders;
    } else {
      throw ServiceError();
    }
  }

  Future<Order> submitOrder(OrderEntity orderEntity, UserEntity user) async {
    var parseUser = await apiService.getCurrentUser(user.sessionToken);

    if (parseUser == null) throw SessionError();

    // Create order model
    final order = Order()
      ..code = Uuid().v4()
      ..buyerName = user.fullname
      ..additionalRequests = orderEntity.additionalRequests
      ..totalAmount = orderEntity.totalAmount
      ..deliveryAddress = user.address
      ..deliveryCost = orderEntity.deliveryCost;

    final storeResponse = await apiService.getStore(orderEntity.storeEntity.id);

    final store = storeResponse.result as Store;

    order.set(Order.keyStore, store.toPointer());
    order.set(Order.keyCustomer, parseUser.toPointer());

    ParseResponse response = await apiService.createOrder(order);

    if (response.success == false) throw ServiceError();

    for (Item product in orderEntity.products.keys) {
      final orderDetail = OrderDetail()
        ..set(OrderDetail.keyQuantity, orderEntity.products[product])
        ..set(OrderDetail.keyProduct, product.toPointer())
        ..set(OrderDetail.keyOrder, order.toPointer());

      ParseResponse res = await apiService.createOrderDetail(orderDetail);

      if (res.success == false) throw ServiceError();
    }

    return response.result as Order;
  }

  Future<Order> getOrderById(String orderId) async {
    ParseResponse response = await apiService.getOrderById(orderId);
    if (response.success && response.count > 0) {
      Order order = response.result as Order;
      order.storeEntity = (await apiService.getStore(order.store.objectId)).result as Store;
      return order;
    } else {
      throw ServiceError();
    }
  }

  Future<Map<Item, int>> getOrderProducts(String orderId) async {
    return apiService.getOrderItems(orderId);
  }
}
