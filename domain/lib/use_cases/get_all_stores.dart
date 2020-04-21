import 'package:domain/entities/store_entity.dart';
import 'package:domain/repositories/store_repository.dart';

class GetAllStores {
  final StoreRepository _repository;

  GetAllStores(this._repository);

  Future<List<StoreEntity>> call() async {
    return await _repository.getAllStores();
  }
}
