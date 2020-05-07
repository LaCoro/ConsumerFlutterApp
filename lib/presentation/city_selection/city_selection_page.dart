import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:data/models/city.dart';
import 'package:domain/entities/ciity_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class CitySelectionPage extends StatefulWidget {
  static const CITY_SELECTION_ROUTE = '/city_selection';

  @override
  _CitySelectionPageState createState() => _CitySelectionPageState();
}

class _CitySelectionPageState extends State<CitySelectionPage> {
  final Preferences preferences = Injector.getInjector().get();
  CityEntity _cityEntity;

  @override
  void initState() {
    setState(() => _cityEntity = preferences.getCity());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CityEntity>>(
        future: City().getAll().then((value) => value.results.map((e) => e as CityEntity).toList()),
        builder: (context, snapshot) {
          return Scaffold(
            body: Container(
              child: Center(
                child: snapshot.data == null ? Text("Fetching city list...") : Text(snapshot.data.map((e) => e.name).join(',')),
              ),
            ),
          );
        });
  }
}
