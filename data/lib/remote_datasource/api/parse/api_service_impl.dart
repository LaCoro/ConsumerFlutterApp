import 'package:data/models/city.dart';
import 'package:data/models/order.dart';
import 'package:data/models/order_detail.dart';
import 'package:data/models/store.dart';
import 'package:data/remote_datasource/api/parse/api_service.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

///Manager that defines all the API service requests.
class ApiServiceImpl extends ApiService {
  @override
  Future<ParseResponse> getAllStores() async {
    return Store().getAll();
  }

  @override
  Future<ParseResponse> createOrder(Order order) {
    return order.save();
  }

  @override
  Future<ParseResponse> createOrderDetail(OrderDetail orderDetail) {
    return orderDetail.save();
  }

  @override
  Future<ParseResponse> getAllCities() {
    return City().getAll();
  }
}
