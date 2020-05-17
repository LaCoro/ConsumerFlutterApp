import 'package:domain/result.dart';

abstract class StoreRepository {
  /// Fetch All stores from the specific city
  Future<Result> getAllStoresByCity(String cityId, int page, int size);

  Future<Result> getStoreItems(String storeId);
}
