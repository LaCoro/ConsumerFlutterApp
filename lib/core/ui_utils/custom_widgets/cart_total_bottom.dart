import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartTotalBottom extends StatelessWidget {
  int quantity = 0;
  double price = 0.0;

  CartTotalBottom(this.quantity, this.price);

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      color: quantity == 0 ? Theme.of(context).disabledColor : Theme.of(context).accentColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Center(
                      child: Text((quantity < 10) ? quantity.toString() : "+9",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.boldBlack16.copyWith(color: quantity == 0 ? Theme.of(context).disabledColor : Theme.of(context).accentColor)))),
            ),
            Expanded(
              flex: 2,
              child: Text(strings.seeOrder, textAlign: TextAlign.center, style: AppTextStyle.boldBlack16.copyWith(color: Colors.white)),
            ),
            Expanded(
              child: Text(NumberFormat.simpleCurrency(decimalDigits: 0).format(price),
                  textAlign: TextAlign.center, style: AppTextStyle.boldBlack16.copyWith(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
