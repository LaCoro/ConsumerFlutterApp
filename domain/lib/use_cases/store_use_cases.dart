import 'package:domain/entities/ciity_entity.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:domain/repositories/store_repository.dart';

import '../result.dart';

class StoreUseCases {
  final StoreRepository _repository;

  StoreUseCases(this._repository);

  Future<Result> getAllStoresByCity(CityEntity city) async {
    return _repository.getAllStores(city);
  }

  Future<Result> getStoreItems(StoreEntity storeEntity) async {
    return _repository.getStoreItems(storeEntity.id);
  }

}
