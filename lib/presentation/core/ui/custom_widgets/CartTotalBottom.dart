import 'package:flutter/material.dart';

class CartTotalBottom extends StatelessWidget {

  String quantity = "9";
  String price = "\$111";

  CartTotalBottom(this.quantity, this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFFe0f2f1)),
                  child: Center(child: Text(quantity, textAlign: TextAlign.center, style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold)))),
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
