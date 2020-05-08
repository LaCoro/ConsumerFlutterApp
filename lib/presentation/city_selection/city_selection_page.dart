import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/presentation/city_selection/city_selection_bloc.dart';
import 'package:LaCoro/presentation/store_list/store_list_page.dart';
import 'package:domain/entities/ciity_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class CitySelectionPage extends StatefulWidget {
  static const CITY_SELECTION_ROUTE = '/city_selection';

  @override
  _CitySelectionPageState createState() => _CitySelectionPageState(Injector.getInjector().get());
}

class _CitySelectionPageState extends State<CitySelectionPage> {
  final CitySelectionBloc _bloc;

  CityEntity currentCity;

  _CitySelectionPageState(this._bloc);

  @override
  void initState() {
    setState(() {
      currentCity = _bloc.loadSavedCity();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    List<CityEntity> cityList;
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder(
            bloc: _bloc,
            builder: (context, state) {
              if (state is InitialState) _bloc.add(GetAllCitiesEvent());

              if (state is SuccessState<List<CityEntity>>) cityList = state.data;

              if (state is NavigateState) {
                Navigator.popAndPushNamed(context, StoreListPage.STORE_LIST_ROUTE);
              }

              if (cityList?.isNotEmpty != true) return Center(child: CircularProgressIndicator());

              return Column(
                children: <Widget>[
                  Spacer(),
                  Text("Selecciona ciudad"), //todo usar localizations
                  SizedBox(height: 12),
                  DropdownButton(
                    value: currentCity?.name,
                    items: cityList.map((e) => DropdownMenuItem(value: e.name, child: Text(e.name))).toList(),
                    onChanged: (value) {
                      setState(() {
                        currentCity = cityList.firstWhere((element) => element.name == value);
                      });
                    },
                  ),
                  Spacer(),
                  Container(  //todo sacar esto como un custom widget (PrimaryButton)
                    height: 40,
                    margin: EdgeInsets.symmetric(vertical: 21, horizontal: 24),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      color: Theme.of(context).accentColor,
                      onPressed: currentCity == null
                          ? null
                          : () async {
                              await _bloc.submitCitySelected(currentCity);
                              Navigator.pushReplacementNamed(context, StoreListPage.STORE_LIST_ROUTE);
                            },
                      child: Center(
                          child: Text(
                        strings.continu,
                        style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.white),
                      )),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
