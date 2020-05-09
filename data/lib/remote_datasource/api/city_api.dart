import 'package:data/models/city.dart';
import 'package:data/remote_datasource/api/parse/api_service.dart';
import 'package:data/remote_datasource/errors/service_error.dart';

/// Class to handle all related to the CityConfiguration API request using the Parse SDK Manager
class CityApi {
  final ApiService apiService;

  CityApi(this.apiService);

  Future<List<City>> getAllCities() async {
    final response = await apiService.getAllCities();
    if (response.success) {
      return response.results.map((e) => e as City).toList();
    } else {
      throw ServiceError();
    }
  }
}
