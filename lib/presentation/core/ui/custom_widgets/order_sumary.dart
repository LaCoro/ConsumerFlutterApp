import 'package:LaCoro/presentation/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class OrderSumary extends StatelessWidget {
  final double orderCost;
  final double deliveryCost;

  const OrderSumary({Key key, this.orderCost, this.deliveryCost = 0})
      : super(key: key);

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
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                strings.order,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Spacer(),
              Text(
                "\$ $orderCost",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 9,bottom: 15),
            child: Row(
              children: <Widget>[
                Text(
                  strings.delivery,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Spacer(),
                Text(
                  "\$ $deliveryCost",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                strings.total,
                style: Theme.of(context).textTheme.headline5,
              ),
              Spacer(), Text(
                "\$ ${orderCost+deliveryCost}",
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),



          /*Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 9),
                      child: Text(
                        "Pedido",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      "Domicilio",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        "Total",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 9),
                    child: Text(
                      "\$ $orderCost",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    "\$ $deliveryCost",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      "\$ ${orderCost+deliveryCost}",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  )
                ],
              ),
            ],
          ),*/
        ],
      ),
    );
  }
}
