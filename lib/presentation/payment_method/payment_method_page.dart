// @dart=2.9
import 'package:LaCoro/core/enums/payment_type.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  PaymentType _method = PaymentType.credit;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.paymentMethod),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, top: 20),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: PaymentType.values.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(
                "${getPaymentName(context,PaymentType.values[i])}",
              ),
              trailing: Radio(
                value: PaymentType.values[i],
                groupValue: _method,
                onChanged: (PaymentType value) {
                  setState(() {
                    _method = value;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
