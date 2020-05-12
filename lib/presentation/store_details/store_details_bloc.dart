import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/ui_utils/model/item_ui.dart';
import 'package:LaCoro/core/ui_utils/model/store_ui.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/entities/item_entity.dart';
import 'package:domain/result.dart';
import 'package:domain/use_cases/store_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailsBloc extends Bloc<BaseEvent, BaseState> {
  final StoreUseCases _storeUseCases;

  StoreUI store;

  Map<ItemUI, int> products = Map();

  StoreDetailsBloc(this._storeUseCases);

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
        yield CartChangedSate(quantity: _getProductsQuantity(), cartTotal: _getCartTotal(), products:  products);
      }
    } catch (error) {
      yield ErrorState();
    }
  }

  Stream<BaseState> loadStoreItems() async* {
    yield LoadingState();
    final result = await _storeUseCases.getStoreItems(store.id);
    if (result is Success<Map<ItemUI, List<ItemUI>>>) {
      yield SuccessState(data: result.data);
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

class NavigateToOrderDetails extends BaseEvent {}

class UpdateProductEvent extends BaseEvent {
  final ItemUI product;
  final int quantity;

  UpdateProductEvent(this.product, this.quantity);
}

/// States
class CartChangedSate extends BaseState {
  final int quantity;
  final double cartTotal;
  final Map<ItemEntity, int> products;

  CartChangedSate({this.quantity, this.cartTotal, this.products}) : super([quantity, cartTotal, products]);
}
