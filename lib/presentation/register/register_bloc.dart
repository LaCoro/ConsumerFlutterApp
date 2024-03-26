// @dart=2.9
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:domain/result.dart';
import 'package:domain/use_cases/profile_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<BaseEvent, BaseState> {
  final ProfileUseCases _useCases;
  final Preferences _preferences;

  RegisterBloc(this._useCases, this._preferences): super(InitialState());

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is SubmitSaveProfileEvent) {
        yield LoadingState();
        final userEntity = (_preferences.getProfile() ?? UserEntity())
          ..fullname = event.fullName
          ..email = event.email
          ..mobile = event.mobile;
        final result = await _preferences.saveProfile(userEntity);
        if (result) {
          yield SuccessState();
        } else {
          yield ErrorState(message: "Error registering user");
        }
      } else if (event is SubmitRequestVerificationCodeEvent) {
        await _useCases.requestSMSCode(event.mobile);
      } else if (event is AuthenticateUserWithSmsEvent) {
        yield LoadingState();
        final result = await _useCases.authenticateUser(event.smsCode, event.userEntity);
        if (result is Success) {
          await _preferences.saveProfile(_preferences.getProfile()..isValidated = true);
          yield SuccessState();
        } else if (result is Failure) {
          yield ErrorState(message: result.exception.toString());
        } else {
          yield ErrorState();
        }
      }
    } catch (error) {
      yield ErrorState();
    }
  }

  UserEntity getProfileInfo() => _preferences.getProfile();
}

/// Events
class SubmitSaveProfileEvent extends BaseEvent {
  final String fullName;
  final String email;
  final String mobile;

  SubmitSaveProfileEvent({this.fullName, this.email, this.mobile});
}

class SubmitRequestVerificationCodeEvent extends BaseEvent {
  final String mobile;

  SubmitRequestVerificationCodeEvent(this.mobile);
}

class AuthenticateUserWithSmsEvent extends BaseEvent {
  final String smsCode;
  final UserEntity userEntity;

  AuthenticateUserWithSmsEvent(this.smsCode, this.userEntity);
}
