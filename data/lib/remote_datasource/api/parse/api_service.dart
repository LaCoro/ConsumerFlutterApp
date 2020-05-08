import 'package:data/models/order.dart';
import 'package:data/models/order_detail.dart';
import 'package:domain/entities/ciity_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

///Manager that defines all the API service requests.
abstract class ApiService {
  Future<ParseResponse> getAllStoresByCity(CityEntity cityEntity);

  Future<ParseResponse> getStoreItems(String storeId);

  Future<ParseResponse> createOrder(Order order);

  Future<ParseResponse> createOrderDetail(OrderDetail orderDetail);

  Future<ParseResponse> getAllCities();
}
