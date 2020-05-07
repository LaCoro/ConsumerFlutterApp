import 'package:LaCoro/presentation/core/adresses/addresses_page.dart';
import 'package:LaCoro/presentation/core/di/app_module.dart';
import 'package:LaCoro/presentation/core/di/store_list_module.dart';
import 'package:LaCoro/presentation/core/localization/app_localizations_delegate.dart';
import 'package:LaCoro/presentation/core/ui/app_theme.dart';
import 'package:LaCoro/presentation/pin_register/pin_page.dart';
import 'package:LaCoro/presentation/register/register_page.dart';
import 'package:LaCoro/presentation/splash/splash.dart';
import 'package:LaCoro/presentation/store_details/store_details_page.dart';
import 'package:LaCoro/presentation/test/styles_test_page.dart';
import 'package:LaCoro/presentation/test/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import 'presentation/core/adresses/select_address_map_page.dart';
import 'presentation/store_list/store_list_page.dart';

Future main() async {
  await AppModule().initialise(Injector.getInjector());
  StoreListModule().initialise(Injector.getInjector());
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
        '/': (BuildContext context) => StylesTestPage(), // TODO change
        StoreListPage.STORE_LIST_ROUTE: (BuildContext context) => StoreListPage(),
        SelectAddressMapPage.SELECT_ADDRESS_MAP_ROUTE: (BuildContext context) => SelectAddressMapPage(),
        StylesTestPage.STYLE_TEST_PAGE_ROUTE: (BuildContext context) => StylesTestPage(),
        AddressesPage.ADDRESSES_LIST_ROUTE: (BuildContext context) => AddressesPage(),
        SplashPage.SPLASH_PAGE_ROUTE: (BuildContext context) => SplashPage(),
        RegisterPage.REGISTER_ROUTE: (BuildContext context) => RegisterPage(),
        TestPage.TEST_PAGE_ROUTE: (BuildContext context) => TestPage(),
      },
    );
  }
}
