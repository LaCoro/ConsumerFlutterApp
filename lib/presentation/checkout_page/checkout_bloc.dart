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
        if (result is Success) {
          await _preferences.saveLastOrder(result.data as OrderEntity);
          yield SuccessState(data: event.orderEntity);
        } else {
          yield ErrorState(message: "Error creating order");
        }
      }
    } catch (error) {
      yield ErrorState();
    }
  }

  String getUserAddress() => _preferences.getAddress().getFullAddress();
}

/// Events
class SubmitOrderEvent extends BaseEvent {
  final OrderEntity orderEntity;

  SubmitOrderEvent(this.orderEntity);
}