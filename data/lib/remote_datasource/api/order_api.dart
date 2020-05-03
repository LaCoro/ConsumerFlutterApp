import 'package:data/models/item.dart';
import 'package:data/models/order.dart';
import 'package:data/models/order_detail.dart';
import 'package:data/remote_datasource/api/parse/api_service.dart';
import 'package:data/remote_datasource/dto/OrderDTO.dart';
import 'package:data/remote_datasource/errors/service_error.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

/// Class to handle all related to the Order API request using the Parse SDK Manager
class OrderApi {
  final ApiService apiService;

  OrderApi(this.apiService);

  Future<Order> createOrder(OrderDTO orderDTO) async {
    ParseResponse response = await apiService.createOrder(orderDTO.order);

    if (response.success == false) throw ServiceError();

    for (Item product in orderDTO.products.keys) {
      final orderDetail = OrderDetail()
        ..set(OrderDetail.keyQuantity, orderDTO.products[product])
        ..set(OrderDetail.keyProduct, product.toPointer())
        ..set(OrderDetail.keyOrder, orderDTO.order.toPointer())
        ..set(OrderDetail.keyNotes, orderDTO.notes);

      ParseResponse response = await apiService.createOrderDetail(orderDetail);

      if (response.success == false) throw ServiceError();
    }
    return response.result as Order;
  }
}
