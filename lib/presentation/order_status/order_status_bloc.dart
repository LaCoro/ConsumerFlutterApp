import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/use_cases/order_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pubnub/pubnub.dart';

class OrderStatusBloc extends Bloc<BaseEvent, BaseState> {
  final Preferences _preferences;
  final OrderUseCases _useCases;

  OrderStatusBloc(this._preferences, this._useCases);

  Subscription subscription;

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if (event is SubscribeOrderUpdatesEvent) {
        await _initOrderSubscription('ch_${getLastOrder().id}');
        yield* subscription.messages.map((event) => SuccessState(data: event.payload.toString()));
      }
    } catch (error) {
      yield ErrorState();
    }
  }

  OrderEntity getLastOrder() => _preferences.getLastOrder();

  Future _initOrderSubscription(String channelId) async {
    final pubnub = PubNub(
      defaultKeyset: Keyset(
        subscribeKey: DotEnv().env['PUBNUB_SUBSCRIBE_KEY'],
        publishKey: DotEnv().env['PUBNUB_PUBLISH_KEY'],
      ),
    );

    // Subscribe to order channel
    subscription = await pubnub.subscribe(channels: {channelId});
  }

  @override
  Future<void> close() {
    subscription?.dispose();
    return super.close();
  }
}

class SubscribeOrderUpdatesEvent extends BaseEvent {}
