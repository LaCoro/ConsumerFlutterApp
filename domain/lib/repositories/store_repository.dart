import 'package:domain/result.dart';

abstract class StoreRepository {
  /// Fetch All stores from the specific city
  Future<Result> getAllStoresByCity(String cityId);

  Future<Result> getStoreItems(String storeId);
}
