import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:LaCoro/core/pubnub/pub_nub_manager.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/use_cases/order_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pubnub/pubnub.dart';

class OrderStatusBloc extends Bloc<BaseEvent, BaseState> {

  OrderStatusBloc();

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
      // TODO implement
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
        onOrderUpdated.call(OrderEntity.fromJsonMap(event.payload));
      } catch (e) {
        print(e.toString());
      }
    });
  }

  void disposeOrderUpdates() {
    subscription?.dispose();
  }
}
