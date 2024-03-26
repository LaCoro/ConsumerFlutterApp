// @dart=2.9
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final EdgeInsetsGeometry margin;

  bool isLoading;
  Duration duration;

  PrimaryButton({this.buttonText, this.onPressed, this.margin, bool isLoading, Duration duration}) {
    this.duration = duration ?? Duration(milliseconds: 150);
    this.isLoading = isLoading ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 50,
      child: AnimatedSwitcher(
          duration: Duration(milliseconds: 150),
          transitionBuilder: (child, animation) => ScaleTransition(child: child, scale: animation),
          child: isLoading
              ? CircularProgressIndicator()
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).indicatorColor, // Primary color by default
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onPressed: onPressed,
                  child: Center(child: Text(buttonText, style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white))),
                )),
    );
  }
}
