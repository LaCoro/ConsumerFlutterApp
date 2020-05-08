import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:domain/entities/ciity_entity.dart';
import 'package:domain/result.dart';
import 'package:domain/use_cases/city_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitySelectionBloc extends Bloc<BaseEvent, BaseState> {
  final CityUseCases _cityUseCases;
  final Preferences _preferences;

  CitySelectionBloc(this._cityUseCases, this._preferences);

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is GetAllCitiesEvent) {
        yield* _loadCityList();
      } else if (event is LoadSavedCityEvent) {
        yield* _loadSavedSelectedCity();
      } else if (event is SelectCityEvent) {
        yield SuccessState(data: event.cityEntity);
      }
    } catch (e) {
      yield ErrorState();
    }
  }

  Stream<BaseState> _loadCityList() async* {
    yield LoadingState();
    final result = await _cityUseCases.getAllCities();
    if (result is Success<List<CityEntity>>) {
      yield SuccessState(data: result.data);
    } else {
      yield ErrorState();
    }
  }

  Stream<BaseState> _loadSavedSelectedCity() async* {
    final city = _preferences.getCity();
    if (city != null) {
      yield SuccessState(data: city);
    }
  }
}

/// Events
class GetAllCitiesEvent extends BaseEvent {}

class LoadSavedCityEvent extends BaseEvent {}

class SelectCityEvent extends BaseEvent {
  final CityEntity cityEntity;

  SelectCityEvent(this.cityEntity);
}
