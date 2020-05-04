import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinPage extends StatefulWidget {
  final String phoneNumber;

  PinPage(this.phoneNumber);

  @override
  _PinPageState createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController()
    ..text = "";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: <Widget>[
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                'Código de autorizacion',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ),
                Text(
                  "Ingrese el código enviado al celular:  ",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
            Text(
              widget.phoneNumber,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: PinCodeTextField(
                  length: 5,
                  obsecureText: false,
                  animationType: AnimationType.fade,
                  shape: PinCodeFieldShape.box,
                  animationDuration: Duration(milliseconds: 300),
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 52,
                  fieldWidth: 52,
                  backgroundColor: Theme.of(context).backgroundColor,
                  inactiveColor: Theme.of(context).disabledColor,
                  activeColor: Theme.of(context).disabledColor,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  onCompleted: (v) {
                    print("Procesado");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                )),

            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                hasError ? "* Codigo erroneo" : "",
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: ButtonTheme(
                //Bajar teclado al darle al continuar
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    // conditions for validating
                    if (currentText.length != 5 || currentText != "11111") {
                      //cod pass
                      errorController.add(ErrorAnimationType
                          .shake); // Triggering error shake animation
                      setState(() {
                        hasError = true;
                      });
                    } else {
                      setState(() {
                        hasError = false;
                        scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text("Verificando..."),
                          duration: Duration(seconds: 3),
                        ));
                      });
                    }
                  },
                  child: Center(
                      child: Text(
                    "Continuar",
                    style: Theme.of(context).textTheme.button,
                  )),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 45),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "No resiviste el mensaje? ",
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                      TextSpan(
                          text: " REENVIAR",
                          recognizer: onTapRecognizer,
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16))
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
