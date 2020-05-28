import 'package:data/models/city.dart';
import 'package:data/models/item.dart';
import 'package:data/models/order.dart';
import 'package:data/models/order_detail.dart';
import 'package:data/models/store.dart';
import 'package:data/models/user.dart';
import 'package:data/remote_datasource/api/parse/api_service.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

///Manager that defines all the API service requests.
class ApiServiceImpl extends ApiService {
  @override
  Future<ParseResponse> fetchStores(String cityId, int page, int size, {String searchQuery}) async {
    final city = await City().getObject(cityId);
    QueryBuilder query = QueryBuilder<ParseObject>(Store())
      ..orderByAscending(Store.keyOpenAt)
      ..setAmountToSkip(page * size)
      ..setLimit(size)
      ..whereEqualTo(Store.keyCity, (city.result as City).name);

    if (searchQuery != null) {
      query = query..whereContains(Store.keySearchTags, searchQuery);
    }

    return await query.query();
  }

  @override
  Future<ParseResponse> getStore(String storeId) async {
    return await Store().getObject(storeId);
  }

  @override
  Future<ParseResponse> getStoreItems(String storeId) async {
    final store = await Store().getObject(storeId);
    final QueryBuilder query = QueryBuilder<Item>(Item())
      ..whereEqualTo(Item.keyStore, (store.result as Store).toPointer());
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

  @override
  Future<ParseResponse> submitUserRegister(User user) async {
    final QueryBuilder query = QueryBuilder<ParseObject>(User())
      ..whereEqualTo(User.keyMobile, user.mobile);
    final response = await query.query();
    if (response.success && response.count != 0) {
      user.id = (response.results.first as User).id;
    }
    await user.pin();
    return user.save();
  }
}
