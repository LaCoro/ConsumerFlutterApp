import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/result.dart';
import 'package:domain/use_cases/order_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutBloc extends Bloc<BaseEvent, BaseState> {
  final Preferences _preferences;
  final OrderUseCases _useCases;

  CheckoutBloc(this._preferences, this._useCases);

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is SubmitOrderEvent) {
        yield LoadingState();
        final result = await _useCases.submitOrder(event.orderEntity, _preferences.getProfile());
        if (result is Success<OrderEntity>) {
          final placedOrder = result.data
            ..products = event.orderEntity.products
            ..storeEntity = event.orderEntity.storeEntity;
          await _preferences.saveLastOrder(placedOrder);
          yield SuccessState(data: placedOrder);
        } else {
          yield ErrorState(message: "Error creating order");
        }
      }
    } catch (error) {
      yield ErrorState();
    }
  }

  String getUserAddress() => _preferences.getProfile()?.address;
}

/// Events
class SubmitOrderEvent extends BaseEvent {
  final OrderEntity orderEntity;

  SubmitOrderEvent(this.orderEntity);
}
