import 'package:data/remote_datasource/api/store_api.dart';
import 'package:domain/entities/ciity_entity.dart';
import 'package:domain/repositories/store_repository.dart';
import 'package:domain/result.dart';

class StoreRepositoryImpl extends StoreRepository {
  final StoreApi _remoteDataSource;

  StoreRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result> getAllStoresByCity(String cityId) async {
    try {
      final stores = await _remoteDataSource.getAllStores(cityId);
      return Success(stores);
    } catch (e) {
      return Failure(e);
    }
  }

  @override
  Future<Result> getStoreItems(String storeId) async {
    try {
      final storeItems = await _remoteDataSource.getStoreItems(storeId);
      return Success(storeItems);
    } catch (e) {
      return Failure(e);
    }
  }
}
