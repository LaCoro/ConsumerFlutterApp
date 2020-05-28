import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:LaCoro/core/ui_utils/mappers/item_ui_mapper.dart';
import 'package:LaCoro/core/ui_utils/model/item_ui.dart';
import 'package:LaCoro/core/ui_utils/model/store_ui.dart';
import 'package:domain/entities/item_entity.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/result.dart';
import 'package:domain/use_cases/store_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutBloc extends Bloc<BaseEvent, BaseState> {
  final Preferences _preferences;


  CheckoutBloc(this._preferences);

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    try {
      if(event is SubmitOrderEvent) {
        yield LoadingState();
        await Future.delayed(Duration(seconds: 1));
        yield SuccessState(data: event.orderEntity);
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
