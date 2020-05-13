import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../appearance/app_colors.dart';

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                child: Icon(Icons.remove, color: quantity == 0 ? AppColors.greyMedium : AppColors.accentColor, size: 20),
              ),
              onTap: quantity < 1 ? null : () => onQuantityChange.call(quantity - 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Text('$quantity', style: TextStyle(color: AppColors.accentColor, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          GestureDetector(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                child: Icon(Icons.add, color: AppColors.accentColor, size: 20),
              ),
              onTap: () => onQuantityChange.call(quantity + 1)),
        ],
      ),
    );
  }
}
