import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:LaCoro/core/extensions/number_extensions.dart';

class OrderSummary extends StatelessWidget {
  final double orderCost;
  final int deliveryCost;
  final String comments;

  OrderSummary({required this.orderCost, this.deliveryCost = 0, this.comments = ''});

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
              style: AppTextStyle.section,
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                strings.order,
                style: AppTextStyle.grey16,
              ),
              Spacer(),
              Text(
                orderCost.currencyFormat(),
                style: AppTextStyle.grey16,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 9, bottom: 15),
            child: Row(
              children: <Widget>[
                Text(
                  strings.delivery,
                  style: AppTextStyle.grey16,
                ),
                Spacer(),
                Text(
                  deliveryCost.currencyFormat(),
                  style: AppTextStyle.grey16,
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                strings.total,
                style: AppTextStyle.w500Black16,
              ),
              Spacer(),
              Text(
                (orderCost + deliveryCost).currencyFormat(),
                style: AppTextStyle.w500Black16,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 48.0),
//            TODO add el comentario en un TextField con enabled=false, no editable
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
