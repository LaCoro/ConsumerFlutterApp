import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class CurrentAddress extends StatelessWidget {
  final String address;
  final Function onEditPressed;

  CurrentAddress(this.address, {this.onEditPressed});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Padding(
      padding:
          const EdgeInsets.only(top: 24.0, left: 24, right: 24, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            strings.deliveryAddress,
            style: AppTextStyle.section,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.place, color: Colors.black, size: 24),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 30),
                    child: Text(
                      address,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.black16,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onEditPressed,
                  child: Text(strings.edit, style: AppTextStyle.yellow16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
