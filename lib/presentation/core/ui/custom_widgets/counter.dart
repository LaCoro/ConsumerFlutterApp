import 'package:LaCoro/presentation/core/ui/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CounterState();
}

class CounterState extends State<Counter> {
  int n = 0;

  void add() {
    setState(() {
      n++;
    });
  }

  void minus() {
    setState(() {
      if (n != 0) n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: accentColor),
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
                  child: n == 0 ? Icon(Icons.remove, color: graySubtitle, size: 20) : Icon(Icons.remove, color: accentColor, size: 20),
                ),
                onTap: minus),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text('$n', style: TextStyle(color: accentColor, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(Icons.add, color: accentColor, size: 20),
                ),
                onTap: add),
          ],
        ),
      ),
    );
  }
}