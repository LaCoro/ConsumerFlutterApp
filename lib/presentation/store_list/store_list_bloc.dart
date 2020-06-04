import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:LaCoro/core/ui_utils/mappers/store_ui_mapper.dart';
import 'package:LaCoro/core/ui_utils/model/store_ui.dart';
import 'package:domain/entities/address_entity.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:domain/result.dart';
import 'package:domain/use_cases/profile_use_cases.dart';
import 'package:domain/use_cases/store_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreListBloc extends Bloc<BaseEvent, BaseState> {
  final StoreUseCases _storeUseCases;
  final ProfileUseCases _profileUseCases;
  final Preferences _preferences;
  int _page = 0;

  StoreListBloc(this._storeUseCases, this._profileUseCases, this._preferences);

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is GetStoresEvent) {
        yield LoadingState();
        _page = 0;
        final result = await _storeUseCases.fetchStores(_preferences.getProfile()?.addressEntity?.cityEntity, searchQuery: event.searchQuery);
        if (result is Success<List<StoreEntity>>) {
          yield SuccessState(data: StoreUIMapper().processList(result.data));
        } else {
          yield ErrorState();
        }
      } else if (event is LoadMoreStoresEvent) {
        yield LoadingState();
        _page = _page + 1;
        final result = await _storeUseCases.fetchStores(_preferences.getProfile()?.addressEntity?.cityEntity, page: _page, searchQuery: event.searchQuery);
        if (result is Success<List<StoreEntity>>) {
          yield MoreStoresLoadedState(data: StoreUIMapper().processList(result.data));
        } else {
          yield ErrorState();
        }
      }
    } catch (error) {
      yield ErrorState();
    }
  }

  AddressEntity loadSavedAddress() => _preferences.getProfile()?.addressEntity;

  OrderEntity getLastOrder() => _preferences.getLastOrder();

  Future<bool> isUserValidated() async {
    final result = await _profileUseCases.getValidSession(_preferences.getProfile());
    return _preferences.getProfile()?.isValidated == true && (result is Success) && result.data == true;
  }
}

/// store list events
class GetStoresEvent extends BaseEvent {
  final String searchQuery;

  GetStoresEvent({this.searchQuery});
}

class LoadMoreStoresEvent extends BaseEvent {
  final String searchQuery;

  LoadMoreStoresEvent({this.searchQuery});
}

/// states
class MoreStoresLoadedState extends BaseState {
  final List<StoreUI> data;

  MoreStoresLoadedState({this.data}) : super([data]);
}
