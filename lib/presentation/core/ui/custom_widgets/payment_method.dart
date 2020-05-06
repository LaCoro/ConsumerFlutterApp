import 'package:LaCoro/presentation/core/enums/payment_type.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  final PaymentType pay;

  PaymentMethod(this.pay);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Método de pago",
          style: Theme.of(context).textTheme.headline5,),
          Padding(
            padding: const EdgeInsets.only(top: 24),
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
                      "${getPaymentName(pay)}",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                Align(
                    child: Text(
                  "Cambiar",
                  style: Theme.of(context).textTheme.headline6,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }

  String getPaymentName(PaymentType paymentType) {
    switch (paymentType) {
      case PaymentType.cash:
        return "Efectivo";
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
        return Icon(Icons.local_atm, color: Colors.black, size: 40);
      case PaymentType.credit:
        return Icon(Icons.credit_card, color: Colors.black, size: 40);
      case PaymentType.debit:
        return Icon(Icons.credit_card, color: Colors.black, size: 40);
    }
  }
}
