import 'package:LaCoro/presentation/core/adresses/select_address_map_page.dart';
import 'package:LaCoro/presentation/core/localization/app_localizations.dart';
import 'package:LaCoro/presentation/core/ui/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressesPage extends StatelessWidget {
  static const ADDRESSES_LIST_ROUTE = '/addresses_list';

  final addresses = ['Avenida siempre viva # 786', 'Carrera 40 # 87N -60'];

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
            icon: const Icon(Icons.clear, color: Colors.blue, size: 30),
            onPressed: () {},
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
        child: Column(
          children: <Widget>[
            Text(strings.addOrChooseAnAddress, style: Theme.of(context).textTheme.headline1),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                shadowColor: AppColors.greyMedium,
                elevation: 2,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: TextField(
                      decoration: InputDecoration(
                        hintText: strings.searchYourAddress,
                        hintStyle: Theme.of(context).textTheme.caption,
                        prefixIcon: Icon(Icons.search, color: AppColors.greyMedium, size: 24),
                        suffixIcon: Icon(Icons.cancel, color: Colors.black, size: 24),
                        border: OutlineInputBorder(),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      keyboardType: TextInputType.text,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Divider(thickness: 1, color: AppColors.divider),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, SelectAddressMapPage.SELECT_ADDRESS_MAP_ROUTE),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.place, color: Colors.black, size: 24),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        strings.useMyLocation,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Expanded(
                      child: Align(alignment: Alignment.centerRight, child: Icon(Icons.chevron_right, color: Colors.black, size: 24)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 15.0),
              child: Divider(thickness: 8, color: AppColors.greyLight),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Align(alignment: Alignment.centerLeft, child: Text(strings.myAddresses, style: Theme.of(context).textTheme.headline5)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    trailing: Icon(Icons.check_circle, color: AppColors.accentColor, size: 24),
                    title: Text('${addresses[index]}', style: Theme.of(context).textTheme.bodyText1),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
