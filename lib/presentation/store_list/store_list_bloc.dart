import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:LaCoro/core/ui_utils/mappers/store_ui_mapper.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:domain/result.dart';
import 'package:domain/use_cases/store_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreListBloc extends Bloc<BaseEvent, BaseState> {
  final StoreUseCases _getAllStores;
  final Preferences _preferences;

  StoreListBloc(this._getAllStores, this._preferences);

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is GetAllStoresEvent) {
        yield LoadingState();
        final result = await _getAllStores.getAllStoresByCity(_preferences.getCity());
        if (result is Success<List<StoreEntity>>) {
          yield SuccessState(data: StoreUIMapper().processList(result.data));
        } else {
          yield ErrorState();
        }
      }
    } catch (error) {
      yield ErrorState();
    }
  }
}

/// Store list events
class GetAllStoresEvent extends BaseEvent {}
