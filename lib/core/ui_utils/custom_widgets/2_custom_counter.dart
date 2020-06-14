import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:flutter/material.dart';

const containerWidth = 100.0;
const containerHeight = 50.0;
const sideButtonWidth = (containerWidth - 14) / 2;

class CounterTouch2 extends StatefulWidget {
  @override
  _CounterTouch2State createState() => _CounterTouch2State();
}

class _CounterTouch2State extends State<CounterTouch2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.accentColor, width: 2),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SideButton(
            icon: Icons.remove,
            touch: 'remove',
          ),
          NumberCounter(),
          SideButton(
            icon: Icons.add,
            touch: 'add',
          ),
        ],
      ),
    );
  }
}

class NumberCounter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('center');
      },
      child: Container(
        color: Colors.white10,
        height: containerHeight,
        width: containerWidth - (sideButtonWidth * 2) - 4,
        child: Center(
            child: Text(
              '0',
              style: AppTextStyle.blue16,
            )),
      ),
    );
  }
}


class SideButton extends StatelessWidget {
  SideButton({@required this.icon, this.touch});

  final IconData icon;
  final String touch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print(touch);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(12),
          ),
          height: containerHeight,
          width: sideButtonWidth,
          child: Icon(icon),
        ));
  }
}
