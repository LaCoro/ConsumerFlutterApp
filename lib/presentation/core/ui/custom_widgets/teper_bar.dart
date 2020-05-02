import 'package:LaCoro/presentation/core/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TeperBar extends StatelessWidget {
  final int progress;
  final String status;
  final int maxStep;

  const TeperBar(this.progress, this.maxStep, this.status);

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
                totalSteps: maxStep,
                selectedColor: AppColors.yellowAction,
                currentStep: progress,
                padding: 4,
                size: 5,
                roundedEdges: Radius.circular(10)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              status,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
