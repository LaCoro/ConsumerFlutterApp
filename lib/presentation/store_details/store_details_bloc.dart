import 'package:LaCoro/core/bloc/base_bloc.dart';
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
      } else if (event is UpdateProductEvent) {
        products.update(event.product, (value) => event.quantity, ifAbsent: () => 1);
        if (products[event.product] < 1) {
          products.remove(event.product);
        }
        yield OrderChangedSate(quantity: _getProductsQuantity(), cartTotal: _getCartTotal());
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

  int _getProductsQuantity() {
    return products.isEmpty ? 0 : products.values.reduce((a, b) => a + b);
  }

  double _getCartTotal() {
    return products.isEmpty ? 0 : products.entries.map((entry) => (entry.key.price * entry.value.toDouble())).reduce((a, b) => a + b);
  }
}

/// Events
class GetSortedItemsEvent extends BaseEvent {}

class UpdateProductEvent extends BaseEvent {
  final ItemEntity product;
  final int quantity;

  UpdateProductEvent(this.product, this.quantity);
}

/// States
class OrderChangedSate extends BaseState {
  final int quantity;
  final double cartTotal;

  OrderChangedSate({this.quantity, this.cartTotal}) : super([quantity, cartTotal]);
}
