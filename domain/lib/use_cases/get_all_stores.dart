import 'package:domain/entities/store_entity.dart';
import 'package:domain/repositories/store_repository.dart';

// TODO remove this
class GetAllStores {
  final StoreRepository _repository;

  GetAllStores(this._repository);

  Future<List<StoreEntity>> call(String city) async {
    return _repository.getAllStores(city);
  }
}

class GetAllStoresByCity {
  final StoreRepository _repository;

  GetAllStoresByCity(this._repository);

  Future<List<StoreEntity>> call(String city) async {
    return _repository.getAllStores(city);
  }
}
