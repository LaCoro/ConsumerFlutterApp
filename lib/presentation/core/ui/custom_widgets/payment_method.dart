import 'package:LaCoro/presentation/core/enums/payment_type.dart';
import 'package:LaCoro/presentation/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

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
                      "${getPaymentName(context, pay)}",
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
}
