
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget{

  final String buttonText;
  final Function onPressed;

  PrimaryButton({this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 24),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        color: Theme.of(context).accentColor,
        onPressed: onPressed,
        child: Center(
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.white),
            )),
      ),
    );
  }

}