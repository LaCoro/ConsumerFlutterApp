import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinNumberOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.centerLeft,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Código de autorizacion",style: Theme.of(context).textTheme.headline1,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Text("Ingresa el código enviado al celular +333 333 3333",style: Theme.of(context).textTheme.headline5,
              ),
            ),
            PinCodeTextField(
              length: 6,
              obsecureText: false,
              animationType: AnimationType.fade,
              shape: PinCodeFieldShape.box,
              animationDuration: Duration(milliseconds: 300),
              borderRadius: BorderRadius.circular(5),            fieldHeight: 50,
              fieldWidth: 40,
              onChanged: (value) {
                setState(() {
                  currentText = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
