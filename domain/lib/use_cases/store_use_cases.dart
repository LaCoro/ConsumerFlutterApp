import 'package:domain/entities/ciity_entity.dart';
import 'package:domain/repositories/store_repository.dart';

import '../result.dart';

class StoreUseCases {
  final StoreRepository _repository;

  StoreUseCases(this._repository);

  Future<Result> getAllStoresByCity(CityEntity city) async {
    return _repository.getAllStoresByCity(city.id);
  }

  Future<Result> getStoreItems(String storeId) async {
    return _repository.getStoreItems(storeId);
  }

}
