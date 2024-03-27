import 'package:LaCoro/app_icons.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../appearance/app_colors.dart';

class SuccessfulOrderBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Container(
      height: 160,
      alignment: Alignment.center,
      color: AppColors.indicatorColor,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(AppIcons.happy, size: 60, color: Colors.white),
            Text(strings.successfulOrder, style: AppTextStyle.boldWhite16),
          ],
        ),
      ),
    );
  }
}
