import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:flutter/material.dart';

class OrderStatusBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Container(
      color: AppColors.accentColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: Container(
          height: 34,
          child: Row(
            children: <Widget>[
              Text(
                strings.yourOrderIsInProgress,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Expanded(
                child: Container(),
              ),
              FlatButton(
                onPressed: () {},
                child: Center(
                    child: Text(
                  strings.seeOrder,
                  style: Theme.of(context).textTheme.button,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
