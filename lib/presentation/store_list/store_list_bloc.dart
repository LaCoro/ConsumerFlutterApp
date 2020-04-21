import 'package:domain/entities/store_entity.dart';
import 'package:domain/use_cases/get_all_stores.dart';

// TODO refactor to use BloC library (events/states)
class StoreListBloc {
  final GetAllStores _getAllStores;

  StoreListBloc(this._getAllStores);

  Future<List<StoreEntity>> getAllStores() async {
    return await _getAllStores.call()..shuffle();
  }
}
