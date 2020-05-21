import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/primary_button.dart';
import 'package:LaCoro/presentation/register/register_bloc.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  static const REGISTER_ROUTE = '/register';

  @override
  _RegisterPageState createState() => _RegisterPageState(Injector.getInjector().get());
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterBloc _bloc;

  _RegisterPageState(this._bloc);

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();

  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  var _phoneController = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void dispose() {
    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();

    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return BlocListener(
        bloc: _bloc,
        listener: (context, state) {
          setState(() => isLoading = state is LoadingState);
        },
        child: Material(
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
                          child: Text(strings.createAccount, style: Theme.of(context).textTheme.headline1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0, bottom: 15.0),
                          child: TextFormField(
                            controller: _nameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return strings.nameRequired;
                              }
                              return null;
                            },
                            autofocus: true,
                            focusNode: _nameFocus,
                            onEditingComplete: () {
                              _fieldFocusChange(context, _nameFocus, _emailFocus);
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20)),
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: strings.name,
                              labelStyle: GoogleFonts.roboto(
                                  textStyle:
                                      TextStyle(color: _nameFocus.hasFocus ? AppColors.accentColor : Colors.black, fontWeight: FontWeight.w300, fontSize: 16)),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor)),
                              errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              return value.contains('@') ? null : strings.invalidEmail;
                            },
                            focusNode: _emailFocus,
                            onEditingComplete: () {
                              _fieldFocusChange(context, _emailFocus, _phoneFocus);
                            },
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20)),
                            decoration: InputDecoration(
                              suffixText: strings.optionalField,
                              suffixStyle: TextStyle(color: AppColors.greyMedium, fontWeight: FontWeight.normal, fontSize: 20),
                              isDense: true,
                              labelText: strings.email,
                              labelStyle: GoogleFonts.roboto(
                                  textStyle:
                                      TextStyle(color: _emailFocus.hasFocus ? AppColors.accentColor : Colors.black, fontWeight: FontWeight.w300, fontSize: 16)),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor)),
                              errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: TextFormField(
                            controller: _phoneController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return strings.phoneRequired;
                              }
                              if (value.length < 10) {
                                return strings.invalidPhone;
                              }
                              return null;
                            },
                            focusNode: _phoneFocus,
                            onEditingComplete: () {
                              _phoneFocus.unfocus();
                            },
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                            style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20)),
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: strings.phone,
                              labelStyle: GoogleFonts.roboto(
                                  textStyle:
                                      TextStyle(color: _phoneFocus.hasFocus ? AppColors.accentColor : Colors.black, fontWeight: FontWeight.w300, fontSize: 16)),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor)),
                              errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 150),
                            transitionBuilder: (child, animation) => ScaleTransition(child: child, scale: animation),
                            child: isLoading
                                ? CircularProgressIndicator()
                                : PrimaryButton(
                                    buttonText: strings.continu,
                                    onPressed: () {
                                      if (_registerFormKey.currentState.validate()) {
                                        _bloc.add(SubmitSaveProfileEvent(UserEntity()
                                          ..fullname = _nameController.text
                                          ..email = _emailController.text
                                          ..phone = _phoneController.text));
                                      }
                                    }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ));
  }
}
