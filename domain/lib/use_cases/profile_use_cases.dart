import 'package:domain/entities/user_entity.dart';
import 'package:domain/repositories/profile_repository.dart';

import '../result.dart';

class ProfileUseCases {
  final ProfileRepository _repository;

  ProfileUseCases(this._repository);

  Future<Result> submitUserRegister(UserEntity userEntity) async {
    return _repository.submitUserRegister(userEntity);
  }

  Future<Result> getValidSession(UserEntity userEntity) async {
    return _repository.getValidSession(userEntity?.sessionToken ?? '');
  }
}
