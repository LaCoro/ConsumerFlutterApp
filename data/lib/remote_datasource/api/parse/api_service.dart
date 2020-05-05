import 'package:data/models/order.dart';
import 'package:data/models/order_detail.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

///Manager that defines all the API service requests.
abstract class ApiService {
  Future<ParseResponse> getAllStores();

  Future<ParseResponse> createOrder(Order order);

  Future<ParseResponse> createOrderDetail(OrderDetail orderDetail);
}
