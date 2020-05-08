
import 'package:LaCoro/presentation/core/localization/app_localizations.dart';
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
  return "";
}


Widget buildPaymentIcon(PaymentType paymentType) {
  switch (paymentType) {
    case PaymentType.cash:
      return Icon(Icons.local_atm, color: Colors.black, size: 40);
    case PaymentType.credit:
      return Icon(Icons.credit_card, color: Colors.black, size: 40);
    case PaymentType.debit:
      return Icon(Icons.credit_card, color: Colors.black, size: 40);
  }
}