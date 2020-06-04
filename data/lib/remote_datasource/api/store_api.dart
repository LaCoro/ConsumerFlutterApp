import 'dart:collection';

import 'package:data/models/item.dart';
import 'package:data/models/store.dart';
import 'package:data/remote_datasource/api/parse/api_service.dart';
import 'package:data/remote_datasource/errors/service_error.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

/// Class to handle all related to the Store API request using the Parse SDK Manager
class StoreApi {
  final ApiService apiService;

  StoreApi(this.apiService);

  Future<List<Store>> fetchStores(String cityId, int page, int size, {String searchQuery}) async {
    final response = await apiService.fetchStores(cityId, page, size, searchQuery: searchQuery);
    if (response.success) {
      return response.results.map((e) => e as Store).toList();
    } else {
      throw ServiceError();
    }
  }

  Future<Map<Item, List<Item>>> getStoreItems(String storeId) async {
    final response = await apiService.getStoreItems(storeId);
    if (response.success) {
      final items = response.results.map((e) => e as Item).toList();
      return _sortedItems(items);
    } else {
      throw ServiceError();
    }
  }

  Future<Map<Item, List<Item>>> _sortedItems(List<Item> items) async {
    Map<Item, List<Item>> itemsMap = Map();
    for (Item element in items) {
      final ParseObject itemParent = element.parent;
      if (itemParent?.objectId != null) {
        itemsMap.update(
          items.firstWhere((e) => e.objectId == itemParent.objectId),
          (value) => value..add(element),
          ifAbsent: () => [element],
        );
      }
    }
    return itemsMap;
  }
}
