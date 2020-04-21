import 'package:data/remote_datasource/api/store_api.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:domain/repositories/store_repository.dart';

class StoreRepositoryImpl extends StoreRepository {

  final StoreApi _remoteDataSource;

  StoreRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<StoreEntity>> getAllStores() {
    return _remoteDataSource.getAllStores();
  }

}
