import 'package:domain/result.dart';

abstract class CityRepository {
  /// Fetch all cities
  Future<Result> getAllCities();
}
