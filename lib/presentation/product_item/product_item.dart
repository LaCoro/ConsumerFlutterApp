import 'package:LaCoro/presentation/core/ui/app_theme.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/counter.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/discount_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Arepa sencilla",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                  Text("Carne, pollo y queso",
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: graySubtitle)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("\$8.000",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                        Text("\$16.000",
                            style: TextStyle(fontSize: 20, color: graySubtitle, decoration: TextDecoration.lineThrough)),
                        DiscountChip(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network("https://www.liberaldictionary.com/wp-content/uploads/2018/11/pizza.jpg", height: 100, width: 100, fit: BoxFit.fill),
                ),
              ),
              Counter(),
            ],
          ),
        ],
      ),
    );
  }

}