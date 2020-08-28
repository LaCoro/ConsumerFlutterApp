import 'package:data/remote_datasource/api/profile_api.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:domain/repositories/profile_repository.dart';
import 'package:domain/result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileApi _remoteDataSource;
  bool userPhoneVerified = false;
  String verificationId = '';

  ProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result> submitUserRegister(UserEntity userEntity) async {
    try {
      final userId = await _remoteDataSource.submitUserRegister(userEntity);
      return Success(userId);
    } catch (e) {
      return Failure(exception: e);
    }
  }

  @override
  Future<Result> getValidSession(String sessionToken) async {
    try {
      final currentUserId = await _remoteDataSource.getCurrentUserId(sessionToken);
      return Success(currentUserId != null);
    } catch (e) {
      return Failure(exception: e);
    }
  }

  @override
  Future<Result> authenticateUser(String smsCode) async {
    if (userPhoneVerified) return Success(true);

    FirebaseAuth _auth = FirebaseAuth.instance;

    AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

    final result = await _auth.signInWithCredential(credential);

    if (result.user != null) {
      return Success(true);
    }
    return Failure();
  }

  @override
  Future requestSMSCode(String mobile) async {
    userPhoneVerified = false;
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.verifyPhoneNumber(
      phoneNumber: mobile,
      timeout: Duration(seconds: 30),
      verificationCompleted: (AuthCredential authCredential) {
        _auth.signInWithCredential(authCredential).then((UserCredential credential) {
          userPhoneVerified = true;
        });
      },
      verificationFailed: (FirebaseAuthException authException) {
        print(authException.message);
      },
      codeSent: (String id, [int forceResendingToken]) {
        this.verificationId = id;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId = verificationId;
      },
    );
  }
}
