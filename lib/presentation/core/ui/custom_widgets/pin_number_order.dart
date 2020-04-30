import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinNumberOrder extends StatefulWidget {
  final String phoneNumber;

  PinNumberOrder(this.phoneNumber);

  @override
  _PinNumberOrderState createState() => _PinNumberOrderState();
}

class _PinNumberOrderState extends State<PinNumberOrder> {
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 30),
              Container(
                height: MediaQuery.of(context).size.height / 5,
              ),
              // Image.asset(
              //   'assets/verify.png',
              //   height: MediaQuery.of(context).size.height / 3,
              //   fit: BoxFit.fitHeight,
              // ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Código de autorizacion',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: RichText(
                  text: TextSpan(
                      text: "Ingrese el código enviado al celular:  ",
                      children: [
                        TextSpan(
                            text: widget.phoneNumber,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ],
                      style: Theme.of(context).textTheme.headline5),
                  textAlign: TextAlign.center,
                ),
              ),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: PinCodeTextField(
                    length: 5,
                    obsecureText: false,
                    animationType: AnimationType.fade,
                    shape: PinCodeFieldShape.box,
                    animationDuration: Duration(milliseconds: 300),
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 52,
                    fieldWidth: 52,
                    activeFillColor: Colors.white,
                    enableActiveFill: true,
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
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "* Codigo erroneo" : "",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),

              RichText(
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
              SizedBox(
                height: 14,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
                child: ButtonTheme(
                  height: 50,
                  child: FlatButton(
                    onPressed: () {
                      // conditions for validating
                      if (currentText.length != 5 || currentText != "11111") {  //cod pass
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
            ],
          ),
        ),
      ),
    );
  }
}
