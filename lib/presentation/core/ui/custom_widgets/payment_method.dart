import 'package:LaCoro/presentation/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

enum PaymentType { cash, credit, debit }

class PaymentMethod extends StatelessWidget {
  final PaymentType pay;

  PaymentMethod(this.pay);

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(strings.paymentMethod,
          style: Theme.of(context).textTheme.headline5,),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: buildPaymentIcon(pay),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 24),
                    child: Text(
                      "${getPaymentName(pay, context)}",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                Align(
                    child: Text(
                  strings.change,
                  style: Theme.of(context).textTheme.headline6,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }

  String getPaymentName(PaymentType paymentType, BuildContext context ) {
    final strings = AppLocalizations.of(context);


    switch (paymentType) {
      case PaymentType.cash:
        return strings.cash;
      case PaymentType.credit:
        return "Tarjeta de Crédito";
      case PaymentType.debit:
        return "Tarjeta de Débito";
    }
    return "";
  }

  Widget buildPaymentIcon(PaymentType paymentType) {
    switch (paymentType) {
      case PaymentType.cash:
        return Icon(Icons.local_atm, color: Colors.black, size: 30);
      case PaymentType.credit:
        return Icon(Icons.credit_card, color: Colors.black, size: 30);
      case PaymentType.debit:
        return Icon(Icons.credit_card, color: Colors.black, size: 30);
    }
  }
}
