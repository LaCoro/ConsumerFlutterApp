import 'package:domain/entities/ciity_entity.dart';
import 'package:domain/repositories/store_repository.dart';

import '../result.dart';

class StoreUseCases {
  final StoreRepository _repository;

  StoreUseCases(this._repository);

  Future<Result> getAllStoresByCity(CityEntity city, {int page = 0, int size = 10}) async {
    return _repository.getAllStoresByCity(city.id, page, size);
  }

  Future<Result> getStoreItems(String storeId) async {
    return _repository.getStoreItems(storeId);
  }

}
