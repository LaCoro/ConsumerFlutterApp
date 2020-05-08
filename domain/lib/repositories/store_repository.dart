import 'package:domain/entities/ciity_entity.dart';
import 'package:domain/result.dart';

abstract class StoreRepository {
  /// Fetch All stores from the specific city
  Future<Result> getAllStores(CityEntity city);

  Future<Result> getStoreItems(String storeId);
}
