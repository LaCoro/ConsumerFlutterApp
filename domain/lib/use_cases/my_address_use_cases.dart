import 'package:domain/repositories/city_repository.dart';

import '../result.dart';

class MyAddressUseCases {
  final CityRepository _repository;

  MyAddressUseCases(this._repository);

  Future<Result> getAllCities() async {
    return _repository.getAllCities();
  }
}
