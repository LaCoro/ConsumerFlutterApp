// @dart=2.9
import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:flutter/material.dart';

const containerWidth = 100.0;
const containerHeight = 50.0;
const sideButtonWidth = (containerWidth - 14) / 2;

class CounterTouch extends StatelessWidget {
  /// the initial value of the stepper
  final int initialValue;

  /// called whenever the value of the stepper changed
  final ValueChanged<int> onChanged;

  const CounterTouch({Key? key, this.initialValue, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      decoration: BoxDecoration(border: Border.all(color: AppColors.indicatorColor, width: 2), borderRadius: BorderRadius.circular(12)),
      child: Wrap(
        direction: Axis.vertical,
        children: <Widget>[
          SideButton(
            onTap: initialValue < 1 ? () {} : () => onChanged(initialValue - 1),
            icon: Icons.remove,
          ),
          NumberCounter(text: initialValue.toString()),
          SideButton(
            onTap: initialValue >= 999 ? () {} : () => onChanged(initialValue + 1),
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}

class NumberCounter extends StatelessWidget {
final Function() onTap;
  final String text;

  const NumberCounter({Key? key, this.onTap, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        color: Colors.transparent,
        height: containerHeight,
        child: Center(child: Text(text, style: AppTextStyle.accent18)),
      ),
    );
  }
}

class SideButton extends StatelessWidget {
  SideButton({@required this.icon, this.onTap});

  final IconData icon;
final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.onTap,
        child: Container(
          color: Colors.transparent,
          height: containerHeight,
          width: sideButtonWidth,
          child: Icon(
            icon,
            color: onTap == null ? AppColors.greyMedium : AppColors.indicatorColor,
          ),
        ));
  }
}
