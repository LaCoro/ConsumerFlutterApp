import 'package:data/models/user.dart';
import 'package:data/remote_datasource/api/parse/api_service.dart';
import 'package:data/remote_datasource/errors/service_error.dart';
import 'package:domain/entities/user_entity.dart';

/// Class to handle all related to the Store API request using the Parse SDK Manager
class ProfileApi {
  final ApiService apiService;

  ProfileApi(this.apiService);

  Future<String> submitUserRegister(UserEntity userEntity) async {
    final user = User().fromJson(UserEntity.toJsonObject(userEntity));
    final response = await apiService.submitUserRegister(user);
    if (response.success && response.count > 0) {
      return (response.result as User).id;
    } else {
      throw ServiceError();
    }
  }
}
