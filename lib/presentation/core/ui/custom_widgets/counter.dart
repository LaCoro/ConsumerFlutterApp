import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class Counter extends StatelessWidget {
  final int quantity;
  final Function(int) onQuantityChange;

  Counter({Key key, this.quantity, this.onQuantityChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColors.accentColor),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: quantity == 0 ? Icon(Icons.remove, color: AppColors.greyMedium, size: 20) : Icon(Icons.remove, color: AppColors.accentColor, size: 20),
                ),
                onTap: quantity < 1 ? null : () => onQuantityChange.call(quantity - 1)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text('$quantity', style: TextStyle(color: AppColors.accentColor, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(Icons.add, color: AppColors.accentColor, size: 20),
                ),
                onTap: () => onQuantityChange.call(quantity + 1)),
          ],
        ),
      ),
    );
  }
}
