// @dart=2.9
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/result.dart';
import 'package:domain/use_cases/order_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHistoryBloc extends Bloc<BaseEvent, BaseState> {
  final OrderUseCases _useCases;
  final Preferences _preferences;

  OrderHistoryBloc(this._useCases, this._preferences): super(InitialState());

  int _page = 0;

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is GetOrdersEvent) {
        yield LoadingState();
        _page = 0;
        final result = await _useCases.getUserOrders(_page);
        if (result is Success<List<OrderEntity>>) {
          yield SuccessState(data: result.data);
        } else {
          yield ErrorState();
        }
      } else if (event is LoadMoreOrdersEvent) {
        yield LoadingState();
        _page = _page + 1;
        final result = await _useCases.getUserOrders(_page);
        if (result is Success<List<OrderEntity>>) {
          yield MoreOrdersLoadedState(data: result.data);
        } else {
          yield ErrorState();
        }
      }
    } catch (error) {
      yield ErrorState();
    }
  }
}

/// store list events
class GetOrdersEvent extends BaseEvent {}

class LoadMoreOrdersEvent extends BaseEvent {}

/// states
class MoreOrdersLoadedState extends BaseState {
  final List<OrderEntity> data;

  MoreOrdersLoadedState({this.data}) : super([data]);
}
