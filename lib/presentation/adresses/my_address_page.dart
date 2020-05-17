import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/primary_button.dart';
import 'package:LaCoro/presentation/adresses/my_address_bloc.dart';
import 'package:LaCoro/presentation/store_list/store_list_page.dart';
import 'package:domain/entities/ciity_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  String  _currentAddress = "";

  _MyAddressPageState(this._bloc) {
    currentCity = _bloc.loadSavedCity();
  }

  final _addressFocus = FocusNode();
  final _additionalAddressFocus = FocusNode();
  final _addressController = TextEditingController();
  final _additionalAddressController = TextEditingController();

  List<CityEntity> cityList;

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
    setState(() {
      return currentCity = _bloc.loadSavedCity();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(elevation: 0),
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
                  Expanded(child: Text(strings.myAddressTitle, style: AppTextStyle.title)),
                  GestureDetector(
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              title:Text("Elige tu ciudad", style: AppTextStyle.section),
                              content: citiesDialog(),
                            );
                          }
                      );
                    },
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(currentCity?.name == null ? strings.city : currentCity.name, style: AppTextStyle.black16),
                          Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 24)
                        ],
                      ),
                    )
                  ),
                  SizedBox(height:60.0),
                  Expanded(
                    child: TextFormField(
                      controller: _addressController,
                      focusNode: _addressFocus,
                      onChanged: (value) {
                        setState(() {
                          _currentAddress = value;
                        });
                        if (value.isEmpty) {
                          return strings.addressIsRequired;
                        }
                        return null;
                      },
                      onEditingComplete: () => _fieldFocusChange(context, _addressFocus, _additionalAddressFocus),
                      textInputAction: TextInputAction.next,
                      style: AppTextStyle.black16,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: strings.address,
                        labelStyle: AppTextStyle.black16.copyWith(color: _addressFocus.hasFocus ? AppColors.accentColor : Colors.black),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor)),
                        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _additionalAddressController,
                      focusNode: _additionalAddressFocus,
                      onEditingComplete: () => _additionalAddressFocus.unfocus(),
                      textInputAction: TextInputAction.next,
                      style: AppTextStyle.black16,
                      decoration: InputDecoration(
                        suffixText: strings.optionalField,
                        suffixStyle: AppTextStyle.grey16,
                        isDense: true,
                        labelText: strings.additionalAddressInfo,
                        labelStyle: AppTextStyle.black16.copyWith(color: _addressFocus.hasFocus ? AppColors.accentColor : Colors.black),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor)),
                        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                  ),
                  Spacer(),
                  PrimaryButton(
                      buttonText: strings.continu,
                      onButtonPressed: currentCity == null || _currentAddress.isEmpty
                      ? null
                      : () async {
                        await _bloc.submitCitySelected(currentCity);
                        Navigator.pushReplacementNamed(
                            context, StoreListPage.STORE_LIST_ROUTE);
                      }
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget citiesDialog() {
    return Container(
      height: 200.0,
      width: 200.0,
      child: ListView.separated(
              separatorBuilder: (c, i) => SizedBox(height: 12.0),
              itemBuilder: (c, index) {
                return InkWell(
                    onTap: () => {
                      setState((){
                        currentCity = cityList[index];
                      }),
                      Navigator.of(context, rootNavigator: true).pop(),
                    },
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(cityList[index].name, style: AppTextStyle.black16),
                          currentCity?.name == cityList[index].name ? Icon(Icons.check_circle, color: AppColors.accentColor, size: 22) : SizedBox()
                        ]),
                    ),
                );
              },
              itemCount: cityList?.length ?? 0)

    );
  }
}
