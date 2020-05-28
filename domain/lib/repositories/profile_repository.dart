import 'package:domain/entities/user_entity.dart';
import 'package:domain/result.dart';

abstract class ProfileRepository {
  Future<Result> submitUserRegister(UserEntity userEntity);
}
