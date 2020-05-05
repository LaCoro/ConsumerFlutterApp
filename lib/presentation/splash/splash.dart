import 'dart:async';

import 'package:LaCoro/presentation/core/ui/adresses/addresses_page.dart';
import 'package:LaCoro/presentation/store_details/store_details_page.dart';
import 'package:LaCoro/presentation/test/test_page.dart';
import 'package:flutter/material.dart';

import '../core/ui/app_colors.dart';

class SplashPage extends StatefulWidget {

  static const SPLASH_PAGE_ROUTE = '/splash_page';

  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> with TickerProviderStateMixin{

  AnimationController controller;
  Animation<double> animation;

  List<Color> _colors = [AppColors.accentColor, AppColors.accentColor.withOpacity(0.8)];
  List<double> _stops = [0.0, 0.8];


  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    animation = Tween(begin: 0.5, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();

    loadData();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(_createRoute());
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => AddressesPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: _colors,
            stops: _stops,
          ),
          color: AppColors.accentColor,
          image: DecorationImage(
              image: AssetImage('assets/app_logo.png'),
              fit: BoxFit.scaleDown
          ) ,
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