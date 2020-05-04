import 'package:LaCoro/presentation/core/localisation/app_localizations.dart';
import 'package:flutter/material.dart';

class CartTotalBottom extends StatelessWidget {
  int quantity = 0;
  String price = "\$111";

  CartTotalBottom(this.quantity, this.price);

  @override
  Widget build(BuildContext context) {

    final strings = AppLocalizations.of(context);

    return Container(
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
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
                      child: Text( (quantity<10) ? quantity.toString() : "+9"  , textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).accentColor, fontSize: 18, fontWeight: FontWeight.bold)))),
            ),
            Expanded(
              flex: 2,
              child: Text(strings.seeOrder, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child:Text(price, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)) ,
            ),
          ],
        ),
      ),
    );
  }
}
