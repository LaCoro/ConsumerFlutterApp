import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../appearance/app_colors.dart';

class StepperBar extends StatelessWidget {
  final int progress;
  final String status;
  final int maxStep;

  const StepperBar(this.progress, this.maxStep, this.status);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 31, right: 31, bottom: 24),
            child: StepProgressIndicator(
                totalSteps: maxStep, selectedColor: AppColors.yellowAction, currentStep: progress, padding: 4, size: 5, roundedEdges: Radius.circular(10)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              status,
              style: AppTextStyle.section,
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
