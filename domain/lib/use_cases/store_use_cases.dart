import 'package:domain/entities/ciity_entity.dart';
import 'package:domain/repositories/store_repository.dart';

import '../result.dart';

class StoreUseCases {
  static const int PAGE_SIZE = 10;

  final StoreRepository _repository;

  StoreUseCases(this._repository);

  Future<Result> fetchStores(CityEntity city, {int page = 0, int size = PAGE_SIZE, String searchQuery}) async {
    return _repository.fetchStores(city.id, page, size, searchQuery: searchQuery);
  }

  Future<Result> getStoreItems(String storeId) async {
    return _repository.getStoreItems(storeId);
  }
}
