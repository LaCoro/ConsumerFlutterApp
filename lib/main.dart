import 'package:LaCoro/core/di/app_module.dart';
import 'package:LaCoro/core/di/city_selection_module.dart';
import 'package:LaCoro/core/di/store_list_module.dart';
import 'package:LaCoro/core/localization/app_localizations_delegate.dart';
import 'package:LaCoro/presentation/order_detail/order_detail_page.dart';
import 'package:LaCoro/presentation/adresses/addresses_page.dart';
import 'package:LaCoro/presentation/city_selection/city_selection_page.dart';
import 'package:LaCoro/presentation/register/register_page.dart';
import 'package:LaCoro/presentation/splash/splash.dart';
import 'package:LaCoro/presentation/store_details/store_details_page.dart';
import 'package:LaCoro/presentation/test/styles_test_page.dart';
import 'package:LaCoro/presentation/test/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import 'core/appearance/app_theme.dart';
import 'presentation/adresses/select_address_map_page.dart';
import 'presentation/store_list/store_list_page.dart';

Future main() async {
  // Inject modules
  await AppModule().initialise(Injector.getInjector());
  StoreListModule().initialise(Injector.getInjector());
  CitySelectionModule().initialise(Injector.getInjector());

  // start app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      debugShowCheckedModeBanner: false,
      title: 'LaCoro',
      theme: AppTheme.build(),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        Widget destinationRoute = SplashPage();
        switch (settings.name) {
          case StoreDetailsPage.STORE_DETAILS_ROUTE:
            destinationRoute = StoreDetailsPage();
            break;
        }
        return MaterialPageRoute(builder: (context) => destinationRoute, settings: settings);
      },
      routes: {
        '/': (BuildContext context) => SplashPage(),
        StoreListPage.STORE_LIST_ROUTE: (BuildContext context) => StoreListPage(),
        SelectAddressMapPage.SELECT_ADDRESS_MAP_ROUTE: (BuildContext context) => SelectAddressMapPage(),
        StylesTestPage.STYLE_TEST_PAGE_ROUTE: (BuildContext context) => StylesTestPage(),
        AddressesPage.ADDRESSES_LIST_ROUTE: (BuildContext context) => AddressesPage(),
        SplashPage.SPLASH_PAGE_ROUTE: (BuildContext context) => SplashPage(),
        RegisterPage.REGISTER_ROUTE: (BuildContext context) => RegisterPage(),
        CitySelectionPage.CITY_SELECTION_ROUTE: (BuildContext context) => CitySelectionPage(),
        OrderDetailPage.ORDER_DETAIL_ROUTE: (BuildContext context) => OrderDetailPage(),
        TestPage.TEST_PAGE_ROUTE: (BuildContext context) => TestPage(),
      },
    );
  }
}
