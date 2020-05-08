import 'package:data/models/city.dart';
import 'package:data/remote_datasource/api/city_api.dart';
import 'package:domain/repositories/city_repository.dart';
import 'package:domain/result.dart';

class CityRepositoryImpl extends CityRepository {
  final CityApi _remoteDataSource;

  CityRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result> getAllCities() async {
    try {
      final cities = await _remoteDataSource.getAllCities();
      return Success(cities);
    } catch (e) {
      return Failure(e);
    }
  }
}
