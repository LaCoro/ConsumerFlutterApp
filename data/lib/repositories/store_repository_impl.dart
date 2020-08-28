import 'package:data/remote_datasource/api/store_api.dart';
import 'package:domain/repositories/store_repository.dart';
import 'package:domain/result.dart';

class StoreRepositoryImpl extends StoreRepository {
  final StoreApi _remoteDataSource;

  StoreRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result> fetchStores(String cityId, int page, int size, {String searchQuery}) async {
    try {
      final stores = await _remoteDataSource.fetchStores(cityId, page, size, searchQuery: searchQuery);
      return Success(stores);
    } catch (e) {
      return Failure(exception: e);
    }
  }

  @override
  Future<Result> getStoreItems(String storeId) async {
    try {
      final storeItems = await _remoteDataSource.getStoreItems(storeId);
      return Success(storeItems);
    } catch (e) {
      return Failure(exception: e);
    }
  }
}
