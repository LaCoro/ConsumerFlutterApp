
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/app_icons.dart';
import 'package:flutter/material.dart';

enum PaymentType { cash, credit, debit }

String getPaymentName(BuildContext context, PaymentType paymentType) {
  final strings = AppLocalizations.of(context);

  switch (paymentType) {
    case PaymentType.cash:
      return strings.cash;
    case PaymentType.credit:
      return strings.creditCard;
    case PaymentType.debit:
      return strings.debitCard;
  }
}


Widget buildPaymentIcon(PaymentType paymentType) {
  switch (paymentType) {
    case PaymentType.cash:
      return Icon(AppIcons.dolar , color: Colors.black, size: 18);
    case PaymentType.credit:
      return Icon(Icons.credit_card, color: Colors.black, size: 40);
    case PaymentType.debit:
      return Icon(Icons.credit_card, color: Colors.black, size: 40);
  }
}