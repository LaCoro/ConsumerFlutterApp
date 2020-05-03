import 'package:domain/result.dart';

abstract class StoreRepository {
  /// Fetch All stores from the specific city
  Future<Result> getAllStores(String city);
}
