import 'package:domain/entities/store_entity.dart';

abstract class StoreRepository {
  /// Fetch All stores
  Future<List<StoreEntity>> getAllStores();
}
