import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:domain/result.dart';
import 'package:domain/use_cases/profile_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<BaseEvent, BaseState> {
  final ProfileUseCases _useCases;
  final Preferences _preferences;

  RegisterBloc(this._useCases, this._preferences);

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is SubmitSaveProfileEvent) {
        yield LoadingState();
        final userEntity = (_preferences.getProfile() ?? UserEntity())
          ..fullname = event.fullname
          ..email = event.email
          ..mobile = event.mobile;
        final result = await _useCases.submitUserRegister(userEntity);
        if (result is Success<String>) {
          await _preferences.saveProfile(userEntity..id = result.data);
          yield SuccessState();
        } else {
          yield ErrorState(message: "Error registering user");
        }
      } else if (event is SubmitVerificationCodeEvent) {
        yield LoadingState();
        // todo remove this and implement API request to register user here
        await Future.delayed(Duration(seconds: 1));
        if (event.code == "12345") {
          await _preferences.saveProfile(_preferences.getProfile()..isValidated = true);
          yield SuccessState();
        } else {
          yield ErrorState(message: "Wrong code");
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
  final String fullname;
  final String email;
  final String mobile;

  SubmitSaveProfileEvent({this.fullname, this.email, this.mobile});
}

class SubmitVerificationCodeEvent extends BaseEvent {
  final String code;

  SubmitVerificationCodeEvent(this.code);
}
