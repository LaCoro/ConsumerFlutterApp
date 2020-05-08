import 'package:LaCoro/app_icons.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class SuccessfulOrderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Container(
      height: 160,
      alignment: Alignment.center,
      color: AppColors.accentColor,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Spacer(),
            Icon(AppIcons.happy, size: 60, color: Colors.white),
            Spacer(flex: 3),
            Text(strings.successfulOrder, style: Theme.of(context).textTheme.headline2),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
