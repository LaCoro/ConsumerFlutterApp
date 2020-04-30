import 'package:LaCoro/presentation/core/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TeperBar extends StatelessWidget {

  final int progress ;
  final int maxStep ;

  const TeperBar(this.progress, this.maxStep) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 31),
        child: StepProgressIndicator(
            totalSteps: maxStep,
            selectedColor: AppColors.yellowAction,
            currentStep: progress,
            padding: 4,
            size: 5,
            roundedEdges: Radius.circular(10)),
      ),
    );
  }
}
