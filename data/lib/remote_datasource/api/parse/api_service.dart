import 'package:data/models/order.dart';
import 'package:data/models/order_detail.dart';
import 'package:data/models/user.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

///Manager that defines all the API service requests.
abstract class ApiService {
  Future<ParseResponse> fetchStores(String cityId, int page, int size, {String searchQuery});

  Future<ParseResponse> getStore(String storeId);

  Future<ParseResponse> getStoreItems(String storeId);

  Future<ParseResponse> createOrder(Order order);

  Future<ParseResponse> createOrderDetail(OrderDetail orderDetail);

  Future<ParseResponse> getAllCities();

  Future<ParseResponse> submitUserRegister(User user);
}
