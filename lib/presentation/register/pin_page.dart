// @dart=2.9
import 'dart:async';

import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/primary_button.dart';
import 'package:LaCoro/presentation/order_detail/order_detail_page.dart';
import 'package:LaCoro/presentation/register/register_bloc.dart';
import 'package:LaCoro/presentation/store_list/store_list_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinPage extends StatefulWidget {
  static const PIN_REGISTER_ROUTE = '/pin_register';

  @override
  _PinPageState createState() => _PinPageState(Injector().get());
}

class _PinPageState extends State<PinPage> {
  final RegisterBloc _bloc;

  _PinPageState(this._bloc);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
  TextEditingController _textEditingController = TextEditingController();
  bool hasError = false;
  bool isLoading = false;

  @override
  void dispose() {
    _bloc.close();
    errorController.close();
    super.dispose();
  }

  @override
  void initState() {
    _bloc.add(SubmitRequestVerificationCodeEvent(_bloc.getProfileInfo().mobile));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(elevation: 0),
      backgroundColor: Theme.of(context).backgroundColor,
      key: scaffoldKey,
      body: BlocListener(
        bloc: _bloc,
        listener: (BuildContext context, state) => handleState(state, context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                strings.authorizationCode,
                style: AppTextStyle.title,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              strings.enterTheCodeSentToTheCellPhone,
              style: AppTextStyle.black16,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              _bloc.getProfileInfo()?.mobile ?? '',
              style: AppTextStyle.w500Black16,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 60,
                    fieldWidth: 60,
                    inactiveColor: Theme.of(context).disabledColor,
                    activeColor: Theme.of(context).disabledColor,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Theme.of(context).backgroundColor,
                  errorAnimationController: errorController,
                  controller: _textEditingController,
                  onCompleted: (v) {
                    print(strings.processing);
                  },
                  onChanged: (String value) {},
                )),
            Text(
              hasError ? strings.wrongCode : "",
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              height: 8,
            ),
            PrimaryButton(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                isLoading: isLoading,
                buttonText: strings.continu,
                onPressed: () {
                  if (_textEditingController.text.length != 6) {
                    errorController.add(ErrorAnimationType.shake); // Triggering error shake animation
                    setState(() {
                      hasError = true;
                    });
                  } else {
                    setState(() {
                      hasError = false;
                      _bloc.add(AuthenticateUserWithSmsEvent(_textEditingController.text, _bloc.getProfileInfo()));
                    });
                  }
                }),
            Spacer(flex: 3),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(text: strings.didntYouGetTheMessage, style: AppTextStyle.black13, children: [
                TextSpan(
                    text: strings.resend,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _bloc.add(SubmitRequestVerificationCodeEvent(_bloc.getProfileInfo().mobile));
                      },
                    style: AppTextStyle.boldBlue13)
              ]),
            ),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }

  void handleState(state, BuildContext context) {
    setState(() => isLoading = state is LoadingState);

    if (state is SuccessState) {
      Navigator.popUntil(
          context, (route) => route.settings.name == OrderDetailPage.ORDER_DETAIL_ROUTE || route.settings.name == StoreListPage.STORE_LIST_ROUTE);
    }

    if (state is ErrorState) {
      setState(() => hasError = true);
      errorController.add(ErrorAnimationType.shake);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message), duration: Duration(seconds: 3)));
    }
  }
}
