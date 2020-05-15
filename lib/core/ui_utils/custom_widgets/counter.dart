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
              child: Icon(Icons.remove, color: quantity == 0 ? AppColors.greyMedium : AppColors.accentColor, size: 35),
              onTap: quantity < 1 ? null : () => onQuantityChange.call(quantity - 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Text('$quantity', style: TextStyle(color: AppColors.accentColor, fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                    child: Icon(Icons.add, color: AppColors.accentColor, size: 35),
                    onTap: () => onQuantityChange.call(quantity + 1)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
