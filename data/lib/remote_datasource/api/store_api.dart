import 'package:data/models/store.dart';
import 'package:data/remote_datasource/parse/api_service.dart';
import 'package:domain/entities/store_entity.dart';

/// Class to handle all related to the Store API request using the Parse SDK Manager
/// Reference https://dashboard.back4app.com/apidocs/5IgxoMa1l6QoEJodtOXcQmXCmZF61S4yGbhhXLE5#Store-custom-class
class StoreApi {
  final ApiService apiService;

  StoreApi(this.apiService);

  Future<List<Store>> getAllStores() async {
    final response = await apiService.getAllStores();
    if (response.success) {
      return response.results.map((e) => e as Store).toList();
    } else {
      throw StateError(response.error.message);
    }
  }
}
