import 'package:data/models/store.dart';
import 'package:data/remote_datasource/api/parse/api_service.dart';
import 'package:data/remote_datasource/errors/service_error.dart';

/// Class to handle all related to the Store API request using the Parse SDK Manager
class StoreApi {
  final ApiService apiService;

  StoreApi(this.apiService);

  Future<List<Store>> getAllStores(String city) async {
    final response = await apiService.getAllStores();
    if (response.success) {
      return response.results.map((e) => e as Store).toList();
    } else {
      throw ServiceError();
    }
  }
}
