import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:domain/use_cases/profile_use_cases.dart';
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
        // todo remove this and implement API request to register user here
        await Future.delayed(Duration(seconds: 2));
        _preferences.saveProfile(event.userEntity);
        yield SuccessState();
      }
    } catch (error) {
      yield ErrorState();
    }
  }
}

/// Events
class SubmitSaveProfileEvent extends BaseEvent {
  final UserEntity userEntity;

  SubmitSaveProfileEvent(this.userEntity);
}
