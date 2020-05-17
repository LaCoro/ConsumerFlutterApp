import 'package:domain/result.dart';

abstract class StoreRepository {
  /// Fetch stores from the specific city
  Future<Result> fetchStores(String cityId, int page, int size, {String searchQuery});

  Future<Result> getStoreItems(String storeId);
}
