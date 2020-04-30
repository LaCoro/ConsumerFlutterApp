import 'package:data/remote_datasource/api/store_api.dart';
import 'package:domain/repositories/store_repository.dart';
import 'package:domain/result.dart';

class StoreRepositoryImpl extends StoreRepository {

  final StoreApi _remoteDataSource;

  StoreRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result> getAllStores(String city) async {
    try {
      final stores = await _remoteDataSource.getAllStores(city);
      return Success(stores);
    } catch(e) {
      return CustomError(e);
    }
  }

}
