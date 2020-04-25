import 'package:flutter/material.dart';

class CartTotalBottom extends StatelessWidget {
  String quantity = "9";
  String price = "\$111";

  CartTotalBottom(this.quantity, this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
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
                      child: Text(quantity, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).accentColor, fontSize: 20, fontWeight: FontWeight.bold)))),
            ),
            Expanded(
              flex: 2,
              child: Text("Ver pedido", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: Text(price, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
