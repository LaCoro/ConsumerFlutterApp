import 'dart:async';

import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:LaCoro/presentation/adresses/my_address_page.dart';
import 'package:LaCoro/presentation/store_list/store_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class SplashPage extends StatefulWidget {
  static const SPLASH_PAGE_ROUTE = '/splash_page';

  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    animation = Tween(begin: 0.5, end: 1.5).animate(controller)..addListener(() => loadData());
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void loadData() async {
    Future.delayed(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    final Preferences pref = Injector.getInjector().get();
    Navigator.popAndPushNamed(context, pref.getProfile()?.address == null ? MyAddressPage.MY_ADDRESS_ROUTE : StoreListPage.STORE_LIST_ROUTE);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [AppColors.accentColor, AppColors.accentColor.withOpacity(0.9)],
          ),
          color: AppColors.accentColor,
          image: DecorationImage(image: AssetImage('assets/app_logo.png'), fit: BoxFit.scaleDown),
        ),
        /*child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.yellowAction),
          ),
        ),*/
      ),
    );
  }
}
