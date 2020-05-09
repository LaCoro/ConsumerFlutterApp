import 'package:domain/repositories/city_repository.dart';

import '../result.dart';

class CityUseCases {
  final CityRepository _repository;

  CityUseCases(this._repository);

  Future<Result> getAllCities() async {
    return _repository.getAllCities();
  }
}
