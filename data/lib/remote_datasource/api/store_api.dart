import 'package:data/remote_datasource/parse/api_service_impl.dart';
import 'package:data/remote_datasource/parse/api_service.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

/// Class to handle all related to the Store API request using the Parse SDK Manager
/// Reference https://dashboard.back4app.com/apidocs/5IgxoMa1l6QoEJodtOXcQmXCmZF61S4yGbhhXLE5#Store-custom-class
class StoreApi {

  final ApiService apiService = ApiServiceImpl();

  Future<List<String>> getAllStores() async {
    final response = await apiService.getAllStores();

    return response.results.map((e) => e.get("name") as String).toList();
  }

}
