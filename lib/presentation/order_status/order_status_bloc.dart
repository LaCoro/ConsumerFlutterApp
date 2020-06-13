import 'dart:convert';

import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:LaCoro/core/pubnub/pub_nub_manager.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/entities/order_status.dart';
import 'package:domain/use_cases/order_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pubnub/pubnub.dart';

class OrderStatusBloc extends Bloc<BaseEvent, BaseState> {
  final Preferences _preferences;
  final OrderUseCases _useCases;

  OrderStatusBloc(this._preferences, this._useCases);

  Subscription subscription;

  @override
  BaseState get initialState => InitialState();

  @override
  Future<void> close() {
    subscription?.dispose();
    return super.close();
  }

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is SubscribeOrderUpdatesEvent) {
        OrderEntity lastOrder = _preferences.getLastOrder();
        if (lastOrder != null && lastOrder.orderStatus.index < OrderStatus.ORDER_COMPLETED.index) {
          yield SuccessState(data: lastOrder);
          String storeChannelId = 'store_${lastOrder.storeEntity.id}';
          subscription = await PubNubManager.initSubscription(storeChannelId);
          yield* subscription.messages.map((event) {
            OrderEntity orderEntity = OrderEntity.fromJsonMap(event.payload);
            if (orderEntity.id == lastOrder.id) {
              return SuccessState(data: orderEntity.orderStatus);
            } else {
              return null;
            }
          });
        }
      }
    } catch (error) {
      yield ErrorState();
    }
  }
}

class SubscribeOrderUpdatesEvent extends BaseEvent {}
