// @dart=2.9
import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/order_card_info.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/stepper_bar.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/successful_order_banner.dart';
import 'package:LaCoro/presentation/order_status/order_status_bloc.dart';
import 'package:LaCoro/presentation/past_order_detail/past_order_detail_page.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/entities/order_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class OrderStatusPage extends StatefulWidget {
  static const ORDER_STATUS_ROUTE = '/order_status';

  @override
  _OrderStatusPageState createState() => _OrderStatusPageState(Injector().get());
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  final OrderStatusBloc _bloc;

  _OrderStatusPageState(this._bloc);

  OrderEntity currentOrder;

  @override
  void initState() {
    _bloc.add(LoadLastOrderEvent());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.itemBackgroundColor,
      appBar: AppBar(
          title: Text("Order status", style: AppTextStyle.section),
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close)),
          elevation: 0),
      body: BlocListener(
        bloc: _bloc,
        listenWhen: (p, c) => true,
        listener: (BuildContext context, state) {
          if (state is SuccessState<OrderEntity>) {
            setLastOrderInfo(state.data);
          }
        },
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: currentOrder == null
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SuccessfulOrderBanner(),
                    StepperBar(currentOrder.orderStatus.index + 1, 3, strings.getText(currentOrder.orderStatus.value)),
                    Divider(thickness: 8, height: 8),
                    InkWell(
                        onTap: () => Navigator.pushNamed(context, PastOrderDetailPage.PAST_ORDER_DETAIL_ROUTE, arguments: currentOrder),
                        child: OrderCardInfo(orderEntity: currentOrder)),
                    Divider(thickness: 8, height: 8),
                    SizedBox(height: 24.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(strings.deliveryAddress, style: AppTextStyle.grey16),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(currentOrder.deliveryAddress ?? '', style: AppTextStyle.boldBlack16),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  void setLastOrderInfo(OrderEntity order) {
    if (order != null && (order.orderStatus.value == OrderStatus.ORDER_PLACED.value || order.orderStatus.value == OrderStatus.ORDER_IN_PROGRESS.value)) {
      setState(() => currentOrder = order);
      _bloc.subscribeOrderUpdates(order, (order) {
        OrderEntity updatedOrder = OrderEntity.fromOrder(currentOrder..orderStatus = order.orderStatus);
        setState(() => currentOrder = updatedOrder);
      });
    } else {
      _bloc.disposeOrderUpdates();
      setState(() => currentOrder = null);
    }
  }
}
