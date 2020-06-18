import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/ui_utils/mappers/item_ui_mapper.dart';
import 'package:domain/entities/item_entity.dart';
import 'package:domain/result.dart';
import 'package:domain/use_cases/order_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PastOrderDetailsBloc extends Bloc<BaseEvent, BaseState> {
  final OrderUseCases _orderUseCases;

  PastOrderDetailsBloc(this._orderUseCases);

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is GetOrderProductList) {
        final result = await _orderUseCases.getOrderProducts(event.orderId);
        if (result is Success<Map<ItemEntity, int>>) {
          final items = result.data.map((key, value) => MapEntry(ItemUIMapper().processSingleElement(key), value));
          yield SuccessState(data: items);
        }
      }
    } catch (error) {
      yield ErrorState();
    }
  }
}

/// Events
class GetOrderProductList extends BaseEvent {
  final String orderId;

  GetOrderProductList(this.orderId);
}
