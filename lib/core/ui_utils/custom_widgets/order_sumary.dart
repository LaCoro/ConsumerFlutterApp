import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:LaCoro/core/extensions/number_extensions.dart';

class OrderSumary extends StatelessWidget {
  final double orderCost;
  final int deliveryCost;
  final String comments;

  const OrderSumary({Key key, this.orderCost, this.deliveryCost = 0, this.comments = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(
              strings.summary,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                strings.order,
                style: Theme.of(context).textTheme.headline5,
              ),
              Spacer(),
              Text(
                orderCost.currencyFormat(),
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 9, bottom: 15),
            child: Row(
              children: <Widget>[
                Text(
                  strings.delivery,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Spacer(),
                Text(
                  deliveryCost.currencyFormat(),
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                strings.total,
                style: Theme.of(context).textTheme.headline1,
              ),
              Spacer(),
              Text(
                (orderCost + deliveryCost).currencyFormat(),
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: Text(
              comments,
              style: AppTextStyle.grey16.copyWith(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
