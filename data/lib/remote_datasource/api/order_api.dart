import 'package:data/models/item.dart';
import 'package:data/models/order.dart';
import 'package:data/models/order_detail.dart';
import 'package:data/models/store.dart';
import 'package:data/models/user.dart';
import 'package:data/remote_datasource/api/parse/api_service.dart';
import 'package:data/remote_datasource/errors/service_error.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

/// Class to handle all related to the Order API request using the Parse SDK Manager
class OrderApi {
  final ApiService apiService;

  OrderApi(this.apiService);

  Future<Order> createOrder(Store store, Map<Item, int> products, User user, {String comments}) async {
    // Create order model
    final order = Order()
      ..buyerId = user.objectId
      ..buyerName = user.fullname
      ..additionalRequests = comments
      ..deliveryAddress = user.address
      ..deliveryCost = store.deliveryCost;

    order.set(Order.keyStore, store.toPointer());
    order.set(Order.keyCustomer, user.toPointer());

    ParseResponse response = await apiService.createOrder(order);

    if (response.success == false) throw ServiceError();

    for (Item product in products.keys) {
      final orderDetail = OrderDetail()
        ..set(OrderDetail.keyQuantity, products[product])
        ..set(OrderDetail.keyProduct, product.toPointer())
        ..set(OrderDetail.keyOrder, order.toPointer())
        ..set(OrderDetail.keyNotes, comments);

      ParseResponse res = await apiService.createOrderDetail(orderDetail);

      if (res.success == false) throw ServiceError();
    }

    return response.result as Order;
  }
}
