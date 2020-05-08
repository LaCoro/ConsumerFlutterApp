import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:domain/entities/ciity_entity.dart';
import 'package:domain/result.dart';
import 'package:domain/use_cases/city_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitySelectionBloc extends Bloc<BaseEvent, BaseState> {
  final CityUseCases _cityUseCases;

  CitySelectionBloc(this._cityUseCases);

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is GetAllCitiesEvent) {
      yield LoadingState();
      final result = await _cityUseCases.getAllCities();
      if (result is Success<List<CityEntity>>) {
        yield SuccessState(data: result.data);
      } else {
        yield ErrorState();
      }
    }
  }
}

/// Events
class GetAllCitiesEvent extends BaseEvent {}
