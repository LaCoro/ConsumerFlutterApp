import 'package:domain/entities/store_entity.dart';

abstract class StoreRepository {
  /// Fetch All stores from the specific city
  Future<List<StoreEntity>> getAllStores(String city);
}
