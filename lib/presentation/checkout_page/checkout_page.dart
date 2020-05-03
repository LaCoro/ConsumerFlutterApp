import 'package:LaCoro/presentation/core/ui/custom_widgets/current_adress.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/payment_method.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  static const CHECKOUT_ORDER_ROUTE = '/checkout_order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(          //
        title: Text("data"),  //
      ),
      body: Column(
        children: <Widget>[
          CurrentAdress("Cr 56 # 13 - 168 Florida, Miami"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
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
            color: Theme.of(context).backgroundColor,
          ),
          PaymentMethod(PaymentType.cash)
        ],
      ),
    );
  }
}
