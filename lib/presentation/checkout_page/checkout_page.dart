import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/enums/payment_type.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/current_adress.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/order_sumary.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/payment_method.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  static const CHECKOUT_ORDER_ROUTE = '/checkout_order';

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.itemBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text("data"), //
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 170,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                CurrentAdress("Cr 56 # 13 - 168 Florida, Miami, Cr 56 # 13 - 168 Florida, Miami"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Divider(
                    thickness: 1,
                    height: 0,
                    color: AppColors.divider,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 14, bottom: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text(strings.estimatedDelivery, style: Theme.of(context).textTheme.headline5)),
                        Text("30 min", style: Theme.of(context).textTheme.headline5)
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 10,
                  height: 10,
                  color: Theme.of(context).dividerColor,
                ),
                PaymentMethod(PaymentType.cash),
                Divider(
                  thickness: 10,
                  height: 10,
                  color: Theme.of(context).dividerColor,
                ),
                SingleChildScrollView(
                  child: OrderSumary(
                    orderCost: 21000,
                    deliveryCost: 3000,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 21, horizontal: 24),
            child: FlatButton(
              onPressed: () {},
              child: Center(
                  child: Text(
                strings.continu,
                style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.white),
              )),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }
}
