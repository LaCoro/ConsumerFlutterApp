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

  Future<Order> submitOrder(OrderEntity orderEntity, UserEntity user) async {
    var parseUser = (await ParseUser.currentUser());

    // Create order model
    final order = Order()
      ..code = Uuid().v4()
      ..buyerId = user.id
      ..buyerName = user.fullname
      ..additionalRequests = orderEntity.additionalRequests
      ..totalAmount = orderEntity.totalAmount
      ..deliveryAddress = user.address
      ..deliveryCost = orderEntity.deliveryCost;

    final storeResponse = await apiService.getStore(orderEntity.store.id);

    final store = storeResponse.result as Store;

    order.set(Order.keyStore, store.toPointer());
    order.set(Order.keyCustomer, parseUser);

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
}
