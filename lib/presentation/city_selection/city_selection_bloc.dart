import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:domain/entities/ciity_entity.dart';
import 'package:domain/result.dart';
import 'package:domain/use_cases/city_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitySelectionBloc extends Bloc<CitySelectionEvents, BaseState> {
  final CityUseCases _cityUseCases;
  final Preferences _preferences;

  CitySelectionBloc(this._cityUseCases, this._preferences);

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(CitySelectionEvents event) async* {
    switch (event) {
      case CitySelectionEvents.getAllCities:
        yield* _loadCityList();
        break;
      case CitySelectionEvents.loadCurrentCity:
        yield* _loadSavedSelectedCity();
        break;
    }
  }

  Stream _loadCityList() async* {
    yield LoadingState();
    final result = await _cityUseCases.getAllCities();
    if (result is Success<List<CityEntity>>) {
      yield SuccessState(data: result.data);
    } else {
      yield ErrorState();
    }
  }

  Stream _loadSavedSelectedCity() async* {
    final city = _preferences.getCity();
    if (city != null) {
      yield SuccessState(data: city);
    }
  }
}

/// Events
enum CitySelectionEvents { getAllCities, loadCurrentCity }
