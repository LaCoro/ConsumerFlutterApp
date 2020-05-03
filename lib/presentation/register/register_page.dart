import 'package:LaCoro/presentation/core/ui/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget{
  static const REGISTER_ROUTE = '/register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FocusNode _nameFocus;
  FocusNode _emailFocus;
  FocusNode _phoneFocus;

  final _registerFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameFocus = FocusNode();
    _emailFocus = FocusNode();
    _phoneFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _phoneFocus.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _registerFormKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text("Crea tu cuenta para completar el pedido", style: Theme.of(context).textTheme.headline1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese un nombre';
                          }
                          return null;
                        },
                        focusNode: _nameFocus,
                        onEditingComplete: () {
                          _nameFocus.unfocus();
                          FocusScope.of(context).requestFocus(_emailFocus);
                          },
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20)),
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: "Nombre",
                          labelStyle: GoogleFonts.roboto(
                            textStyle: TextStyle(color: _nameFocus.hasFocus ? AppColors.accentColor : Colors.black, fontWeight: FontWeight.w300, fontSize: 16)),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor)),
                            focusColor: AppColors.accentColor,
                            errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: TextFormField(
                        validator: (value) {
                            return value.contains('@') ? null :'Ingrese un correo electrónico válido';
                        },
                        focusNode: _emailFocus,
                        onEditingComplete: () {
                          _emailFocus.unfocus();
                          FocusScope.of(context).requestFocus(_phoneFocus);
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20)),
                        decoration: InputDecoration(
                          suffixText: "(Opcional)",
                          suffixStyle: Theme.of(context).textTheme.caption,
                          isDense: true,
                          labelText: "Correo electrónico",
                          labelStyle: GoogleFonts.roboto(
                              textStyle: TextStyle(color: _emailFocus.hasFocus ? AppColors.accentColor : Colors.black, fontWeight: FontWeight.w300, fontSize: 16)),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor)),
                          focusColor: AppColors.accentColor,
                          errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingrese un teléfono';
                          }
                          return null;
                        },
                        focusNode: _phoneFocus,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20)),
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: "Teléfono",
                          labelStyle: GoogleFonts.roboto(
                              textStyle: TextStyle(color: _phoneFocus.hasFocus ? AppColors.accentColor : Colors.black, fontWeight: FontWeight.w300, fontSize: 16)),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor)),
                          focusColor: AppColors.accentColor,
                          errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(6.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                                    child: Text("Crear cuenta", style: Theme.of(context).textTheme.button),
                                  ),
                                  onPressed: () {
                                    if (_registerFormKey.currentState.validate()) {

                                      Scaffold
                                          .of(context)
                                          .showSnackBar(SnackBar(content: Text('Processing Data')));
                                    }
                                  },
                                  color: AppColors.accentColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}