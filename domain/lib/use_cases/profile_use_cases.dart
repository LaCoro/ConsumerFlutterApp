import 'package:domain/entities/user_entity.dart';
import 'package:domain/repositories/profile_repository.dart';

import '../result.dart';

class ProfileUseCases {
  final ProfileRepository _repository;

  ProfileUseCases(this._repository);

  Future<Result> getValidSession(UserEntity userEntity) async {
    return _repository.getValidSession(userEntity?.sessionToken ?? '');
  }

  Future<Result> authenticateUser(String smsCode, UserEntity userEntity) {
    return _repository.authenticateUser(smsCode, userEntity);
  }

  Future requestSMSCode(String mobile) {
    return _repository.requestSMSCode(mobile);
  }
}
