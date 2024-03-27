import 'package:LaCoro/app_icons.dart';
import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/enums/payment_type.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  final PaymentType pay;
 final Function()? onChangePressed;

  PaymentMethod(this.pay, {this.onChangePressed});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            strings.paymentMethod,
            style: AppTextStyle.section,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: buildPaymentIcon(pay),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 24),
                    child: Text("${getPaymentName(context, pay)}",
                        maxLines: 2, textAlign: TextAlign.left, overflow: TextOverflow.ellipsis, style: AppTextStyle.black16),
                  ),
                ),

                     GestureDetector(
                        onTap: onChangePressed,
                        child: Text(
                          strings.change,
                          style: AppTextStyle.black16.copyWith(color: onChangePressed != null ? AppColors.yellowAction : AppColors.greyMedium),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
