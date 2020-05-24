import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/primary_button.dart';
import 'package:LaCoro/presentation/register/pin_page.dart';
import 'package:LaCoro/presentation/register/register_bloc.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  static const REGISTER_ROUTE = '/register';

  @override
  _RegisterPageState createState() =>
      _RegisterPageState(Injector.getInjector().get());
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterBloc _bloc;

  _RegisterPageState(this._bloc);

  final _registerFormKey = GlobalKey<FormState>();
  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();

  bool isLoading = false;
  TextEditingController _nameController, _emailController, _phoneController;

  @override
  void initState() {
    final profile = _bloc.getProfileInfo();
    setState(() {
      _nameController = TextEditingController(text: profile?.fullname);
      _emailController = TextEditingController(text: profile?.email);
      _phoneController = TextEditingController(text: profile?.phone);
    });
    super.initState();
  }

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

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
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

        if (state is SuccessState)
          Navigator.pushNamed(context, PinPage.PIN_REGISTER_ROUTE);
      },
      child: Scaffold(
        appBar: AppBar(elevation: 0),
        body: Material(
          child: Form(
              key: _registerFormKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Spacer(
                        flex: 1,
                      ),
                      Text(strings.createAccount, style: AppTextStyle.title),
                      SizedBox(height: 20.0),
                      TextFormField(
//                            cursorColor: AppColors.accentColor,
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
                        style: AppTextStyle.black16,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: strings.name,
                          hintText: 'Enter Your Name',
                          labelStyle: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: _nameFocus.hasFocus
                                      ? AppColors.accentColor
                                      : Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.accentColor)),
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          return value.contains('@')
                              ? null
                              : strings.invalidEmail;
                        },
                        focusNode: _emailFocus,
                        onEditingComplete: () {
                          _fieldFocusChange(context, _emailFocus, _phoneFocus);
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        style: AppTextStyle.black16,
                        decoration: InputDecoration(
                          suffixText: strings.optionalField,
                          suffixStyle: TextStyle(
                              color: AppColors.greyMedium,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                          isDense: true,
                          labelText: strings.email,
                          hintText: 'Enter Your Email',
                          labelStyle: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: _emailFocus.hasFocus
                                      ? AppColors.accentColor
                                      : Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.accentColor)),
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
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
                        style: AppTextStyle.black16,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: strings.phone,
                          hintText: 'Enter Your Phone',
                          labelStyle: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: _phoneFocus.hasFocus
                                      ? AppColors.accentColor
                                      : Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.accentColor)),
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                        ),
                      ),
                      PrimaryButton(
                          margin: const EdgeInsets.symmetric(vertical: 24.0),
                          isLoading: isLoading,
                          buttonText: strings.continu,
                          onPressed: () {
                            if (_registerFormKey.currentState.validate()) {
                              _bloc.add(SubmitSaveProfileEvent(UserEntity()
                                ..fullname = _nameController.value.text
                                ..email = _emailController.value.text
                                ..phone = _phoneController.value.text));
                            }
                          }),
                      SizedBox(height: 70,),

                      Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
