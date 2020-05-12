import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantOrderDetails extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                  "https://www.liberaldictionary.com/wp-content/uploads/2018/11/pizza.jpg",
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Arepa Burguer",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.boldTextColor),
                      textAlign: TextAlign.start,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "40 min",
                              style: AppTextStyle.black13,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(width: 5),
                            Text("-", style: AppTextStyle.black13),
                            SizedBox(width: 5),
                            Text(
                              "Envio \$3.500",
                              style: AppTextStyle.black13,
                              textAlign: TextAlign.start,
                            )
                          ])),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}