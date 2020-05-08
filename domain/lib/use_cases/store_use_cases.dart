import 'package:domain/repositories/store_repository.dart';

import '../result.dart';

class StoreUseCases {
  final StoreRepository _repository;

  StoreUseCases(this._repository);

  Future<Result> getAllStoresByCity(String city) async {
    return _repository.getAllStores(city);
  }

}
