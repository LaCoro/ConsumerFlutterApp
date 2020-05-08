import 'package:data/models/city.dart';
import 'package:data/models/item.dart';
import 'package:data/models/order.dart';
import 'package:data/models/order_detail.dart';
import 'package:data/models/store.dart';
import 'package:data/remote_datasource/api/parse/api_service.dart';
import 'package:domain/entities/ciity_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

///Manager that defines all the API service requests.
class ApiServiceImpl extends ApiService {
  @override
  Future<ParseResponse> getAllStoresByCity(CityEntity cityEntity) async {
    return Store().getAll();
  }

  @override
  Future<ParseResponse> getStoreItems(String storeId) async {
    final store = await Store().getObject(storeId);
    final QueryBuilder query = QueryBuilder<Item>(Item())..whereEqualTo('store', store.result.toPointer());
    return await query.query();
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
