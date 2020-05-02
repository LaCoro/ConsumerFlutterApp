import 'package:LaCoro/presentation/core/bloc/base_bloc.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:domain/use_cases/store_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailsBloc extends Bloc<BaseEvent, BaseState> {
  final StoreUseCases _storeInteractor;

  StoreEntity store;

  StoreDetailsBloc(this._storeInteractor);

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is GetSortedItemsEvent) {
        yield LoadingState();
        final sortedItems = await store.getSortedItems();
        if (sortedItems != null) {
          yield SuccessState(data: sortedItems);
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
class GetSortedItemsEvent extends BaseEvent {}
