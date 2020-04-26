import 'package:LaCoro/presentation/core/ui/app_theme.dart';
import 'package:flutter/cupertino.dart';

class DiscountChip extends StatelessWidget{

  String discountPercentage = "";

  DiscountChip({Key key, this.discountPercentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          child: Text("-$discountPercentage%",
              textAlign: TextAlign.center,
              style: TextStyle(color: greenDark, fontSize: 16)),
        ),
      ),
    );
  }

}