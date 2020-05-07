import 'package:data/models/city.dart';
import 'package:data/remote_datasource/api/parse/api_service.dart';
import 'package:data/remote_datasource/errors/service_error.dart';
import 'package:domain/entities/ciity_entity.dart';

/// Class to handle all related to the CityConfiguration API request using the Parse SDK Manager
class CityApi {
  final ApiService apiService;

  CityApi(this.apiService);

  Future<List<City>> getAllCities(String city) async {
    final response = await apiService.getAllCities();
    if (response.success) {
      return response.results.map((e) => e as CityEntity).toList();
    } else {
      throw ServiceError();
    }
  }
}
