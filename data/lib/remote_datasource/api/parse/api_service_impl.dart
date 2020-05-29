import 'dart:convert';

import 'package:crypto/crypto.dart';
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
    final QueryBuilder query = QueryBuilder<Item>(Item())..whereEqualTo(Item.keyStore, (store.result as Store).toPointer());
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
    final pass = md5.convert(utf8.encode(user.mobile)).toString();

    final userRegister = ParseUser.createUser(user.mobile, pass, user.email)
      ..set(User.keyMobile, user.mobile)
      ..set(User.keyPhone, user.mobile)
      ..set(User.keyUsername, user.mobile)
      ..set(User.keyFullname, user.fullname)
      ..set(User.keyEmail, user.email);

    var response = await userRegister.signUp();
    response = await userRegister.login();

    user.id = (response.result as ParseUser).objectId;

    return user.save();
  }
}
