import 'package:LaCoro/presentation/core/ui/app_theme.dart';
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("\$8.000",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                      Text("\$16.000",
                          style: TextStyle(fontSize: 20, color: graySubtitle, decoration: TextDecoration.lineThrough)),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: 56.0,
                          height: 23.0,
                          child: Container(
                            decoration: new BoxDecoration(
                              color: greenLight,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(6.0)),
                            ),
                            child: Text("-50%",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: greenDark, fontSize: 16)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              child: Image.network("https://www.liberaldictionary.com/wp-content/uploads/2018/11/pizza.jpg", height: 120, width: 90),
            ),
          ),
        ],
      ),
    );
  }

}