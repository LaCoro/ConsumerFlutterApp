import 'package:LaCoro/presentation/core/bloc/base_bloc.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailsBloc extends Bloc<BaseEvent, BaseState> {
  StoreEntity store;

  StoreDetailsBloc();

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is GetSortedItemsEvent) {
        yield LoadingState();
        final sortedItems = await store.getSortedItems();
        yield SuccessState(data: sortedItems);
      } else {
        yield ErrorState();
      }
    } catch (error) {
      yield ErrorState();
    }
  }

  void setStore(StoreEntity store) {
    this.store = store;
  }
}

/// Store list events
class GetSortedItemsEvent extends BaseEvent {}
