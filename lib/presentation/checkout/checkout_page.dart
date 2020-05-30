import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/enums/payment_type.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/current_address.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/order_sumary.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/payment_method.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/primary_button.dart';
import 'package:LaCoro/presentation/adresses/my_address_page.dart';
import 'package:LaCoro/presentation/order_status/order_status_page.dart';
import 'package:LaCoro/presentation/store_list/store_list_page.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import 'checkout_bloc.dart';

class CheckoutPage extends StatefulWidget {
  static const CHECKOUT_ORDER_ROUTE = '/checkout_order';

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final CheckoutBloc _bloc = Injector.getInjector().get();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    final OrderEntity order = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        backgroundColor: AppColors.itemBackgroundColor,
        appBar: AppBar(elevation: 0),
        body: BlocListener(
            bloc: _bloc,
            listener: (BuildContext context, state) {
              setState(() => isLoading = state is LoadingState);

              if (state is SuccessState<OrderEntity>) {
                Navigator.pushNamedAndRemoveUntil(context, OrderStatusPage.ORDER_STATUS_ROUTE, ModalRoute.withName(StoreListPage.STORE_LIST_ROUTE),
                    arguments: state.data);
              }
            },
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      CurrentAddress(_bloc.getUserAddress(),
                          onEditPressed: () => Navigator.pushNamed(context, MyAddressPage.MY_ADDRESS_ROUTE, arguments: true)),
                      Divider(endIndent: 24, indent: 24, thickness: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: Row(
                          children: <Widget>[
                            Expanded(child: Text(strings.estimatedDelivery, style: AppTextStyle.grey16)),
                            Text("30 min", style: AppTextStyle.grey16)
                          ],
                        ),
                      ),
                      Divider(thickness: 8),
                      PaymentMethod(PaymentType.cash),
                      Divider(thickness: 8),
                      OrderSummary(
                        orderCost: order.getCartTotal(),
                        deliveryCost: order.deliveryCost,
                        comments: order.additionalRequests,
                      ),
                    ],
                  ),
                ),
                PrimaryButton(
                  isLoading: isLoading,
                  onPressed: () => _bloc.add(SubmitOrderEvent(order)),
                  margin: EdgeInsets.symmetric(vertical: 21, horizontal: 24),
                  buttonText: strings.confirm,
                ),
              ],
            )));
  }
}
