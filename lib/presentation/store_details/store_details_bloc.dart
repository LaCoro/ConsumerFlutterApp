import 'package:LaCoro/presentation/core/bloc/base_bloc.dart';
import 'package:domain/entities/item_entity.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:domain/use_cases/store_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailsBloc extends Bloc<BaseEvent, BaseState> {
  final StoreUseCases _storeInteractor;

  StoreEntity store;

  OrderEntity orderEntity = OrderEntity();
  Map<ItemEntity, int> products = Map();

  StoreDetailsBloc(this._storeInteractor);

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is GetSortedItemsEvent) {
        yield* loadStoreItems();
      } else if (event is UpdateProduct) {
        products.update(event.product, (value) => event.quantity, ifAbsent: () => 1);
        if (products[event.product] < 1) {
          products.remove(event.product);
        }
      }
    } catch (error) {
      yield ErrorState();
    }
  }

  Stream<BaseState> loadStoreItems() async* {
    yield LoadingState();
    final sortedItems = await store.getSortedItems();
    if (sortedItems != null) {
      yield SuccessState(data: sortedItems);
    } else {
      yield ErrorState();
    }
  }
}

/// Store list events
class GetSortedItemsEvent extends BaseEvent {}

/// Add or remove item to order
class UpdateProduct extends BaseEvent {
  final ItemEntity product;
  final int quantity;

  UpdateProduct(this.product, this.quantity);
}
