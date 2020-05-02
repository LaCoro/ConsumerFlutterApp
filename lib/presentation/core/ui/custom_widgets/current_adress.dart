import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentAdress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Direccion de entrega"),
            Row(children: <Widget>[
              Icon(icon)
            ],)

          ],
        ));
  }
}
