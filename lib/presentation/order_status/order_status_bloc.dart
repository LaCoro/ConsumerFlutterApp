import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/use_cases/order_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderStatusBloc extends Bloc<BaseEvent, BaseState> {
  final Preferences _preferences;
  final OrderUseCases _useCases;

  OrderStatusBloc(this._preferences, this._useCases);

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      // TODO implement logic here
    } catch (error) {
      yield ErrorState();
    }
  }

  OrderEntity getLastOrder() => _preferences.getLastOrder();
}
