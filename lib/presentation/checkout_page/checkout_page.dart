import 'package:LaCoro/presentation/core/localization/app_localizations.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/current_adress.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/order_sumary.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/payment_method.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  static const CHECKOUT_ORDER_ROUTE = '/checkout_order';

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        //
        title: Text("data"), //
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height-170,
            width: MediaQuery.of(context).size.width,

            child: ListView(
              children: <Widget>[
                CurrentAdress("Cr 56 # 13 - 168 Florida, Miami, Cr 56 # 13 - 168 Florida, Miami"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Divider(
                    thickness: 1,
                    height: 0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text("Entrega estimada",
                                style: Theme.of(context).textTheme.bodyText1)),
                        Text("30 min", style: Theme.of(context).textTheme.bodyText1)
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 10,
                  height: 10,
                  //color: Theme.of(context).backgroundColor,
                  color: Colors.grey,
                ),
                PaymentMethod(PaymentType.cash),
                Divider(
                  thickness: 10,
                  height: 10,
                  //color: Theme.of(context).backgroundColor,
                  color: Colors.grey,
                ),SingleChildScrollView(
                  child: OrderSumary(orderCost: 21000,deliveryCost: 3000,),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 21, horizontal: 24),
            child: FlatButton(
              onPressed: () {
              },
              child: Center(
                  child: Text(
                    strings.continu,
                    style: Theme.of(context).textTheme.button,
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
