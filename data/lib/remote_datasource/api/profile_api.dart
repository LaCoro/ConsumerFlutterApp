// @dart=2.9
import 'package:data/remote_datasource/api/parse/api_service.dart';
import 'package:data/remote_datasource/errors/service_error.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

/// Class to handle all related to the Store API request using the Parse SDK Manager
class ProfileApi {
  final ApiService apiService;

  ProfileApi(this.apiService);

  Future<String> submitUserRegister(UserEntity userEntity) async {
    final response = await apiService.submitUserRegister(userEntity);
    if (response.success && response.count > 0) {
      return (response.result as ParseUser).objectId;
    } else {
      throw ServiceError();
    }
  }

  Future<String> getCurrentUserId(String sessionToken) async {
    final parseUser = await apiService.getCurrentUser(sessionToken);
    return parseUser?.objectId;
  }
}
