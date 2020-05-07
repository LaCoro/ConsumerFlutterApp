import 'package:LaCoro/presentation/core/bloc/base_bloc.dart';
import 'package:LaCoro/presentation/core/ui/mappers/StoreItemMapper.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:domain/result.dart';
import 'package:domain/use_cases/store_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreListBloc extends Bloc<BaseEvent, BaseState> {
  final StoreUseCases _getAllStores;
  final StoreItemMapper mapper = StoreItemMapper();

  StoreListBloc(this._getAllStores);

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is GetAllStoresEvent) {
        yield LoadingState();
        final result = await _getAllStores.getAllStoresByCity(event.city);
        if (result is Success<List<StoreEntity>>) {
          yield SuccessState(data: mapper.process(result.data));
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
class GetAllStoresEvent extends BaseEvent {
  final String city;

  GetAllStoresEvent(this.city);
}
