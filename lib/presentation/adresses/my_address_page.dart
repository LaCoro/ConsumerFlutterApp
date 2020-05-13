import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/presentation/adresses/my_address_bloc.dart';
import 'package:LaCoro/presentation/store_list/store_list_page.dart';
import 'package:domain/entities/ciity_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class MyAddressPage extends StatefulWidget {
  static const MY_ADDRESS_ROUTE = '/city_selection';

  @override
  _MyAddressPageState createState() => _MyAddressPageState(Injector.getInjector().get());
}

class _MyAddressPageState extends State<MyAddressPage> {
  final MyAddressBloc _bloc;

  CityEntity currentCity;

  _MyAddressPageState(this._bloc) {
    currentCity = _bloc.loadSavedCity();
  }

  final _addressFocus = FocusNode();
  final _additionalAddressFocus = FocusNode();
  final _addressController = TextEditingController();
  final _additionalAddressController = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _addressFocus.dispose();
    _additionalAddressFocus.dispose();
    _addressController.dispose();
    _additionalAddressController.dispose();
    super.dispose();
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void initState() {
//    setState(() => currentCity = _bloc.loadSavedCity());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    List<CityEntity> cityList;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            if (state is InitialState) _bloc.add(GetAllCitiesEvent());

            if (state is SuccessState<List<CityEntity>>) cityList = state.data;

            if (state is NavigateState) {
              Navigator.popAndPushNamed(context, StoreListPage.STORE_LIST_ROUTE);
            }

            if (cityList?.isNotEmpty != true) return Center(child: CircularProgressIndicator());

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Expanded(child: Text(strings.myAddressTitle, style: AppTextStyle.title)),
                  SizedBox(height: 12),
                  Expanded(
                    child: DropdownButton(
                      value: currentCity?.name,
                      items: cityList.map((e) => DropdownMenuItem(value: e.name, child: Text(e.name))).toList(),
                      onChanged: (value) {
                        setState(() {
                          currentCity = cityList.firstWhere((element) => element.name == value);
                        });
                      },
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: TextFormField(
                      controller: _addressController,
                      focusNode: _addressFocus,
//                      onEditingComplete: () {
//                        _fieldFocusChange(context, _addressFocus, _phoneFocus);
//                      },
                      textInputAction: TextInputAction.next,
                      style: AppTextStyle.black16,
                      decoration: InputDecoration(
                        suffixText: strings.optionalField,
                        suffixStyle: AppTextStyle.grey16,
                        isDense: true,
                        labelText: strings.city,
                        labelStyle: AppTextStyle.black16.copyWith(color: _addressFocus.hasFocus ? AppColors.accentColor : Colors.black),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor)),
                        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                  ),
                  Container(
                    //todo sacar esto como un custom widget (PrimaryButton)
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
                  ),
                ],
              ),
            );
          }),
    );
  }
}
