import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class CitySelectionPage extends StatelessWidget {
  static const CITY_SELECTION_ROUTE = '/city_selection';

  @override
  Widget build(BuildContext context) {
    final Preferences preferences = Injector.getInjector().get();



    return Container(
      child: Center(child: Text("Cities")),

    );
  }
}
