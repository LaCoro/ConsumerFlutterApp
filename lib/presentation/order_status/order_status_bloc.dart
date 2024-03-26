// @dart=2.9
import 'dart:convert';

import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:LaCoro/core/pubnub/pub_nub_manager.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/entities/order_status.dart';
import 'package:domain/result.dart';
import 'package:domain/use_cases/order_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pubnub/pubnub.dart';

class OrderStatusBloc extends Bloc<BaseEvent, BaseState> {

  final Preferences _preferences;
  final OrderUseCases _orderUseCases;

  OrderStatusBloc(this._preferences, this._orderUseCases): super(InitialState());

  Subscription subscription;

  @override
  Future<void> close() {
    subscription?.dispose();
    return super.close();
  }

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is LoadLastOrderEvent) {
        OrderEntity lastOrder = _preferences.getLastOrder();
        if (lastOrder != null) {
          yield LoadingState();
          final result = await _orderUseCases.getOrderById(lastOrder.id);
          if (result is Success<OrderEntity>) {
            if (result.data.orderStatus.index < OrderStatus.ORDER_COMPLETED.index) {
              yield SuccessState(data: result.data);
            } else {
              _preferences.saveLastOrder(null);
              yield SuccessState<OrderEntity>(data:  null);
            }
          } else {
            yield SuccessState<OrderEntity>(data: null);
          }
        }
      }
    } catch (error) {
      yield ErrorState();
    }
  }

  Future subscribeOrderUpdates(OrderEntity order, ValueChanged<OrderEntity> onOrderUpdated) async {
    String storeChannelId = 'store_${order.storeEntity.id}';
    subscription?.dispose();
    subscription = await PubNubManager.initSubscription(storeChannelId);
    subscription.messages.listen((event) {
      try {
        OrderEntity order = OrderEntity.fromJsonMap(json.decode(event.payload));
        _preferences.saveLastOrder(order);
        onOrderUpdated.call(order);
      } catch (e) {
        print(e.toString());
      }
    });
  }

  void disposeOrderUpdates() {
    subscription?.dispose();
  }
}

class LoadLastOrderEvent extends BaseEvent {}

