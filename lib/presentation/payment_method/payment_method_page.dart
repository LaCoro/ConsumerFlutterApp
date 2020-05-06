import 'package:LaCoro/presentation/core/enums/payment_type.dart';
import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  PaymentType _method = PaymentType.credit;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Metodo de Pago"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, top: 20),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: PaymentType.values.length,
          itemBuilder: (context, posicion) {
            return ListTile(
              title: Text("${getPaymentName(PaymentType.values[posicion])}",),
              trailing: Radio(
                value: PaymentType.values[posicion],
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


