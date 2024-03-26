// @dart=2.9
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:data/models/city.dart';
import 'package:data/models/item.dart';
import 'package:data/models/order.dart';
import 'package:data/models/order_detail.dart';
import 'package:data/models/store.dart';
import 'package:data/models/user.dart';
import 'package:data/remote_datasource/api/parse/api_service.dart';
import 'package:data/remote_datasource/errors/service_error.dart';
import 'package:domain/entities/user_entity.dart';
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
      // TODO we need to handle this limit using pagination
      ..setLimit(500)
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
  Future<ParseResponse> getUserOrders(int page, int size) async {
    final user = await ParseUser.currentUser();

    final QueryBuilder query = QueryBuilder<Order>(Order())
      ..orderByDescending(Order.keyCreatedAt)
      ..setAmountToSkip(page * size)
      ..setLimit(size)
      ..whereEqualTo(Order.keyCustomer, user);
    return await query.query();
  }

  @override
  Future<ParseResponse> submitUserRegister(UserEntity user) async {
    try {
      final pass = md5.convert(utf8.encode(user.mobile)).toString();

      final userRegister = ParseUser(user.mobile, pass, user.email);

      var response = await userRegister.signUp();

      response = await userRegister.login();

      if (response.success) {
        userRegister
          ..set(User.keyMobile, user.mobile)
          ..set(User.keyPhone, user.mobile)
          ..set(User.keyUsername, user.mobile)
          ..set(User.keyFullname, user.fullname)
          ..set(User.keyEmail, user.email);
        final updatedUser = await userRegister.update();
        return updatedUser;
      } else {
        throw ServiceError();
      }
    } catch (e) {
      throw ServiceError();
    }
  }

  @override
  Future<ParseUser> getCurrentUser(String sessionToken) async {
    var parseUser = await ParseUser.currentUser();

    if (parseUser == null) {
      parseUser = (await ParseUser.getCurrentUserFromServer(sessionToken)).result;
    }

    return parseUser as ParseUser;
  }

  @override
  Future<ParseResponse> getOrderById(String orderId) async {
    return await Order().getObject(orderId);
  }

  @override
  Future<Map<Item, int>> getOrderItems(String orderId) async {
    QueryBuilder query = QueryBuilder<ParseObject>(OrderDetail())..whereEqualTo(OrderDetail.keyOrder, (Order()..objectId = orderId).toPointer());

    ParseResponse response = await query.query();

    if (response.success && response.count > 0) {
      List<OrderDetail> orderDetails = response.results.cast<OrderDetail>();
      Map<Item, int> orderItems = Map();

      for (OrderDetail orderDetail in orderDetails) {
        Item item = (await Item().getObject(orderDetail.product.objectId)).result as Item;
        orderItems.putIfAbsent(item, () => orderDetail.quantity);
      }
      return orderItems;
    } else {
      throw UnimplementedError();
    }
  }
}
