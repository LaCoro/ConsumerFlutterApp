import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:domain/entities/address_entity.dart';
import 'package:domain/entities/ciity_entity.dart';
import 'package:domain/result.dart';
import 'package:domain/use_cases/my_address_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAddressBloc extends Bloc<BaseEvent, BaseState> {
  final MyAddressUseCases _cityUseCases;
  final Preferences _preferences;

  MyAddressBloc(this._cityUseCases, this._preferences);

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is GetAllCitiesEvent) {
        yield LoadingState();
        final result = await _cityUseCases.getAllCities();
        if (result is Success<List<CityEntity>>) {
          yield SuccessState(data: result.data);
        } else {
          yield ErrorState();
        }
      } else if (event is SubmitAddressSelected) {
        await _preferences.saveAddress(event.addressEntity);
      }
    } catch (e) {
      yield ErrorState();
    }
  }

  AddressEntity loadSavedAddress() {
    return _preferences.getAddress();
  }

  Future<void> submitAddressSelected(AddressEntity addressEntity) async {
    await _preferences.saveAddress(addressEntity);
  }
}

/// Events
class GetAllCitiesEvent extends BaseEvent {}

class SubmitAddressSelected extends BaseEvent {
  final AddressEntity addressEntity;

  SubmitAddressSelected(this.addressEntity);
}
