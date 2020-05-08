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

  _CitySelectionPageState(this._bloc);

  @override
  void initState() {
    _bloc.add(LoadSavedCityEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    CityEntity currentCity;
    List<CityEntity> cityList;

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder(
            bloc: _bloc,
            builder: (context, state) {
              if (state is InitialState) _bloc.add(GetAllCitiesEvent());

              if (state is SuccessState<CityEntity>) currentCity = state.data;

              if (state is SuccessState<List<CityEntity>>) cityList = state.data;

              if (state is NavigateState) Navigator.pushNamed(context, StoreListPage.STORE_LIST_ROUTE);

              if (cityList?.isNotEmpty != true) return Center(child: CircularProgressIndicator());

              return Center(
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Text("Selecciona ciudad"), //todo usar localizations
                    SizedBox(height: 12),
                    DropdownButton(
                      value: currentCity,
                      items: cityList.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
                      onChanged: (value) => _bloc.add(SelectCityEvent(value)),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 21, horizontal: 24),
                      child: FlatButton(
                        onPressed: () {},
                        child: Center(
                            child: Text(
                          strings.continu,
                          style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.white),
                        )),
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
