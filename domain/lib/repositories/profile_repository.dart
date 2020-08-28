import 'package:domain/entities/user_entity.dart';
import 'package:domain/result.dart';

abstract class ProfileRepository {
  Future<Result> getValidSession(String sessionToken);

  Future<Result> authenticateUser(String smsCode, UserEntity userEntity);

  Future requestSMSCode(String mobile);
}
