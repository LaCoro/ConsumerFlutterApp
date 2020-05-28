import 'package:data/remote_datasource/api/profile_api.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:domain/repositories/profile_repository.dart';
import 'package:domain/result.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileApi _remoteDataSource;

  ProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result> submitUserRegister(UserEntity userEntity) async {
    try {
      final userId = await _remoteDataSource.submitUserRegister(userEntity);
      return Success(userId);
    } catch (e) {
      return Failure(e);
    }
  }
}
